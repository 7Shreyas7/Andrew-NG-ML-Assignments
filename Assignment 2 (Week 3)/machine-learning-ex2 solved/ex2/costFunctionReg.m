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
hypo = sigmoid(X*theta);
J = -1/m*sum(y.*log(hypo)+(1-y).*log(1-hypo))+lambda/(2*m)*theta(2:m,1)'*theta(2:m,1);
grad(1)=1/m*sum(X(:,1).*(hypo-y));
for i =2:m
    grad(i)=1/m*(sum(X(:,i).*(hypo-y))+lambda*theta(i));
end

% =============================================================

end