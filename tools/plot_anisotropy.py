from distribution_function_3d import *
import matplotlib.pyplot as plt
from matplotlib.colors import BoundaryNorm
from matplotlib.ticker import MaxNLocator

drift_distribution_filename = 'Channel_4_elec1_Angular2DF_at_t=1.0E-5s.txt'
isotropic_distribution_filename = 'Channel_4_elec1_Angular2DF_at_t=9.972284E-5s.txt'

distrib = DistributionFunction3D(isotropic_distribution_filename)

print("energy_array:")
print(distrib.energy_array)

anisotropy_energy_func = distrib.anisotropy()

plt.plot(anisotropy_energy_func[0],anisotropy_energy_func[1])
plt.savefig('anisotropy_energy_func.png')
plt.clf()

anisotropy_phi_func = distrib.anisotropy_variable_phi()

plt.plot(anisotropy_phi_func[0],anisotropy_phi_func[1])
plt.savefig('anisotropy_phi_func.png')
plt.clf()

energy_distrib = distrib.energyDF()
print("energy_distrib[1]:")
print(energy_distrib[1])
maxwellian_distrib_list = [distrib.maxwellian_energy_distrib(21.37,E) for E in energy_distrib[0]]
print("Maxwellian distrib list:")
print(maxwellian_distrib_list)
maxwellian_distrib = np.array(maxwellian_distrib_list)
print("Maxwellian distrib:")
print(maxwellian_distrib)

plt.plot(energy_distrib[0],energy_distrib[1])
plt.plot(energy_distrib[0],maxwellian_distrib)
plt.savefig('energy_distrib.png')
plt.clf()

velocity_distrib = distrib.velocityDF()

plt.plot(velocity_distrib[0],velocity_distrib[1])
plt.savefig('velocity_distrib.png')
plt.clf()

angular_distrib = distrib.angular_distribution()
fig, ax = plt.subplots()
ax.pcolormesh(distrib.theta_array, distrib.phi_array, angular_distrib, vmin=np.min(angular_distrib), vmax=np.max(angular_distrib), shading='auto')
plt.savefig('angular_distrib.png')
plt.clf()





