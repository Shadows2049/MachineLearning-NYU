load problem1.mat
dmax=50;
errtrain=zeros(dmax,1);
errtest=zeros(dmax,1);
for i =1:dmax
    %2-fold Crossvalid
    indices = crossvalind('Kfold',x,2);
    test=(indices==1);train=~test;
    [err,model,errT] = polyreg(x(train),y(train),i,x(test),y(test));
    errtrain(i,:)=[err];
    errtest(i,:)=[errT]; 
end 
hold off
order=1:1:dmax;%x axis order+1
figure;
plot(order,errtrain,'-o',order,errtest,'--*')
%let y axis to be train error and test error with different lines 
title('2-Fold CV Graph')
xlabel('Order d+1')
ylabel('error')
%denote different lines 
legend('trainerror','testerror')