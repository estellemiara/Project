function string=estelle_code()
    %instantiate the library
    lib = lsl_loadlib();

    % resolve a stream...
    result = {};
    M=524288;
    N=4;
    DROITEDROITE= zeros(M,N);
    while isempty(result)
        result = lsl_resolve_byprop(lib,'type','Gyroscope');
    end


    % create a new inlet
    inlet = lsl_inlet(result{1});

    disp('Recording data - MOVE YOUR HEAD');
    i=1;

    t0 = clock;

    while etime(clock, t0) < 4
          % get data from the inlet
            [data,time] = inlet.pull_sample();
            DROITEDROITE(i,1)=time;
            DROITEDROITE(i,2)=data(1);
            DROITEDROITE(i,3)=data(2);
            DROITEDROITE(i,4)=data(3);  
            i=i+1;
    end

    disp('You have moved your head to the:');  
    string=Excelmatlab(DROITEDROITE);
    return
end

