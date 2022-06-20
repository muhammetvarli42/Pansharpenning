function [rmse] = Rmse(Image1,Image2)
% RMSE calculator

%RMSE Calculation
% Find the number of bands
size_img = size(Image1);
if max(size(size(Image1))) == 2
    bands = 1;
else
    bands = size_img(1,3);
end
%RMSE Calculation
nres = size_img(1,1)*size_img(1,2);
rmse = zeros(bands,1);
for i = 1:bands             
    Image1 = double(Image1(:,:,i));  
    Image2 = double(Image2(:,:,i));  
    rmse(i) = sqrt( (sum(sum((Image1 - Image2).^2)))/nres );
end
av_rmse = mean(rmse);
end

