function [rase] = Rase(Image1,Image2)
% RASE Calculation

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

mean_img1  = zeros(bands,1);           
%mean_img2  = zeros(bands,1);           
RMSE = zeros(bands,1);
Ms   = zeros(bands,1);
for i = 1:bands                     
    Image1 = double(Image1(:,:,i));          
    Image2 = double(Image2(:,:,i));          
    %Mean value calculation for ERGAS
    mean_img1(i,1) = mean(Image1(:));
    %mean_img2(i,1) = mean(Image2(:));
    %RMSE
    RMSE(i) = sqrt((sum(sum((Image1 - Image2).^2)))/nres); 
    % Mean img1 for RASE
    Ms(i)      = mean2(Image1(:,:,i));
end

% RASE Calculation
mse = RMSE.^2;
srmsesq     = sum(mse);
M           = mean(Image1(:));
% Total RASE
rase_tl     = (100/M)*(sqrt(srmsesq/bands));
% RASE per band
rase     = (100./Ms).*sqrt(mse);
% Average RASE
av_rase     = mean(rase);
% End of RASE part
end