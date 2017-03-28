x = input_data';
t = output_data';



% Test the Network
y = Neural(x,'useGPU','yes');
e = gsubtract(t,y);
%performance = crossentropy(Neural(x),t,y,0.9*t+0.1)
%tind = vec2ind(t);
%yind = vec2ind(y);
%percentErrors = sum(tind ~= yind)/numel(tind);

% Recalculate Training, Validation and Test Performance
%trainTargets = t .* tr.trainMask{1};
%valTargets = t .* tr.valMask{1};
%testTargets = t .* tr.testMask{1};
%trainPerformance = crossentropy(net,trainTargets,y,0.9*trainTargets+0.1)
%valPerformance = crossentropy(net,valTargets,y,0.9*valTargets+0.1)
%testPerformance = crossentropy(net,testTargets,y,0.9*testTargets+0.1)

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e,1000)
figure, plotconfusion(t,y)
%figure, plotroc(t,y)