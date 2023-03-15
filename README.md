# spis_user_tools
A set of tools in python to help spis users automate project creation, in particular particle detectors

# How to use

If you are a user and you want to use the tools in this repository to automate spis project creation or result interpretation, here are a few things you could want to know:

* You need python 3 installed to use the tool, and run them in a terminal.
* Tools are composed of an editable part and a static part, clearly recognizable in python files. Editable parts include path to spis projects you want to interact with.
* The relevant python librairies are netCDF4, matplotlib, numpy, scipy. Make sure they are all installed before using the tools.

# Architecture
The src folder contains all the python classes allowing to build the tools. The tests folder contains unit test files and functional test files for classes and tools, including the input files. The tools folder contains the tools to use as a user to automate spis project creation.

# Contents
The tools for spis project creation automation include:

* Automatic groups.xml modification to include electron particle detectors defined as devices.
* Automatic globalParameters.xml modification from ambiant plasma conditions, including automatic time steps computing and some decision_helping tools
* Automatic ParticleDetectorX.xml modification in a loop
* Post-processing and visualisation alternative tools, including united visualisation from a detector composed of a large number of independant detection surfaces.
