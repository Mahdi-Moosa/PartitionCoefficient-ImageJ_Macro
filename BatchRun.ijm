// This macro will run the "Partition_Coefficient_Macro_Image_Stat.ijm" command on all files of the selected folder. File names should start with "Image" and end with ".czi"
// To successfully run this code, you need to copy-paste the "Partition_Coefficient_Macro_Image_Stat.ijm" macro to the "FijiJ\Fiji.app\scripts\Process" folder. 
// This will ensure that run("Partition Coefficient Macro Image Stat") command will properly work.

dir1 = getDirectory("Choose Source Directory ");
dir2 = dir1 //getDirectory("Choose Destination Directory "); // Uncomment this if you want to save files in a different directory.

list = getFileList(dir1);

setBatchMode(true);

for (i=0; i<list.length; i++) {
	if (startsWith(list[i], "Image")) // Edit this if your filename has a different naming convention.
	{
	if (endsWith(list[i], ".czi")) //https://forum.image.sc/t/select-only-images-of-given-format-in-folder-containing-other-files/25690
	{
	showProgress(i+1, list.length);
	path = dir1 + list[i];
	run("Bio-Formats Importer", "open=[" + path  + "] color_mode=Composite rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");      
	run("Partition Coefficient Macro Image Stat");
	}
	}

}