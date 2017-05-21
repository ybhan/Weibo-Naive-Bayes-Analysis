A = [];
B=[];
j=1;
for i = 1:99
    A(i)=MaxActiveDays(Tr_data(i));
    if A(i) >= 30
        B(j)=i;
        j=j+1;
    end
end
B
size(B,2)