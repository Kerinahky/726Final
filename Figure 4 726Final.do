
use vacancyratet.dta
/*dropping states with similar legislation from the donor pool*/
drop if statefip==28
drop if statefip==44
drop if statefip==45
drop if statefip==49


 
gen timenew=time
sort statefip timenew

** Declare panel dataset

tsset statefip timenew




** Initial synthetic cohort analysis for Arizona.
#delimit;
synth vacancyrate vacancyrate(1(1)4) vacancyrate(5(1)8) vacancyrate(9(1)10)
vacancyrate(1 5 9) vacancyrate(2 6 10) vacancyrate(3 7)
vacancyrate(4 8) metrodummy pu18 p1829 p3039 p4049 p5064 p65plus nonwhite hispanic foreign poor renter, 
trunit(4) counit(1 2 5 6 8 9 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 29 30 31 32 33 34 35 36 37 38 39 40 41 42 46 47 48 50 51 53 54 55 56)  
trperiod(11) fig;
#delimit cr
**the following code creates a variable with title "dif_TU" which contains the difference in the outcome variable for arizona minus synthetic arizona for each year from 1998 through 2009

mat diffs = e(Y_treated) - e(Y_synthetic)
mat treated =e(Y_treated)
mat colnames treated = treated
mat synthcontrol=e(Y_synthetic)
mat colnames synthcontrol = synthetic
mat colnames diffs = dif_TU
svmat diffs, names(col)
svmat treated, names(col)
svmat synthcontrol, names(col)
list treated synthetic in 1/20