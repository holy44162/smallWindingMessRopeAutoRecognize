clear;
tStart = tic;
functionPath = 'm:\files\files\phd\functions\';
addpath(functionPath);

addpath([functionPath 'toolbox_general']);
addpath([functionPath 'SoundZone_Tools-master']);
addpath([functionPath 'parfor_progress']);
addpath([functionPath 'Texture-Segmentation-using-Gabor-Filters']);

maxHogSize = 64;
% maxHogSize = 4;

maxImgEdge = 30;

heightBias = 0;
widthBias = 0;

numImgEdgeStep = 0;
numHogSizeStep = 1;

trainFolderName = 'd:\data_seq\smallWinding1\train\imgs\';
CVFolderName = 'd:\data_seq\smallWinding1\CV1\imgs\';
testFolderName = 'd:\data_seq\smallWinding1\test\imgs\';

featureType = 'gaborsBinHog';

[bestPara,paraLog,dataMLOutput,gaussianParaOutput] = fun_testScript(maxHogSize,maxImgEdge,heightBias,widthBias,numImgEdgeStep,numHogSizeStep,trainFolderName,CVFolderName,testFolderName,featureType);
save('bestPara.mat','bestPara','paraLog','dataMLOutput','gaussianParaOutput','-v7.3');

totalElapsedTime = toc(tStart);
disp(['total time: ' num2str(totalElapsedTime) ' sec']);
disp(['total time: ' num2str(totalElapsedTime/60) ' min']);