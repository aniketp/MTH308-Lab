syms x;

g1 = (x^2 + 2)/3;
g2 = sqrt(3 * x - 2);
g3 = 3 - 2/x;
g4 = (x^2 - 2)/(2*x - 3);

% Main function
fx = (x^2 - 3*x + 2);
x0 = 1.5 + rand(1, 1);

x = x0;
emm = abs(x0 - 2);
itr = 0;

% Loop till the tolerance is less than 10^-14
while (double(subs(fx)) > power(10, -14) && itr < 200)
    itr = itr+1;
    xx = subs(g1);
    em = emm;
    emm = abs(xx - 2);
    
    fprintf("Iteration %i\n", itr);
    fprintf("The rate |em+1|/|em| is %i\n", double(emm/em));
    fprintf("The rate |em+1|/|em^2| is %i\n", double(emm/(em*em)));
    x = xx;   % Update the value of x
end

itr2 = 0;
x = x0;
emm = abs(x0 - 2);
while (double(subs(fx)) > power(10, -14) && itr2 < 200)
    itr2 = itr2 + 1;
    xx = subs(g2);
    em = emm;
    emm = abs(xx - 2);
    
    fprintf("Iteration %i\n", itr2);
    fprintf("The rate |em+1|/|em| is %i\n", double(emm/em));
    fprintf("The rate |em+1|/|em^2| is %i\n", double(emm/(em*em)));
    x = xx;   % Update the value of x
end

itr3 = 0;
x = x0;
emm = abs(x0 - 2);
while (double(subs(fx)) > power(10, -14) && itr3 < 200)
    itr3 = itr3 + 1;
    xx = subs(g3);
    em = emm;
    emm = abs(xx - 2);

    fprintf("Iteration %i\n", itr3);
    fprintf("The rate |em+1|/|em| is %i\n", double(emm/em));
    fprintf("The rate |em+1|/|em^2| is %i\n", double(emm/(em*em)));
    x = xx;   % Update the value of x
end

itr4 = 0;
x = x0;
emm = abs(x0 - 2);
while (double(subs(fx)) > power(10, -14) && itr4 < 200)
    itr4 = itr4 + 1;
    xx = subs(g4);
    em = emm;
    emm = abs(xx - 2);

    fprintf("Iteration %i\n", itr4);
    fprintf("The rate |em+1|/|em| is %i\n", double(emm/em));
    fprintf("The rate |em+1|/|em^2| is %i\n", double(emm/(em*em)));
    x = xx;   % Update the value of x
end

fprintf("\n\n\nFinal Result\n");
fprintf("g1(x) is divergent with more than %i iterations \n", itr);
fprintf("g2(x) is convergent with %i iterations\n", itr2);
fprintf("g3(x) is convergent with %i iterations\n", itr3);
fprintf("g4(x) is convergent with %i iterations\n", itr4);





