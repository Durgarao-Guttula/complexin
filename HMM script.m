%% HMM analysis of time traces
% The following script, accompanied by the low-level functions, applies Hidden Markov Modeling to the data. 

% Baum-Welch algorithm
[LL, prior, transmat, mu, sigma, mixmat] = ...
    mhmm_em(data, prior0, transmat, mu, sigma, [], 'max_iter', 100, 'adj_mu', 0, 'adj_Sigma', 0, 'adj_trans', 1);
B = mixgauss_prob(data, mu, sigma, mixmat);
path = viterbi_path(prior, transmat, B);