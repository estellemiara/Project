
function morse_letter_matlab(text1)
%text1=string(input ('(Please Enter morse code: \n','s'));
morse={'.-','--','..-','...','-...','-', '--.'};
letter={'A','M','U','S','E','B','T'};
%----------------
message=sprintf('The translation of the morse code is:\n'); 
fprintf(message); 
for i=1:length(text1)
    for j=1:length(letter)
      if strcmpi(text1(i),morse(j))==1
        img = convertCharsToStrings(letter(j));
        disp(img);
        read_image(img);  
       
      end
    end
end

end