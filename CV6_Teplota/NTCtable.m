close all; clear all;

t = csvread('ntc.csv');
col1 = t(:, 1);
col2 = t(:, 2);

for i = 1:156
ad(i,1) = 1024*t(i,2)/(t(i,2)+10);
end

figure
plot(ad(:,1), col1);

p = polyfit(ad, t(:,1), 10);

ad2 = 0:1023;
t2 = round(polyval(p, ad2), 1);

% figure
hold on;
plot(ad2, t2, 'or');

dlmwrite('data.dlm', t2*10, ',');


