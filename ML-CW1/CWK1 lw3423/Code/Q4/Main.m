load dataset4.mat
theta_new = zeros(length(X(1,:)),1);
theta_old = theta_new;


[theta_new, result] = LR(X, Y, theta_old);
errors = sum(abs(Y - result));
for k = 1:length(X(:,1))
    empR=sum((Y-1)*log(1- 1/(1+exp(-(X(k,:)*theta_new)))) - Y*log(1/(1+exp(-(X(k,:)*theta_new))))) /length(X(:,1));
end
gscatter(X(:,1),X(:,2),Y)
title('Linear Decision Boundary')
%legend('0','1','function')
xlabel('x1')
ylabel('x2')
hold on;
x1=0:0.01:1;
x2=(-theta_new(3)-theta_new(1)*x1)/theta_new(2);
plot(x1,x2)
%disp(count)
hold off;


function [theta_new, result] = LR(X, Y, theta_old)
    e=0.001;
    step_size=0.01;%step size
    maxIter=100000;%max iteration
    count=0;
    s = length(X(:,1));
    f = length(X(1,:));
    theta_new = theta_old;

    for j = 1:maxIter
        temp = zeros(f,1);
        theta_old=theta_new;
        for k = 1:s
            temp = temp + (1 / (1 + exp(-(X(k,:)*theta_new)))- Y(k))*[X(k,:)]';
        end
        theta_new =theta_new - step_size*temp;
        if abs(theta_old-theta_new)<e
            theta_new = theta_old; %restore value
            break
        end
        count=count+1;
    end 

   result = zeros(s,1);
   for i = 1:s
       sigmoid = 1/(1 + exp(-(X(i,:)*theta_new)));
       if sigmoid >0.5
            result(i)= 1;
        else
            result(i)= 0;
        end
   end
   disp(count)
end