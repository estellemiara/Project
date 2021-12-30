function read_image(img)
    file_name=strcat(img, '.jpeg');
    disp(file_name);
    image=imread(file_name); %read image that holds the name "img.jpeg" 
    figure(6);
    imshow(image);
    title(img);
end
