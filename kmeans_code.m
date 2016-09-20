clear variables
% rng default; % For reproducibility
n = 1000;
X = [randn(n,2)*0.75+ones(n,2);
    randn(n,2)*0.5-ones(n,2)];

figure;
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

k = 2;
size_data = size(X,1);
dim_data = size(X,2);
m_k = randn(dim_data, k);
iter = 4;
clr = 'rb';
for j = 1:iter 
    for i = 1:k
        m_k_temp = repmat(m_k(:,i),[dim_data/2,size_data])';
        d(:,i) =  sum(sqrt((X - m_k_temp).^2),2);

    end
    [c,idx] = min(d,[],2);
    for i = 1:k
        temp = X(idx == i,:);
        plot(temp(:,1), temp(:,2),strcat('*',clr(i)));
        hold on 
        m_k(:,i) = mean(temp);
    end
end