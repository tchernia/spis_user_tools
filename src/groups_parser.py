import xml.etree.ElementTree as ET

class groups_parser:
	"""
	This class creates an object associated with a groups.xml file in a SPIS simulation. It contains useful tools allowing to edit them
	automatically, such as device automatic creation in loops.
	"""
	def __init__(self, groups_file_path):
		"""
		Create the object using the path to the groups.xml file.
		"""
		self.path = global_parameter_file_path
		self.tree = ET.parse(global_parameter_file_path)
		self.root = self.tree.getroot()
		reference_group_path = '../data/groups_with_devices.xml'
		reference_tree = ET.parse(reference_group_path)
		self.reference_root = reference_tree.getroot() #Contains the xml tree of a reference file containing instruments
		reference_property_name = "Instrument: Electrons Particle Detector-1"
		
	def get_reference_instrument_node(self):
		"""
		This function allows to get a node describing an instrument from the reference groups file. This node can then be modified
		and included in another groups.xml file.
		"""
		reference_group_path = '../data/groups_with_devices.xml'
		reference_tree = ET.parse(reference_group_path)
		self.reference_root = reference_tree.getroot() #Contains the xml tree of a reference file containing instruments
		reference_property_name = "Instrument: Electrons Particle Detector-1"
		
	@staticmethod
	def get_value_from_name(current_node, carac_name): 
		""" 
		Look for the carac of name carac_name in the tree from current_node     and returns its value. This 
		function is recursive. 
		 """ 
		print("Entering get_value_from_name for node:") 
		print(current_node) 
		result = None 
		for under_node in current_node: 
			if under_node.tag == 'name': 
				print("-----------------Found a node with tag name-------------------") 
				print("Corresponding name: "+str(under_node.text)) 
			if str(under_node.text) == carac_name: 
				print("\n") 
				print("----------------FOUND A NODE CORRESPONDING WITH CARAC NAME------------------") 
				print("\n") 
				for under_node2 in current_node: 
					if under_node2.tag == 'value': 
						result = under_node2.text 
						break 
		if result == None: #No matching name found. Apply function recursively 
			for under_node in current_node: 
				result = get_value_from_name(under_node, carac_name) 
				if result != None: 
					break 
		return result
		
	@staticmethod
	def set_value_from_name(current_node, carac_name, new_value): 
		""" 
		Look for the carac of name carac_name in the tree from current_node and returns its value. This 
		function is recursive. 
		 """ 
		print("Entering get_value_from_name for node:") 
		print(current_node) 
		found = False 
		for under_node in current_node: 
			if under_node.tag == 'name': 
				print("-----------------Found a node with tag name-------------------") 
				print("Corresponding name: "+str(under_node.text)) 
			if str(under_node.text) == carac_name: 
				print("\n") 
				print("----------------FOUND A NODE CORRESPONDING WITH CARAC NAME------------------") 
				print("\n") 
				for under_node2 in current_node: 
					if under_node2.tag == 'value': 
						under_node2.text = new_value
						found = True
						break 
		if found == False: #No matching name found. Apply function recursively 
			for under_node in current_node: 
				found = set_value_from_name(under_node, carac_name, new_value) 
				if found != False: 
					break 
		return found
		
	def save_to_path(self, save_path):
		"""
		Takes the current group tree and saves it to the given path.
		"""
		self.tree.write(save_path)
