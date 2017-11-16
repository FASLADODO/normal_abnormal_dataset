% gaussian visualization
figure(2)
hold on
for i=1:8
plot_gaussian_ellipsoid(obj.mu(i,:), obj.Sigma(:,:,i))
pause();
end

% figure(2)
% grid on
% hold on
% customColorMap = zeros(9, 3); % Initialize.
% % Make the first 10 points red
% customColorMap(1:1, :) = repmat([1, 0, 0], 1, 1);
% % Make the next 10 points dark green
% customColorMap(2:2, :) = repmat([0, 0.6, 0], 1, 1);
% customColorMap(3:3, :) = repmat([0.1, 0.2, 0], 1, 1);
% customColorMap(4:4, :) = repmat([0, 0.0, 1], 1, 1);
% customColorMap(5:5, :) = repmat([0, 2, 0], 1, 1);
% customColorMap(6:6, :) = repmat([0, 0, 0.5], 1, 1);
% customColorMap(7:7, :) = repmat([0.8, 0.2, 0], 1, 1);
% customColorMap(8:8, :) = repmat([0.4, 0, 0.4], 1, 1);
% % Make the remaining points blue
% customColorMap(9:end, :) = repmat([0, 1, 0], 1, 1);
% for i=1:9:size(XYZ)
%     XYZ=reshape(data_train, 3, D*9)';
% figure(2)
%     scatter3(XYZ(i:i+8, 1), XYZ(i:i+8, 2),XYZ(i:i+8,3), 5, customColorMap,'filled');
% end
% % % % 
