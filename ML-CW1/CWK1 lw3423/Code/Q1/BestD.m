load problem1.mat
dmax=20;
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
disp('TEST ERROR');
disp(errtest);
disp('TRAIN ERROR');
disp(errtrain);

