function string=Excelmatlab(DROITEDROITE)
    %Change time to something readable
    ts=DROITEDROITE(:,1); 
    ts=ts/(24*60*15*12*2022); 
    ts=ts-ts(1);
    DROITEDROITE(:,1)=ts;
    [l,c]=size(DROITEDROITE(:,1)); 

    %generate new variable without the zeros of the initial matrice
    n=1;
    string=0;
    for i=2:l
        if DROITEDROITE(i,2)==0
           break
        end
        n=n+1;
    end

    a=DROITEDROITE(1:n,:);
    peak_x=0;
    peak_y=0;
    busy_X=0;
    busy_Y=0; 
    for i=2:n
        if 0<a(i,2) && a(i,2)<10 && busy_X==1 %"mutex of X"
           busy_X=0; 
        end
        if 0<a(i,3) && a(i,3)<10 && busy_Y==1 %"mutex of Y"
           busy_Y=0; 
        end
        if a(i,3)>35 && peak_y==0 && busy_Y==0 %DOWN
           peak_y=-1; 
        end
        if a(i,3)<-40 && peak_y==0 && busy_Y==0 %UP
           peak_y=1; 
        end
        if a(i,2)<-40 && peak_x==0 && busy_X==0 %RIGHT
           peak_x=-1; 
        end
        if a(i,2)>30 && peak_x==0 && busy_X==0 %LEFT
           peak_x=1;
        end
        if a(i,2)>30 && peak_x==-1 
            peak_x=0; 
            busy_X=1; 
            disp('RIGHT');
            string=114;
        end
        if a(i,2)<-40 && peak_x==1
            peak_x=0; 
            busy_X=1;
            disp('LEFT');
            string=108;
        end
        if a(i,3)<-40 && peak_y==-1 
            peak_y=0; 
            busy_Y=1; 
            disp('DOWN')
            string=100;
        end
        if a(i,3)>35 && peak_y==1 
            peak_y=0; 
            busy_Y=1; 
            disp('UP');
            string=117;
        end

    end
    return 
end 
