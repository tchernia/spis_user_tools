import numpy as np

class DistributionFunction3D:

	def __init__(self,angular_distrib_file_name):
		"""
		Creates a distribution function 3D object storing a 3D numpy array after parsing the txt file exported by SPIS particle instrument.
		"""
		angular_distrib_file = open(angular_distrib_file_name,'r')

		angular_distrib_file.readline()

		theta_list = []
		phi_list = []
		energy_list = []

		current_line = angular_distrib_file.readline()

		while current_line[0] != '[':
			phi_list.append(float(current_line))
			#print("New phi:")
			#print(float(current_line))
			current_line = angular_distrib_file.readline()

		current_line = angular_distrib_file.readline()

		while current_line[0] != '[':
			theta_list.append(float(current_line))
			#print("New theta:")
			#print(float(current_line))

			current_line = angular_distrib_file.readline()
		current_line = angular_distrib_file.readline()

		while current_line[0] != '[':
			energy_list.append(float(current_line))
			#print("New energy:")
			#print(float(current_line))
			current_line = angular_distrib_file.readline()

		df_list = []

		for energy in range(len(energy_list)):
			df_list.append([])
			transposed_df_list = []
			for phi in range(len(phi_list)):
				current_line = angular_distrib_file.readline()
				current_line_list = current_line.split(' ')
				df_list[-1].append([])
				#transposed_df_list.append([])
				for theta in range(len(theta_list)):
					df_list[-1][-1].append(float(current_line_list[theta]))
					#transposed_df_list[-1].append(float(current_line_list[phi]))
			#current_df_array = np.transpose(np.array(transposed_df_list))
			#for phi in range(len(phi_list)):
			#	df_list[-1].append([])
			#	for theta in range(len(theta_list)):
			#		df_list[-1][-1].append(current_df_array[phi][theta])
				
			current_line = angular_distrib_file.readline()

		self.energy_array = np.array(energy_list)
		self.phi_array = np.array(phi_list)
		self.theta_array = np.array(theta_list)
		self.distribution_function_array = np.array(df_list)

	def velocityDF(self):
		"""
		Returns a list of two one-row arrays of same length, the first one containing the energies and the second one containing the corresponding distribution function.
		"""
		electron_mass = 9.1e-31
		velocity_list = []
		velocity_df_list = []
		for energy_index in range(len(self.energy_array)):
			energy = self.energy_array[energy_index]
			velocity = np.sqrt(2.0*energy/electron_mass)
			velocity_list.append(velocity)
			integral_distrib = 0.0
			for theta in range(len(self.theta_array)-1):
				#Add integration values for phi = -pi/2 and phi = pi/2
				integral_distrib += self.distribution_function_array[energy_index][0][theta]*np.cos(self.phi_array[0])*(self.phi_array[1]-self.phi_array[0])/2.0*2.0*np.pi/(len(self.theta_array)-1)
				integral_distrib += self.distribution_function_array[energy_index][-1][theta]*np.cos(self.phi_array[-1])*(self.phi_array[-1]-self.phi_array[-2])/2.0*2.0*np.pi/(len(self.theta_array)-1)
				for phi in range(1,len(self.phi_array)-1):
					integral_distrib += self.distribution_function_array[energy_index][phi][theta]*np.cos(self.phi_array[phi])*(self.phi_array[phi+1]-self.phi_array[phi-1])/2.0*2.0*np.pi/(len(self.theta_array)-1)
			if velocity != 0.0:
				velocity_df_list.append(integral_distrib/(4.0*np.pi*velocity**2)) #Conversion to PSD
			else:
				velocity_df_list.append(0.0)
		result = []
		result.append(np.array(velocity_list))
		result.append(np.array(velocity_df_list))
		return result

	def energyDF(self):
		"""
		Returns a list of two one-row arrays of same length, the first containing the velocity norms and the second containing the corresponding distribution function PSD
		"""
		velocity_df_array = self.velocityDF()[1]
		elementary_charge = 1.6e-19
		electron_mass = 9.1e-31
		energy_df_list = []
		for energy_index in range(len(self.energy_array)):
			energy = self.energy_array[energy_index]
			velocity = np.sqrt(2.0*energy*elementary_charge/electron_mass)
			if velocity == 0.0:
				energy_df_list.append(0.0)
			else:
				energy_df_list.append(4*np.pi*velocity*velocity_df_array[energy_index]/electron_mass)
		result = []
		result.append(self.energy_array)
		result.append(np.array(energy_df_list))
		return result

	def angular_distribution(self):
		"""
		This function returns the average distribution in angle, after integration over the velocities. The rows represent phi angle while the columns represent theta angle.
		"""
		velocity_array = self.velocityDF()[0]
		angular_distribution_list = []
		for phi in range(len(self.phi_array)):
			angular_distribution_list.append([])
			for theta in range(len(self.theta_array)):
				integral_over_velocities = 0.0
				integral_over_velocities += self.distribution_function_array[0][phi][theta]*velocity_array[0]**2*(velocity_array[1]-velocity_array[0])/2.0
				integral_over_velocities += self.distribution_function_array[-1][phi][theta]*velocity_array[-1]**2*(velocity_array[-1]-velocity_array[-2])/2.0
				for velocity_index in range(1,len(velocity_array)-1):
					velocity = velocity_array[velocity_index]
					integral_over_velocities += self.distribution_function_array[velocity_index][phi][theta]*velocity**2*(velocity_array[velocity_index+1]-velocity_array[velocity_index-1])/2.0
				angular_distribution_list[-1].append(integral_over_velocities)
		return np.array(angular_distribution_list)

	def anisotropy(self):
		"""
		This function measures the average anisotropy as functions of energies; that is, the ratio between the standard deviation of the distribution function values as function 
		of angles and the average value of the distribution at that energy. It is a list of two arrays, the first being energies an the second the corresponding anisotropy value.
		"""
		energy_df_array = self.energyDF()[1]
		anisotropy_list = []
		for energy in range(len(self.energy_array)):
			number_angles = len(self.phi_array)*len(self.theta_array)
			average_distribution = energy_df_array[energy]/number_angles
			square_difference_sum = 0.0
			for phi in range(len(self.phi_array)):
				for theta in range(len(self.theta_array)):
					square_difference_sum += (self.distribution_function_array[energy][phi][theta]-average_distribution)**2
			standard_deviation = np.sqrt(square_difference_sum/number_angles)
			if average_distribution == 0.0:
				anisotropy_list.append(0.0)
			else:
				anisotropy_list.append(standard_deviation/average_distribution)
		result = []
		result.append(self.energy_array)
		result.append(np.array(anisotropy_list))
		return result

	def anisotropy_variable_phi(self):
		"""
		This function is used to evaluate the phi dependancy of the numerical noise. Distribution function is integrated over energies, and then the standard deviation as a function of theta is 			computed for each phi.
		"""
		velocity_array = self.velocityDF()[0]
		angular_df_array = self.angular_distribution()
		anisotropy_list = []
		for phi in range(len(self.phi_array)):
			#Compute average distribution as a function of phi
			sum_distrib = 0.0
			for theta in range(len(self.theta_array)-1):
				sum_distrib += angular_df_array[phi][theta]*2.0*np.pi/(len(self.theta_array)-1)
			average_distribution = sum_distrib/2.0*np.pi
			square_difference_sum = 0.0
			for theta in range(len(self.theta_array)):
				square_difference_sum += (angular_df_array[phi][theta]-average_distribution)**2
			standard_deviation = np.sqrt(square_difference_sum/(len(self.theta_array)-1))
			if average_distribution == 0.0:
				anisotropy_list.append(0.0)
			else:
				anisotropy_list.append(standard_deviation/average_distribution)
		result = []
		result.append(self.phi_array)
		result.append(np.array(anisotropy_list))
		return result

	def maxwellian_energy_distrib(self,T,E):
		"""
		Static method returning the value of the energy distribution at energy E for an isotropic Maxwellian of temperature T. T and E are both in eV.
		"""
		elementary_charge = 1.6e-19
		return 2.0*np.sqrt(1/(elementary_charge*T))**3*np.sqrt(E*elementary_charge/np.pi)*np.exp(-E/T)
