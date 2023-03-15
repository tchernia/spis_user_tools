import netCDF4 as nc
import numpy as np
import matplotlib.pyplot as plt

class spis_output:
	def __init__(self, spis_project_path):
		"""
		Create a spis output objects from the path to the spis project file. Get relevant time series from netCDF files and compute main simulation results using them.
		"""
		output_position_str = "/DefaultStudy/Simulations/Run1/OutputFolder/DataFieldExtracted/"
		self.potential_ds = nc.Dataset(spis_project_path+output_position_str+"Spacecraft_average_surface_potential_V_versus_time_s_(the_ones_on_top_of_node_0).nc")
		self.elec1_current_ds = nc.Dataset(spis_project_path+output_position_str+"Collected_current_A_versus_time_s_elec1,_node_0.nc")
		self.ions1_current_ds = nc.Dataset(spis_project_path+output_position_str+"Collected_current_A_versus_time_s_ions1,_node_0.nc")
		self.collected_photocurrent_ds = nc.Dataset(spis_project_path+output_position_str+"Collected_current_A_versus_time_s_photoElec,_node_0.nc")
		self.collected_secondcurrent_bs_ds = nc.Dataset(spis_project_path+output_position_str+"Collected_current_A_versus_time_s_secondElec_BS_from_ambiant_electrons,_node_0.nc")
		self.collected_secondcurrent_true_ds = nc.Dataset(spis_project_path+output_position_str+"Collected_current_A_versus_time_s_secondElec_True_from_ambiant_electrons,_node_0.nc")
		self.emitted_photocurrent_ds = nc.Dataset(spis_project_path+output_position_str+"Emitted_current_A_versus_time_s_photoElectron,_all_nodes,_.nc")
		self.emitted_secondcurrent_ds = nc.Dataset(spis_project_path+output_position_str+"Emitted_current_A_versus_time_s_secondary_electrons_from_Ambiant_Electrons,_node_0.nc")
		
	def print_averages(self):
		"""
		Average all datasets over the last ten times and print the results
		"""
		potential_data = self.potential_ds['dataArray'][:]
		potential = sum(potential_data[90:100])/10
		print("Potential: "+str(potential))
		
		elec1_current_data = self.elec1_current_ds['dataArray'][:]
		elec1_current = sum(elec1_current_data[90:100])/10
		print("Elec1 collected current: "+str(elec1_current))
		
		ions1_current_data = self.ions1_current_ds['dataArray'][:]
		ions1_current = sum(ions1_current_data[90:100])/10
		print("Ions1 collected current: "+str(ions1_current))
		
		collected_photocurrent_data = self.collected_photocurrent_ds['dataArray'][:]
		collected_photocurrent = sum(collected_photocurrent_data[90:100])/10
		print("Collected photocurrent: "+str(collected_photocurrent))
		
		collected_secondcurrent_bs_data = self.collected_secondcurrent_bs_ds['dataArray'][:]
		collected_secondcurrent_bs = sum(collected_secondcurrent_bs_data[90:100])/10
		print("Collected secondcurrent BS: "+str(collected_secondcurrent_bs))
		
		collected_secondcurrent_true_data = self.collected_secondcurrent_true_ds['dataArray'][:]
		collected_secondcurrent_true = sum(collected_secondcurrent_true_data[90:100])/10
		print("Collected secondcurrent True: "+str(collected_secondcurrent_true))
		
		emitted_photocurrent_data = self.emitted_photocurrent_ds['dataArray'][:]
		emitted_photocurrent = sum(emitted_photocurrent_data[90:100])/10
		print("Emitted photocurrent: "+str(emitted_photocurrent))
		
		emitted_secondcurrent_data = self.emitted_secondcurrent_ds['dataArray'][:]
		emitted_secondcurrent = sum(emitted_secondcurrent_data[90:100])/10
		print("Emitted secondcurrent: "+str(emitted_secondcurrent))
		
