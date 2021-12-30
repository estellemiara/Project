clear ;
%open the most recent file 
dirlist = dir('*EEG_recording*');

len=length(dirlist);
file_opened=sprintf('The concerned file is: %s \n' ,dirlist(len).name);
fprintf(file_opened);
datecell=importdata(dirlist(len).name);

%import the excel table and transform the TimeStamp to a readable time
%that starts at 0s

ts=datecell.data(:,1); 
ts=ts-ts(1);
datecell.data(:,1)=ts;

%display the graphs

%figure(1);
plot(datecell.data(:,1),datecell.data(:,3));
title('AF7'); 
xlabel('time [s]'); 
ylabel('Raw Signal of AF7'); 

%figure(2);
plot(datecell.data(:,1),datecell.data(:,4));
title('AF8'); 
xlabel('time [s]'); 
ylabel('Raw Signal of AF8'); 

%figure(3);
plot(datecell.data(:,1),datecell.data(:,2));
title('TP9'); 
xlabel('time [s]'); 
ylabel('Raw Signal of TP9'); 

%figure(4);
plot(datecell.data(:,1),datecell.data(:,5));
title('TP10'); 
xlabel('time [s]'); 
ylabel('Raw Signal of TP10'); 

%create new matrices with RAW_TP9 and RAW_TP10 with absolute value and -800
[l,c]=size(datecell.data(:,1)); 
blink1(1,1)=0; 
blink1(1,2)=datecell.data(1,2);
for i=2:l
    blink1(i,1)=blink1(i-1,1)+1;
    blink1(i,2)=datecell.data(i,2);
end

blink2(1,1)=0; 
blink2(1,2)=datecell.data(1,5);
for i=2:l
    blink2(i,1)=blink2(i-1,1)+1;
    blink2(i,2)=datecell.data(i,5);
end
testbl1=blink1; 
for i=1:l
    testbl1(i,2)=abs(testbl1(i,2));
end

testbl2=blink2; 
for i=1:l
    testbl2(i,2)=abs(testbl2(i,2));
end

%figure(5);
plot(testbl2(:,1),testbl2(:,2));
title('TP10'); 
xlabel('time [s]'); 
ylabel('ABS TP10'); 


[pks,locs] = findpeaks(wdenoise(testbl2(:,2)),wdenoise(testbl2(:,1)),'MinPeakProminence',120);

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
