function [F1,tp,fp,indMess,indFn,indFp] = fun_testScriptWithGMM(bestParaMat,testFolderName,heightBias,widthBias,featureType)
load(bestParaMat,'bestPara','GMModelOutput','epsilonOutput');

gaborsBinHogFeatureType = 'gaborsBinHog';

if contains(featureType, gaborsBinHogFeatureType,'IgnoreCase',true)
    dimInd = bestPara{1, 4};
end

hogSize = bestPara{1, 5};
imgEdge = bestPara{1, 6};
heightImgEdge = round(heightBias + imgEdge);
widthImgEdge = round(widthBias + imgEdge);

dataML = realWindingFeatureDataGen(testFolderName,hogSize,heightImgEdge,widthImgEdge,featureType);

[F1,tp,fp,indMess,indFn,indFp] = fun_testGMM(dataML,dimInd,gaussianParaOutput);
end