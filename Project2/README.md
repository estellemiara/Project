Project Part 2

The MUSE is connected by bluetooth to our computer through the platform BlueMuse. We pressed the streaming button of the platform as we started blinking (shorts/longs). A new Excel file is created in a specific folder which contains all EEG captors' data with time informations. 

The Matlab function ImportAutomatic, imports the most recent Excel File in the specific folder and isolates the data of captors TP10, TP9, AF7, AF8 and time into a new matrix. A few operations are executed on this new data to get the most exportable file. The matrix distance contains all the peaks of the data to identify the blinks.

The Matlab function long_or_short_blink, matches each blinks to its mode: long (-) or short(.) ; and translates it into a new string.

The Matlab function morse_letter_image contains the dictionnary (defined according to our conveniennce), and translates each string of '.' '-' into letters.

The Matlab function read_image displays the image that matches its name and the string according to the last function. 
