videoSource = vision.VideoFileReader('mF.avi',...
'ImageColorSpace','Intensity','VideoOutputDataType','uint8');
detector = vision.ForegroundDetector(...
'NumTrainingFrames', 5, ...
'InitialVariance', 30*30);
blob = vision.BlobAnalysis(...
'CentroidOutputPort', false, 'AreaOutputPort', false, ...
'BoundingBoxOutputPort', true, ...
'MinimumBlobAreaSource', 'Property', 'MinimumBlobArea', 250);
shapeInserter = vision.ShapeInserter('BorderColor','White');
videoPlayer = vision.VideoPlayer();
while ~isDone(videoSource)
frame  = step(videoSource);
fgMask = step(detector, frame);
bbox   = step(blob, fgMask);
out    = step(shapeInserter, frame, bbox);
step(videoPlayer, out);
end
release(videoPlayer);
release(videoSource);