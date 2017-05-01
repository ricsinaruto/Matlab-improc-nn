load('X.mat');
load('Y.mat');
x = double(X');
t = Y';

trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

layersize=784;

hiddenLayerSize=1:2;
hiddenLayerSize(1,1)=layersize;
hiddenLayerSize(1,2)=layersize;  


net = patternnet(hiddenLayerSize,trainFcn);
net.trainParam.epochs=100000;
net.trainParam.max_fail=100;
%net.trainParam.min_grad=1e-16;

net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 60/100;
net.divideParam.valRatio = 30/100;
net.divideParam.testRatio = 10/100;

net.performFcn = 'crossentropy';  
net.performParam.regularization = 0.992;    

net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotconfusion', 'plotroc'};

% Train the Network
[net,tr] = train(net,x,t);

%,'useGPU','yes'

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = crossentropy(net,t,y)

tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

% Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
trainPerformance = crossentropy(net,trainTargets,y)
valPerformance = crossentropy(net,valTargets,y)
testPerformance = crossentropy(net,testTargets,y)

if (true)
    % Generate MATLAB function for neural network for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % network performs.
    genFunction(net,'myNeuralNetworkFunction');
    y = myNeuralNetworkFunction(x);
end

