"""
This file aims to check the integrity of a .geo file to be used in SPIS software. In particular, it looks for surfaces defined as physical surfaces, surfaces used in surface loops associated with a physical volume, and check which are in one category and not the other, thus creating an inconsistency.
Here, surfaces are identified as strings: if a surface is identified both by a string and a number in the file, this script will not detect it and understand that it is the same surface. Beware when using this tool.

Beware: If the physical volume is the concatenation of several non-physical volumes, the contact surfaces between volumes will be defined but have no match with physical surfaces. They will be found in surface_loops dictionary but not in  physical_surfaces without creating any inconsistency. However they will appear two times in surface_loops rather than only one (in two different surface loops). Surfaces defining volumes contained in physical volumes should either appear once and have a matching physical surface or appear in two different volumes.

Two dictionaries are defined when parsing:
- One dictionary "physical_surfaces" in which the keys are the strings identifying the physical surfaces and the values are the list of the corresponding surface string identifiers included in the physical surface.
- One dictionary "surface_loops" in which the keys are the strings indentifying the surface loops and the values are the list of the surface string identifiers included in the surface loops.
"""
import re

class geo_file_integrity_checker:
	def uniformize_string_id(self,raw_string_id):
		"""
		This function takes a raw string id, either a string between double quotes or a number defined as a number or as a formula, and returns its corresponding string identifier in
		dictionaries.
		"""
		string_id = ''
		if len(raw_string_id.split('"')) == 3: #String id is a string between double quotes. Keep the value between quotes as string id.
			string_id = raw_string_id.split('"')[1]
		else: #String id is a number, defined either as a number os as a formule. In this case we remove space to detect inconsistency more efficiently
			#print("ENtering else part")
			string_id = raw_string_id.replace(' ', '')
			string_id = raw_string_id.replace('\n', '')
			string_id = raw_string_id.replace('\t','')
			string_id = raw_string_id.replace('\r','')
			string_id.strip()
			string_id = re.sub(r'[\s\n]', '', string_id)
		return string_id
		
	def remove_start_end_comments(self,line,reading):
		"""
		This function removes parts between comments /* and */ in a line, returning the line without comments. reading is a boolean that indicates if we are currently in comment at the 			beginning of line.
		Also return the new reading value at the end of line.
		Also remove everything after // if // is not inside a /* */ area.
		"""
		result = ''
		new_reading = reading
		if not reading:
			split = line.split('*/')
			if len(split) > 1:
				new_reading = len(split[-1].split('/*')) == 1 #No start comment delimiter after the last end comment delimiter in the line if True
				for k in range(1,len(split)):
					current_uncommented_part = split[k].split('/*')[0]
					if len(current_uncommented_part.split('//')) > 1: #A line comment is detected outside comment areas. Don't take anything left in the line into account.
						result += current_uncommented_part.split('//')[0]
						new_reading = True #Any /* after // is ignored so reading if forced to True.
						break
					else:
						result += current_uncommented_part
			
		else:
			split = line.split('/*')
			if len(split) == 1: #No start comment delimiter. Returns the line as is but removes everythin after potential // and do not toggle reading.
				result = line.split('//')[0]
			if len(split) > 1:
				new_reading = len(split[-1].split('*/')) > 1 #An end comment delimiter is detected after the last start comment delimiter if True.
				result = split[0].split('//')[0]
				if len(split[0].split('//')) > 1:  #A line comment is detected outside comment areas. Don't take anything left in the line into account.
					new_reading = True
					return [result,new_reading]
				for k in range(1,len(split)):
					current_uncommented_part = ''
					if len(split[k].split('*/')) > 1: #MOve out of the comment area. We consider thee is only one */, otherwise it would not be geo compliant.
						current_uncommented_part = split[k].split('*/')[1]
					if len(current_uncommented_part.split('//')) > 1: #A line comment is detected outside comment areas. Don't take anything left in the line into account.
						result += current_uncommented_part.split('//')[0]
						new_reading = True #Any /* after // is ignored so reading if forced to True.
						break
					else:
						result += current_uncommented_part
				
		return [result,new_reading]
		
	def remove_prefix(self,text, prefix):
    		if text.startswith(prefix):
        		return text[len(prefix):]
    		return text  # or whatever

	
	def __init__(self, geo_file_path):
		self.geo_file_path = geo_file_path
		
		self.physical_volume_string = ''
		self.volume_strings = [] #Volume ids defined in the unique Physical Volume
		self.volumes = {} #Keys are volume ids, Values are surface loops ids
		self.physical_surfaces_strings = []
		self.physical_surfaces = {} #Keys are physical surfaces ids, Values are surfaces ids
		self.surface_loops = {} #Keys are surface loop ids, values are surfaces ids
		
		self.surfaces_in_both_surface_loop_and_physical_surfaces = set() #Surfaces with one occurence in surface loops and one in physical surfaces. These are the compliant surfaces
		self.surfaces_in_two_surface_loops = set() #Surfaces in two different surface loops. Should be empty unless physical volume is made of several volume, and define boundary between volumes in this case
		self.isolated_surfaces_in_surface_loops = set() #Surfaces defined in surface loops but not in physical surfaces. Should be empty.
		self.isolated_surfaces_in_physical_surfaces = set() #Surfaces defined in physical surfaces but not in surface loops. Should be empty.
		self.surfaces_in_several_physical_surfaces = set() #Surfaces defined in several physical surfaces. Should be empty.
		self.surfaces_in_too_many_surface_loops = set() #Surfaces defined in 3 or more surface loops. Should be empty.
		self.bad_surfaces = set() #Contains all other errors. Should be empty.
		
		reading = True #Boolean that is false when reading file between comment symbols /* and */, true otherwise
		line_number = 0
		
		geo_file_for_lines = open(geo_file_path,'r')
		geo_file_lines = line = geo_file_for_lines.readlines()
		geo_file = open(geo_file_path,'r')
		
		for line in geo_file:
			line_number += 1
			#Problem can occur when using several comment delimiters in the same line. Please ensure that you avoid this situation.
			if not reading: #Between comment delimiters at the beginning of line
				line, reading = self.remove_start_end_comments(line,reading)
			if reading: 
				#Get rid of comments
				line, reading = self.remove_start_end_comments(line,reading) #Note that this function is called after the parts after // is removed
				first_split = line.split('(')
				if first_split[0] == "Physical Volume":
					#Get the string identifier of the physical volume
					line = self.remove_prefix(line,"Physical Volume(")
					if len(line.split('"')) > 1:
						raw_string_id = line.split('"')[1]
					elif len(line.split("'")) > 1:
						raw_string_id = line.split("'")[1]
					else:
						raw_string_id = line.split(')')[0]
					string_id = self.uniformize_string_id(raw_string_id)		
						
					#Check that this is the first Physical Volume defined. There should not be to or this is a fatal inconsistency.
					if self.physical_volume_string == '': #Not yet defined
						self.physical_volume_string = string_id
					else: #Already defined: fatal inconsistency
						print("FATAL INCONSISTENCY: several physical volumes are defined: "+self.physical_volume_string+" and "+string_id)
						break
						
					closing_brace_detected = len(line.split('{')[-1].split('}')) > 1
					#Get the corresponding volumes and put them in volume string
					between_braces = line.split('{')[-1].split('}')[0] #Keep only the part between braces
					additional_line_number = 0
					internal_reading = reading
					while not closing_brace_detected:
						additional_line_number += 1
						internal_line = geo_file_lines[line_number+additional_line_number-1]
						print("internal line:")
						print(internal_line)
						if not internal_reading:
							if len(internal_line.split('*/')) > 1: #Comment end delimiter detected
								internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
								#internal_line = internal_line.split('*/')[-1]
								#internal_reading = True
						if internal_reading:
							internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
							closing_brace_detected = len(internal_line.split('}')) > 1
							between_braces += internal_line.split('}')[0] #Full line if no } detected
					print("Between braces for physical volume "+string_id+":")
					print(between_braces)
							 
					raw_volume_ids = between_braces.split(',')
					for raw_volume_id in raw_volume_ids:
						if self.uniformize_string_id(raw_volume_id) != '':
							self.volume_strings.append(self.uniformize_string_id(raw_volume_id))
												
				elif first_split[0] == "Volume":
					#Get the string identifier of the volume
					line = self.remove_prefix(line,"Volume(")
					if len(line.split('"')) > 1:
						raw_string_id = line.split('"')[1]
					elif len(line.split("'")) > 1:
						raw_string_id = line.split("'")[1]
					else:
						raw_string_id = line.split(')')[0]
					string_id = self.uniformize_string_id(raw_string_id)
					self.volumes[string_id] = [] #Initialize the list of surface loops of the volume		
						
					#Get the corresponding surface loops and put them in volume string
					closing_brace_detected = len(line.split('{')[-1].split('}')) > 1
					#Get the corresponding volumes and put them in volume string
					between_braces = line.split('{')[-1].split('}')[0] #Keep only the part between braces
					additional_line_number = 0
					internal_reading = reading
					while not closing_brace_detected:
						additional_line_number += 1
						internal_line = geo_file_lines[line_number+additional_line_number-1]
						print("New internal line considered in Volume creation:")
						print(internal_line)
						print("Internal reading: "+str(internal_reading))
						if not internal_reading:
							if len(internal_line.split('*/')) > 1: #Comment end delimiter detected
								internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
								#internal_line = internal_line.split('*/')[-1]
								#internal_reading = True
						if internal_reading:
							internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
							print("SPlit of }: ")
							print(internal_line.split('}'))
							closing_brace_detected = len(internal_line.split('}')) > 1
							between_braces += internal_line.split('}')[0] #Full line if no } detected
					print("Part between braces for volume:")
					print(between_braces)
					raw_surface_loop_ids = between_braces.split(',')
					for raw_surface_loop_id in raw_surface_loop_ids:
						if self.uniformize_string_id(raw_surface_loop_id) != '':
							self.volumes[string_id].append(self.uniformize_string_id(raw_surface_loop_id))
							print("raw surface loop id:")
							print(raw_surface_loop_id)
							print("uniformized surface loop id:")
							print(self.uniformize_string_id(raw_surface_loop_id))
						
				elif first_split[0] == "Physical Surface":
					#Get the string identifier of the physical surface
					line = self.remove_prefix(line,"Physical Surface(")
					raw_string_id = ''
					if len(line.split('"')) > 1:
						raw_string_id = line.split('"')[1]
					elif len(line.split("'")) > 1:
						raw_string_id = line.split("'")[1]
					else:
						raw_string_id = line.split(')')[0]
					string_id = self.uniformize_string_id(raw_string_id)
					self.physical_surfaces[string_id] = [] #Initialize the list of surfaces of the physical surface
					self.physical_surfaces_strings.append(string_id)	
						
					#Get the corresponding surface loops and put them in volume string
					closing_brace_detected = len(line.split('{')[-1].split('}')) > 1
					#Get the corresponding volumes and put them in volume string
					between_braces = line.split('{')[-1].split('}')[0] #Keep only the part between braces
					additional_line_number = 0
					internal_reading = reading
					while not closing_brace_detected:
						additional_line_number += 1
						internal_line = geo_file_lines[line_number+additional_line_number-1]
						if not internal_reading:
							if len(internal_line.split('*/')) > 1: #Comment end delimiter detected
								internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
								#internal_line = internal_line.split('*/')[-1]
								#internal_reading = True
						if internal_reading:
							internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
							closing_brace_detected = len(internal_line.split('}')) > 1
							between_braces += internal_line.split('}')[0] #Full line if no } detected
					raw_surface_ids = between_braces.split(',')
					for raw_surface_id in raw_surface_ids:
						if self.uniformize_string_id(raw_surface_id) != '':
							self.physical_surfaces[string_id].append(self.uniformize_string_id(raw_surface_id))
						
				elif first_split[0] == "Surface Loop":
					line = self.remove_prefix(line,"Surface Loop(")
					#Get the string identifier of the surface loop
					if len(line.split('"')) > 1:
						raw_string_id = line.split('"')[1]
					elif len(line.split("'")) > 1:
						raw_string_id = line.split("'")[1]
					else:
						raw_string_id = line.split(')')[0]
					string_id = self.uniformize_string_id(raw_string_id)
					self.surface_loops[string_id] = [] #Initialize the list of surfaces of the physical surface		
						
					#Get the corresponding surface loops and put them in volume string
					closing_brace_detected = len(line.split('{')[-1].split('}')) > 1
					#Get the corresponding volumes and put them in volume string
					between_braces = line.split('{')[-1].split('}')[0] #Keep only the part between braces
					additional_line_number = 0
					internal_reading = reading
					while not closing_brace_detected:
						additional_line_number += 1
						internal_line = geo_file_lines[line_number+additional_line_number-1]
						if not internal_reading:
							if len(internal_line.split('*/')) > 1: #Comment end delimiter detected
								internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
								#internal_line = internal_line.split('*/')[-1]
								#internal_reading = True
						if internal_reading:
							internal_line, internal_reading = self.remove_start_end_comments(internal_line,internal_reading)
							closing_brace_detected = len(internal_line.split('}')) > 1
							between_braces += internal_line.split('}')[0] #Full line if no } detected
					raw_surface_ids = between_braces.split(',')
					for raw_surface_id in raw_surface_ids:
						if self.uniformize_string_id(raw_surface_id) != '':
							self.surface_loops[string_id].append(self.uniformize_string_id(raw_surface_id))

		
		print("Volume strings:")
		print(self.volume_strings)
		print("")
		print("Volume surface loops:")
		print(self.volumes)
		print("")
		print("Surfaces in physical surfaces")
		print(self.physical_surfaces)
		print("")
		print("Surfaces in surface loops")
		print(self.surface_loops)
		print("")
		
		#Once the file has been parsed, list all the relevant surfaces contained in relevant surface loops and physical surfaces
		surfaces_in_surface_loops = []
		surfaces_in_physical_surfaces = []
		
		for volume_id in self.volume_strings:
			for surface_loop in self.volumes[volume_id]:
				for surface in self.surface_loops[surface_loop]:
					surfaces_in_surface_loops.append(surface)
					
		for physical_surface_id in self.physical_surfaces_strings:
			for surface in self.physical_surfaces[physical_surface_id]:
				surfaces_in_physical_surfaces.append(surface)
				
		surfaces_in_surface_loops_set = set(surfaces_in_surface_loops)
		surfaces_in_physical_surfaces_set = set(surfaces_in_physical_surfaces)
		
		#Get surfaces in 3 or more surface loops (errors)
		for surface in surfaces_in_surface_loops_set:
			if surfaces_in_surface_loops.count(surface) > 2:
				self.surfaces_in_too_many_surface_loops.add(surface)
				
		#Get surfaces in 2 or more physical surfaces (errors)
		for surface in surfaces_in_physical_surfaces_set:
			if surfaces_in_physical_surfaces.count(surface) > 1:
				self.surfaces_in_several_physical_surfaces.add(surface)
				
		#Get surfaces in 2 surface loops
		for surface in surfaces_in_surface_loops_set:
			if surfaces_in_surface_loops.count(surface) == 2:
				self.surfaces_in_two_surface_loops.add(surface)
				
		#Get surfaces in 2 surface loops and physical surfaces (errors)
		self.bad_surfaces = self.surfaces_in_two_surface_loops.intersection(surfaces_in_physical_surfaces_set)
		
		#Remove obtained physical surfaces from double surface loops
		self.surfaces_in_two_surface_loops = self.surfaces_in_two_surface_loops - self.bad_surfaces
		
		#Get valid surfaces, in both surface loops and physical surfaces
		self.surfaces_in_both_surface_loop_and_physical_surfaces = ((((surfaces_in_surface_loops_set.intersection(surfaces_in_physical_surfaces_set) - self.surfaces_in_too_many_surface_loops) - self.surfaces_in_several_physical_surfaces) - self.surfaces_in_two_surface_loops) - self.bad_surfaces)
		
		#Get isolated surfaces in surface loops 
		self.isolated_surfaces_in_surface_loops = ((surfaces_in_surface_loops_set - self.surfaces_in_too_many_surface_loops) - self.surfaces_in_two_surface_loops) - surfaces_in_physical_surfaces_set
		
		#Get isolated surfaces in physical surfaces
		self.isolated_surfaces_in_physical_surfaces = (surfaces_in_physical_surfaces_set - self.surfaces_in_several_physical_surfaces) - surfaces_in_surface_loops_set	
				
	def print_checkup(self):
		"""
		This function checks the global consistency and prints the result
		"""
		print("Start consistency checkup for file "+self.geo_file_path+":")
		
		print("Here are the list of nominal matching surfaces, contained once in surface loops and once in physical surfaces:")
		print(self.surfaces_in_both_surface_loop_and_physical_surfaces)
		print("")
		
		if len(self.surfaces_in_too_many_surface_loops) == 0:
			print("No surfaces are included 3 times or more in surface loops: ok")
			print("")
		else:
			print("ERROR: At least one surface is included 3 times or more in surface loops. Check the corresponding list of surfaces below:")
			print(self.surfaces_in_too_many_surface_loops)
			print("")
			
		if len(self.surfaces_in_several_physical_surfaces) == 0:
			print("No surfaces are included 2 times in physical surfaces: ok")
			print("")
		else:
			print("ERROR: At least one surface is included 2 times or more in physical surfaces. Check the corresponding list of surfaces below:")
			print(self.surfaces_in_several_physical_surfaces)
			print("")
			
		if len(self.bad_surfaces) == 0:
			print("No surfaces are included 2 times in surface loops and at least once in physical groups at the same time: ok")
			print("")
		else:
			print("ERROR: At least one surface is included 2 times in surface loops and at least once in physical groups at the same time. Check the corresponding list of surfaces below:")
			print(self.bad_surfaces)
			print("")
			
		if len(self.surfaces_in_two_surface_loops) == 0:
			print("No surfaces are included 2 times in surface loops, this corresponds to a case with only one volume constituting physical volume: ok")
			print("")
		else:
			print("At least one surface is included 2 times in surface loops, this corresponds to a case with several volumes constituting physical volume: ok. Check the corresponding list of surfaces below, they should form the boundaries between volumes:")
			print(self.surfaces_in_two_surface_loops)
			print("")
			
		if len(self.isolated_surfaces_in_surface_loops) == 0:
			print("No surfaces in surface loop with no equivalent in physical surfaces: ok")
			print("")
		else:
			print("ERROR: At least one surface defined in surface loops have no equivalent in physical surfaces. Check the corresponding list of surfaces below.")
			print("")
			
		if len(self.isolated_surfaces_in_physical_surfaces) == 0:
			print("No surfaces in physical surfaces with no equivalent in surface loops: ok")
			print(self.isolated_surfaces_in_surface_loops)
			print("")
		else:
			print("ERROR: At least one surface defined in physical surfaces have no equivalent in surface loops. Check the corresponding list of surfaces below.")
			print(self.isolated_surfaces_in_physical_surfaces)
			print("")
