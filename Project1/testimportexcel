%import the excel table and transform the TimeStamp to a readable time
%that starts at 0s

%datecell.TimeStamp=datenum(char(datecell.TimeStamp), 'yyyy-mm-dd HH:MM:SS.FFF');
%ts=datecell.TimeStamp; 
%ts=ts*24*60*60; 
%ts=ts-ts(1);
%datecell.TimeStamp=ts;

%display the graphs

figure(1);
plot(datecell.TimeStamp,datecell.RAW_AF7);
title('AF7'); 
xlabel('time [s]'); 
ylabel('Raw Signal of AF7'); 

figure(2);
plot(datecell.TimeStamp,datecell.RAW_AF8);
title('AF8'); 
xlabel('time [s]'); 
ylabel('Raw Signal of AF8'); 

figure(3);
plot(datecell.TimeStamp,datecell.RAW_TP9);
title('TP9'); 
xlabel('time [s]'); 
ylabel('Raw Signal of TP9'); 

figure(4);
plot(datecell.TimeStamp,datecell.RAW_TP10);
title('TP10'); 
xlabel('time [s]'); 
ylabel('Raw Signal of TP10'); 

%create new matrices with RAW_TP9 and RAW_TP10 with absolute value and -800
[l,c]=size(datecell); 
blink1(1,1)=0; 
for i=2:l
    blink1(i,1)=blink1(i-1,1)+1;
end

blink2(1,1)=0; 
for i=2:l
    blink2(i,1)=blink2(i-1,1)+1;
end
testbl1=blink1; 
for i=1:l
    testbl1(i,2)=abs(testbl1(i,2)-800);
end

testbl2=blink2; 
for i=1:l
    testbl2(i,2)=abs(testbl2(i,2)-800);
end

[pks,locs,widths,proms] = findpeaks(testbl1(:,2),testbl2(:,1),'MinPeakProminence',50);

n=1;
i=1;
[l,c]=size(locs); 
distance=zeros(l,1); 

while i<l
distance(n,1)=locs(i+1,1)-locs(i,1);
i=i+1; 
n=n+1;
end 
long_or_short_blink; 
