%% BEGINNING FILE %%
Randomization Program
This program was designed to randomize participants in blocks of 6 based on a single stratified variable into one of three interventions.  The Graphical User Interface (GUI) was designed for any user.  It was written in Matlab2015a.  
To get started: 
1. Before running the first block, fill out the Block1.xls template.  There should be a 6 x 2 matrix where the column on the left is the participant number (make sure it is an integer like 1, 2, or 3.  If there is a string added there will be an error with the program).  The column on the right will be the corresponding stratified variable (1 or 2).
2. Once the Block1.xls template has been filled out, open Matlab.  Change the Current Folder (by clicking on the Browse for Folder icon) to the folder that contains all the m-files for the program.  
3. From the Current Folder, open the m-file called RandomizationProgram.m.  
4. Press Run.  This will pop up the GUI.  
5. Type in the block number in the box provided.  For the first block, the number 1 should be entered. 
6. Press the Randomize button. 
7. A table on the right hand side will pop up in the GUI.  The first column refers to the participant number.  These should be back to numerical order.  The second column refers to the corresponding stratified variable.  The third column gives the intervention allocation. A file named Block1_Randomized.xls will be created once the program has run.  This file will be in the Randomization folder on the USB.  Contained in the file will be the same information (minus the headers) from the table in the GUI.  It is wise to record this data elsewhere in a Master spreadsheet.  Keep this file in the folder as the program will continue to use this file.
8. When running the program for a second time for the second block, create a second .xls file called Block2.xls set up exactly like Block1.xls.  Type 2 into the provided box (block number) and press Randomize.  A table will pop up on the right, this time with data from all participants in the study thus far (i.e., participants 1-12).  This data will again be saved in a file named Block2_Randomized.xls.  Keep this file in the folder as the program will continue to use this file.
%% END FILE %%