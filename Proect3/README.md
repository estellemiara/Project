Project Part 3

The MUSE is connected by bluetooth to our computer through the BlueMuse Shell. The streaming button has to be pressed in the platform to open the online connection and transfer the GYRO's data. The data will contain x, y, z signals which are the 3D orientation of our head as we wear the MUSE.

The Matlab function mazesignal_2, creates an aleatory maze of requested size nxm and displays it. Until we haven't successfuly resolve the maze, the function will display the actual position of our point in the maze. On each alteration, the function estelle_code is called to actualize the position of the point in our maze. 

The Matlab function estelle_code, opens the online connection with the MUSE and receive its data, which is added to a matrix.

The Matlab function excelmatlab returns the movement of our head (up, down, right, left) according to the data in the matrix. 
