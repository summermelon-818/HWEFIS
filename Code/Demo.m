clc
clear 
close all
%% 加载数据
tic
% load airline
% load weather
% load electricity
% load CircleA
% load SIN500
load SEAA


chunksize = 200;
G = 6;
[model,TP,FP,FN,acc] = HWEFIS(Z,chunksize,G);


precision = TP./(TP+FP);
recall = TP./(TP+FN);
F1 = 2*precision.*recall./(precision+recall);
Y = Z(:,end);
cnum = length(unique(Y));
for i = 1:cnum
W(i) = length(Y(Y == i))/length(Y);
end
F1score = sum(F1.*W)*100
ACC = sum(TP)/(sum(TP)+(sum(FN)+sum(FP))/2)*100

toc
disp(['运行时间: ',num2str(toc)]);
figure
plot(1:length(acc),acc)
ylim([0,1])
hold on
