
function morse_matlab(text1)


morse={'.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..'};
letter={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
%-----Changes----
text1=textscan(text1,'%s','Delimiter',' '); %getting individual morse letters
text1=text1{1};
%----------------
message=sprintf('The translation of the morse code is:\n'); 
fprintf(message); 
for i=1:length(text1)
    for j=1:length(letter)
      if strcmpi(text1(i),morse(j))==1
        disp(letter(j));    %letter equivalent of each sequence of '.' and '-'
      end
    end
end

end
