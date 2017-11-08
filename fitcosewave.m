function estimates = fitcosewave(xdata, ydata, start_point)
% Call fminsearch with a starting point.
model = @cosinefun;
options = optimset('MaxFunEvals',3000);
estimates = fminsearch(model, start_point, options);
% sinefun accepts curve parameters as inputs, and outputs sse,
% the sum of squares error for A*sin(2*pi/365*xdata-B)+C-ydata.
  function sse = cosinefun(params)
      A = params(1);
      B = params(2);
      C = params(3);
      ErrorVector = A*cos(2*pi/365*xdata-B)+C - ydata;
      sse = sum(ErrorVector .^ 2);
  return
  end
return
end