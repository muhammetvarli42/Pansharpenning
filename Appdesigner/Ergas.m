function [ergas] = Ergas(Image1,Image2,pixratio)

% ERGAS Calculation
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
for i = 1:bands                     
    Image1 = double(Image1(:,:,i));          
    Image2 = double(Image2(:,:,i));          
    %Mean value calculation for ERGAS
    mean_img1(i,1) = mean(Image1(:));
    %mean_img2(i,1) = mean(Image2(:));
    %RMSE
    RMSE(i) = sqrt((sum(sum((Image1 - Image2).^2)))/nres); 
end


%ERGAS Calculation
ppixratio = 100*pixratio;
ergas_sqrt = sqrt(  (RMSE.^2)./(mean_img1.^2)   );
ergas_pb  = ppixratio*ergas_sqrt;
av_ergas  = mean(ergas_pb);
ergas_sqrt = sqrt((sum((RMSE.^2)./(mean_img1.^2))) / bands);
ergas  = ppixratio*ergas_sqrt;
end