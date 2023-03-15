import netCDF4 as nc
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import f

class instrument_angular_distrib:
	def __init__(self, distrib_path):
		ds = nc.Dataset(distrib_path)
		data = ds['dataArray'][:]
		self.dimension = int(np.sqrt(len(data)))
		self.distrib = data.reshape(self.dimension,self.dimension)
		print(self.distrib)
	
	def snedecor_test(self, distribution, variable):
		"""
		This function tests if the variable ('phi' or 'theta') has an influence on the measured distribution. phi is the second variable (between -pi/2 and pi/2) and theta is the first
		variable (between 0 and 2*pi).
		"""
		phi_number = distribution.shape[1]
		theta_number = distribution.shape[0]
		average = sum(sum(distribution))/(theta_number*phi_number)
		print('average: '+str(average))
		averages_phi = sum(distribution)/theta_number
		print('averages_phi: ')
		print(averages_phi)
		averages_theta = sum(distribution.transpose())/phi_number
		print('averages_theta: ')
		print(averages_theta)
		SCR = -1.0
		SCA = -1.0
		SCT = sum(sum((distribution-average)**2))
		result = -1.0
		if variable == 'phi':
			SCA = theta_number*sum((averages_phi - average)**2)
			SCR = sum(sum((distribution-averages_phi)**2))
			f_realisation = (SCA/(phi_number-1))/(SCR/(theta_number*phi_number-phi_number)) #Should follow a snedecor law with dimension-1, dimension**2-dimension degrees of freedom
			print('f_realisation: '+str(f_realisation))
			result = f.sf(f_realisation, phi_number - 1 , theta_number*phi_number - phi_number)
		elif variable == 'theta':
			SCA = phi_number*sum((averages_theta - average)**2)
			SCR = sum(sum((distribution.transpose()-averages_theta)**2))
			f_realisation = (SCA/(self.dimension-1))/(SCR/(theta_number*phi_number-theta_number)) #Should follow a snedecor law with dimension-1, dimension**2-dimension degrees of freedom
			print('f_realisation: '+str(f_realisation))
			result = f.sf(f_realisation, theta_number - 1 , theta_number*phi_number - theta_number)
		
		print('SCA: '+str(SCA))
		print('SCR: '+str(SCR))
		print('SCT: '+str(SCT))
		return result
		
	
	def p_value(self, variable):
		return self.snedecor_test(self.distrib,variable)
		
	def p_value_square(self,variable):
		average = sum(sum(self.distrib))/self.dimension**2
		return self.snedecor_test((self.distrib-average)**2,variable)
