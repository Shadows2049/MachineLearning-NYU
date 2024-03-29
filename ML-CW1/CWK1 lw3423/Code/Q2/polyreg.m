function [err,model,errT] = polyreg(x,y,lambda,xT,yT)
%
% Finds a D-1 order polynomial fit to the data
%
%    function [err,model,errT] = polyreg(x,y,D,xT,yT)
%
% x = vector of input scalars for training
% y = vector of output scalars for training
% D = the order plus one of the polynomial being fit
% xT = vector of input scalars for testing
% yT = vector of output scalars for testing
% err = average squared loss on training
% model = vector of polynomial parameter coefficients
% errT = average squared loss on testing
%
% Example Usage:
%
% x = 3*(rand(50,1)-0.5);
% y = x.*x.*x-x+rand(size(x));
% [err,model] = polyreg(x,y,4);
%


%model = pinv(x)*y; %100 row 1 col

model = (inv(x'*x+lambda*(eye(size(x'*x)))))*x'*y; %should be a 100x1 matrix
err   = (1/(2*length(x)))*sum((y-x*model).^2)+(lambda/(2*length(x)))*(sum(model.^2));

if (nargin==5)
  errT  = (1/(2*length(xT)))*sum((yT-xT*model).^2)+(lambda/(2*length(xT)))*(sum(model.^2));
end




