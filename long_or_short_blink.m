    clear n; 
    [n,m]=size(distance);
    str="";
 
    for i=1:n
       new_distance=""; 
       if (distance(i,1)>100 && mod(i,2))
           new_distance="-";
       end
       
       if (distance(i,1)<100 && mod(i,2) )
            new_distance=".";
        end
       if (distance(i,1)>400 && ~mod(i,2) )
           new_distance=" ";
       end
       str=strcat(str, new_distance);
    end
    message=sprintf('The morse code obtained is: %s \n',str);
    fprintf(message);
    morse_matlab(str);
