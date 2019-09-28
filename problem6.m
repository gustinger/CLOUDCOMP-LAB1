np = 1e7; nd = 10; n1 = 8;
d = zeros(np/n1,1);
 
spmd
    if (labindex ==1)
    A = randn(np/n1,nd); B = randn(np/n1, nd);
    C = A-B;
    labSend(C,2);
    elseif (labindex==2)
        C = labReceive(1);
        D = C.^2;
        labSend(D,3);
    elseif (labindex==3)
        D = labReceive(2);
        E = sum(D,2);
        labSend(E,4);
    elseif (labindex==4)
        E = labReceive(3);
        F = sqrt(E);
                
    
    
    t = tic;
    for i = 1:np/8
        for j = 1:nd
            d(i) = d(i) + (B(i,j)-A(i,j)).^2;
        end
        d(i) = sqrt(d(i));
    end
    da = gcat(d,1,1);
end
t = toc;
d1 = da{1};
