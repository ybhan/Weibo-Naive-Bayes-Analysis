sum_male = sum([data.gender]);
sum_female = size(data, 2) - sum_male;
figure;
pie3([sum_male, sum_female],{'Male','Female'});