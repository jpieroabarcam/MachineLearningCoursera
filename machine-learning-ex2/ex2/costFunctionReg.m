function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X*theta);

sum1 = -y'*log(h) - (1-y)'*log(1-h);


J = 1/m * sum1 + lambda/2/m * (theta' .* [0; ones(size(theta, 1) - 1, 1)]') * theta;


%%% gradient descent
iter1 = X' * (h - y);
iter2 = lambda / m * theta .* [0; ones(size(theta, 1) - 1, 1)];

grad = 1/m * iter1 + iter2;




% =============================================================

end