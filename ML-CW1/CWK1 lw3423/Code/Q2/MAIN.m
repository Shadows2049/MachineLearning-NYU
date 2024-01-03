%2-fold Crossvalid
load problem2.mat
indices = crossvalind('Kfold',400,2);
test=(indices==1);train=~test;
lambda = 0:1000;
errmatrix = zeros(length(lambda),2);
for i=1:1001
    [err,model,errT] = polyreg(x(train,:),y(train),lambda(i),x(test,:),y(test));
    errmatrix(i,:)=[err,errT];
end

trainerror=errmatrix(:,1);
testerror=errmatrix(:,2);
figure;
plot(lambda,trainerror,lambda,testerror)
xlabel('lambda')
ylabel('error')
legend('trainerror','testerror')