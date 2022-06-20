function [Psnr] = Psnr(Image1,Image2)
% convert to doubles
Image1=double(Image1);
Image2=double(Image2);
% size_img = size(Image1);
% M = size_img(1);
% N = size_img(2);


% avoid divide by zero nastiness
if ((sum(sum(Image1-Image2))) == 0)    
    error('Input vectors must not be identical')
else
              % calculate PSNR
    error_diff = Image1 - Image2;
    Psnr = 20*log10(1/(sqrt(mean(mean(error_diff.^2)))));       
    
end

