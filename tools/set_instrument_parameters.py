import parse_instrument_xml as parser

project_path = '../PEACE_In_Plasma/PEACE_In_Plasma_Good_Mesh_Backup.spis5/'
model_path = '../PEACE_In_Plasma/PEACE_In_Plasma_Good_Mesh.spis5/'
instrument_file_complement = 'DefaultStudy/Simulations/Run1/DefaultInstruments/ParticleDetector_'
instrument_common_extension = '.xml'

#Reference channel info
channel_number = 3
channel_pop = 'elec1'

#Parameters to set to each detector
theta = 0.0
phi = 0.0
output_level = 1
sample_period = 0.001
observation_duration = 1.0e-4
use_log_scale_energy = 0
use_log_scale_value = 0
power_moment_value = 0



instrument_parsers = []

for k in range(12):
	instrument_parsers.append(parser.global_parameter_parser(project_path+instrument_file_complement+str(k)+instrument_common_extension))
	#Copy some parameters from elec1 channel
	channel_number = 1
	while instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect1_X') == "ERROR":
		channel_number+=1
	instrument_parsers[k].replace_global_parameter_value('instrument_OutBasisVect1_X',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect1_X'))
	instrument_parsers[k].replace_global_parameter_value('instrument_OutBasisVect1_Y',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect1_Y'))
	instrument_parsers[k].replace_global_parameter_value('instrument_OutBasisVect1_Z',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect1_Z'))
	instrument_parsers[k].replace_global_parameter_value('instrument_OutBasisVect2_X',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect2_X'))
	instrument_parsers[k].replace_global_parameter_value('instrument_OutBasisVect2_Y',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect2_Y'))
	instrument_parsers[k].replace_global_parameter_value('instrument_OutBasisVect2_Z',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_OutBasisVect2_Z'))
	instrument_parsers[k].replace_global_parameter_value('instrument_AcceptanceAngle_Alpha',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_AcceptanceAngle_Alpha'))
	instrument_parsers[k].replace_global_parameter_value('instrument_AcceptanceAngle_Beta',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_AcceptanceAngle_Beta'))
	instrument_parsers[k].replace_global_parameter_value('instrumentEintervalNb',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrumentEintervalNb'))
	instrument_parsers[k].replace_global_parameter_value('instrumentEmin',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrumentEmin'))
	instrument_parsers[k].replace_global_parameter_value('instrumentEmax',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrumentEmax'))
	instrument_parsers[k].replace_global_parameter_value('instrument_NbOctreeMax',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_NbOctreeMax'))
	instrument_parsers[k].replace_global_parameter_value('instrument_NbPartMax',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_NbPartMax'))
	instrument_parsers[k].replace_global_parameter_value('instrument_Mode',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_Mode'))
	instrument_parsers[k].replace_global_parameter_value('instrument_EnergySlice',instrument_parsers[k].read_global_parameter_value('Channel_'+str(channel_number)+'_'+channel_pop+'_instrument_EnergySlice'))
	#Set other parameters from input values
	instrument_parsers[k].replace_global_parameter_value('instrument_LocalBasis_theta',theta)
	instrument_parsers[k].replace_global_parameter_value('instrument_LocalBasis_phi',phi)
	instrument_parsers[k].replace_global_parameter_value('instrumentOutputLevel',output_level)
	instrument_parsers[k].replace_global_parameter_value('instrumentSamplePeriod',sample_period)
	instrument_parsers[k].replace_global_parameter_value('instrumentObservationDuration',observation_duration)
	instrument_parsers[k].replace_global_parameter_value('instrument_UseLogScale_Energy',use_log_scale_energy)
	instrument_parsers[k].replace_global_parameter_value('instrument_UseLogScale_Value',use_log_scale_value)
	instrument_parsers[k].replace_global_parameter_value('instrument_OcTreeHeuristic_PowerMomentValue', power_moment_value)

	#Correct the output file from xml library to make it compliant with SPIS. Use a compliant model for that and produce a mix between generated xml and SPIS-compliant xml
	model_file = open(model_path+instrument_file_complement+str(k)+instrument_common_extension,'r')
	modified_file = open(project_path+instrument_file_complement+str(k)+instrument_common_extension,'r')
	output_file_string = '' #Initiate a string that will concatenate the contents of the output file.
	model_line = model_file.readline()
	modified_line = modified_file.readline()
	while model_line:
		if (model_line == '  <name></name>\n') or (model_line == '  <description></description>\n') or (model_line == '  <category></category>\n') or (model_line == '      <description>second rotation angle from output basis (around Y&apos;) to local acceptance basis</description>\n') or (model_line == '</org.keridwen.modelling.global.parameters.GlobalParametersList>\n'):
			output_file_string += model_line
		else:
			output_file_string += modified_line
		model_line = model_file.readline()
		modified_line = modified_file.readline()
	output_file = open(project_path+instrument_file_complement+str(k)+instrument_common_extension,'w')
	output_file.write(output_file_string)
	
