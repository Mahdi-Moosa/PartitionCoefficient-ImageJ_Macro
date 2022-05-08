# PartitionCoefficient-ImageJ-Macro

This macro opens ImageJ file with fluorescence images of droplets, 
identifies droplets and background fluorescence. It generates two outputs:
1. CSV file with background statistics
2. CSV file with statistics of all identified droplets.

# BatchRun.ijm

This macro runs the run("Partition Coefficient Macro Image Stat") macro on all files of the selected folder. Please make sure that the run("Partition Coefficient Macro Image Stat") command works.
See comments at the top of BatchRun.ijm file (on how to install the Partition Coefficient Macro Image Stat macro).

# PartitionCoefficient_Calculate.py
Python script to calculate partition coefficient from droplet intensity and background intensity data (saved by "Partition_Coefficient_Macro_Image_Stat.ijm" macro).
