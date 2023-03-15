import xml.etree.ElementTree as ET

class global_parameter_parser:
	def __init__(self, global_parameter_file_path):
		self.path = global_parameter_file_path
		self.tree = ET.parse(global_parameter_file_path)
		self.root = self.tree.getroot()
		self.type_dict = {'float' : 3, 'long' : 4, 'double' : 5, 'int' : 6, 'boolean' : 7, 'string' : 8}
		self.path = global_parameter_file_path

	def read_global_parameter_value(self, global_parameter_string):
		parameter_index = 0
		for child in self.root:
			if self.root[parameter_index][0].text == global_parameter_string:
				key_index = 0
				if self.root[parameter_index][2].text == 'double':
					for grand_child in self.root[parameter_index]:
						if grand_child.tag == 'valueAsDouble':
							return float(self.root[parameter_index][key_index].text)
						key_index += 1
				elif self.root[parameter_index][2].text == 'int':
					for grand_child in self.root[parameter_index]:
						if grand_child.tag == 'valueAsInt':
							return int(self.root[parameter_index][key_index].text)
						key_index += 1
				elif self.root[parameter_index][2].text == 'String':
					for grand_child in self.root[parameter_index]:
						if grand_child.tag == 'valueAsString':
							return self.root[parameter_index][key_index].text
						key_index += 1
				else:
					return self.root[parameter_index][self.type_dict[self.root[parameter_index][2]]]
			parameter_index += 1
		return "ERROR"

	def replace_global_parameter_value(self, global_parameter_string, new_value):
		parameter_index = 0
		for child in self.root:
			if self.root[parameter_index][0].text == global_parameter_string:
				key_index = 0
				if self.root[parameter_index][2].text == 'double':
					for grand_child in self.root[parameter_index]:
						if grand_child.tag == 'valueAsDouble':
							self.root[parameter_index][key_index].text = str(new_value)
							break
						key_index += 1
				elif self.root[parameter_index][2].text == 'int':
					for grand_child in self.root[parameter_index]:
						if grand_child.tag == 'valueAsInt':
							self.root[parameter_index][key_index].text = str(new_value)
							break
						key_index += 1
				elif self.root[parameter_index][2].text == 'String':
					for grand_child in self.root[parameter_index]:
						if grand_child.tag == 'valueAsString':
							self.root[parameter_index][key_index].text = str(new_value)
							break
						key_index += 1
			parameter_index += 1
		self.tree.write(self.path, encoding='us-ascii', xml_declaration=None, default_namespace=None, method='xml', *, short_empty_elements=False)
