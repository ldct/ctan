### mcexam_example_dataset.r
### This code contains some test data for the example of mcexam. First run 
### mcexam_example.tex through LaTeX, then process this file with R. Next,
### you can make an analysis version of the exam in LaTeX. Make sure the 
### working directory is the folder where mcexam_example.tex resorts. 
###
### Copyright (c) 2017 Jorre Vannieuwenhuyze.
###
### Permission is granted to copy, distribute and/or modify this
### software under the terms of the LaTeX Project Public License
### (LPPL), version 1.3c or any later version.
###
### This software is provided 'as is', without warranty of any kind,
### either expressed or implied, including, but not limited to, the
### implied warranties of merchantability and fitness for a
### particular purpose.

rm(list = ls())

ID       <- c(1,2,3,4,5,6,7,8,9,10)
versions <- c(1,1,1,2,2,2,2,3,3,3)
answers  <- rbind(c(1,2,1,4,2, 3,4,3,1,1, 2,2,2,5,2, 1,3)   #17
                 ,c(1,1,2,4,3, 2,2,3,1,2, 2,3,2,5,2, 2,3)   #9
                 ,c(1,2,1,3,2, 3,4,2,1,1, 2,2,3,5,1, 1,3)   #8
                 ,c(3,2,5,4,2, 4,1,3,4,1, 2,3,1,1,2, 2,3)   #11
                 ,c(2,2,5,3,2, 3,1,2,4,2, 2,3,1,1,1, 2,3)   #0 
                 ,c(3,2,5,4,2, 4,1,3,3,1, 2,2,1,1,2, 1,4)   #7 
                 ,c(3,2,5,4,2, 3,1,3,4,2, 2,3,2,1,1, 2,1)   #2 
                 ,c(2,1,4,2,1, 1,3,5,4,1, 1,3,1,4,3, 2,4)   #6
                 ,c(2,1,3,3,1, 1,3,5,4,1, 1,2,1,4,3, 2,4)   #11
                 ,c(1,1,3,3,2, 1,2,5,4,3, 2,3,4,3,3, 1,3)   #4   
                 )
                 
source("mcexam_example.r")                                  
data <- mcprocessanswers(ID,versions,answers)   


                 
                 

 
 