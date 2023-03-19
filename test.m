close all; clear; clc;
alpha0 = 0;
gamma0 = 1;
t = 2;
maxit = 50;
% forward_back_method
[a, b, iter] = forward_back_method(alpha0, gamma0, t, maxit);

% golden_section_method
tau = 0.618;
epsilon = 0.01;
[alpha_star1, iter1] = golden_section_method(a, b, tau, epsilon, maxit);

% fibonacci_method
[alpha_star2, iter2] = fibonacci_method(a, b, epsilon, maxit);

% binary_search_method
[alpha_star3, iter3] = binary_search_method(a, b, epsilon, maxit);
