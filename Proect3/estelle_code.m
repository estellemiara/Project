function string=estelle_code()
    %instantiate the library
    %disp('Loading the library...');
    lib = lsl_loadlib();

    % resolve a stream...
    %disp('Resolving an EEG stream...');
    result = {};
    M=524288;
    N=4;
    DROITEDROITE= zeros(M,N);
    while isempty(result)
        result = lsl_resolve_byprop(lib,'type','Gyroscope');
    end


    % create a new inlet
    %disp('Opening an inlet...');
    inlet = lsl_inlet(result{1});

    disp('Begin recording data- MOVE YOUR HEAD');
    i=1;

    t0 = clock;

    while etime(clock, t0) < 4
          % get data from the inlet
            [data,time] = inlet.pull_sample();
            % and display it
            %fprintf('%.2f\t',data);
            %fprintf('%.5f\n',time);
            DROITEDROITE(i,1)=time;
            DROITEDROITE(i,2)=data(1);
            DROITEDROITE(i,3)=data(2);
            DROITEDROITE(i,4)=data(3);  
            i=i+1;
    end

    disp('what is the next direction ?');  
    string=Excelmatlab(DROITEDROITE);
    return
end

