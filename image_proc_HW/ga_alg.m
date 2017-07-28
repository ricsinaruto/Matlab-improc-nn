FitnessFunction = @neural_net_forga;
numberOfVariables = 784;

LB=zeros(784,1);
UB=LB+255;

rng default % For reproducibility
[x,Fval,exitFlag,Output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],LB,UB);

fprintf('The number of generations was : %d\n', Output.generations);
fprintf('The number of function evaluations was : %d\n', Output.funccount);
fprintf('The best function value found was : %g\n', Fval);

im_ga=vec2mat(x/255,28);
imshow(im_ga);