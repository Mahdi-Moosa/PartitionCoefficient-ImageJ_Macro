idOrig = getImageID();
selectImage(idOrig);
originalName = getTitle();
originalNameWithoutExt = replace( originalName , ".czi" , "" ); 
current_ImageDir = getDir("image")

// Background stat start
// Steps to get background
// Duplicate --> Median filter --> Threshold --> Edit>Selection>Create selection 
// --> Switch to the original image --> Edit>Selection>Restore selection --> Measure
run("Duplicate...", "title=Green_Background duplicate channels=1");
run("Median...", "radius=2");
setAutoThreshold("MinError dark"); // This needs to be manually checked for Image sets. Different methods of AutoThresholding may work better based on acquired images.
//run("Threshold...");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Invert");
run("Create Selection");
selectImage(idOrig);
run("Restore Selection");
run("Clear Results");
run("Set Measurements...", "area mean standard modal min bounding feret's area_fraction limit display redirect=None decimal=3");
run("Measure");
saveAs("Results", current_ImageDir+ originalNameWithoutExt+ '_' + 'Background_stat.csv');
// Background stat complete

// Droplet stat start
selectImage(idOrig);
run("Duplicate...", "title=Green_Droplets_Redirect duplicate channels=1");
selectImage(idOrig);
run("Duplicate...", "title=Green_Droplets duplicate channels=1");
run("Select None");
run("Median...", "radius=2");
setAutoThreshold("MinError dark"); // This needs to be manually checked for Image sets. Different methods of AutoThresholding may work better based on acquired images.
//run("Threshold...");
setAutoThreshold("Intermodes dark");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Watershed");
run("Erode");
run("Options...", "iterations=1 count=1 black do=Nothing");
run("Set Measurements...", "area mean standard modal min bounding feret's area_fraction limit display redirect=Green_Droplets_Redirect decimal=3");
run("Analyze Particles...", "display exclude clear add");
saveAs("Results", current_ImageDir+ originalNameWithoutExt+ '_' + 'Droplet_stats.csv');
// Droplet stat complete

// Close all open windows
close("*");
close("ROI Manager"); 
close("Results"); 