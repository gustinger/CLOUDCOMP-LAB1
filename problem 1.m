np = 1e6; nd = 2;
A = randn(np,nd); B = randn(np,nd);
d = randn(np,1);
d = zeros(np,1);
t = tic;
for i = 1:np
    for j = 1:nd
        d(i) = d(i) + (B(i,j)-A(i,j)).^2;
    end
    d(i) = sqrt(d(i));
end
t = toc;
