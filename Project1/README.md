# Project Part 1 


The MUSE is connected by bluetooth to the Ipad through the application MindMonitor. 
We pressed the streaming button of the app as we started blinking (shorts/longs) by following the Morse Alphabet. 
A new Excel file is created which contains all captors' data with time informations.
We transfered this file to our computer for Matlab to read it.


The Matlab function testimportexcel, imports the requested Excel File and isolates the data of captors TP10, TP9, AF7, AF8 and time into a new matrix. 
A few operations are executed on this new data to get the most exportable file. 
The matrix distance contains all the peak of the data to identify blinking. 

The Matlab function long_or_short_blink, matches each blinks to its mode: long (-) or short(.) ; and translates it into a new string.

The Matlab function morse_matlab contains the dictionnary that is defined with the Morse code alphabet, and translates each string of '.' '-' into letters. 
