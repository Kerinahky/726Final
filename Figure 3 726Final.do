*dropping states with legislation targeting employment of undocumented immigrants*/

drop if statefip==28
drop if statefip==44
drop if statefip==45
drop if statefip==49

sort statefip year

** Declare panel dataset

tsset statefip year



** Initial synthetic cohort analysis for Arizona.
#delimit;
synth hispcitizen hispcitizen(1998) hispcitizen(1999) hispcitizen(2000) hispcitizen(2001) hispcitizen(2002) hispcitizen(2003) hispcitizen(2004) hispcitizen(2005) hispcitizen(2006)
ind1(1998(1)2000) ind2(1998(1)2000) ind3(1998(1)2000) ind4(1998(1)2000) ind5(1998(1)2000) ind6(1998(1)2000) ind8(1998(1)2000) ind9(1998(1)2000) educ1(1998(1)2000) educ2(1998(1)2000) educ3(1998(1)2000) rate(1998(1)2000)
ind1(2001(1)2003) ind2(2001(1)2003) ind3(2001(1)2003) ind4(2001(1)2003) ind5(2001(1)2003) ind6(2001(1)2003) ind8(2001(1)2003) ind9(2001(1)2003) educ1(2001(1)2003) educ2(2001(1)2003) educ3(2001(1)2003) rate(2001(1)2003)
ind1(2004(1)2006) ind2(2004(1)2006) ind3(2004(1)2006) ind4(2004(1)2006) ind5(2004(1)2006) ind6(2004(1)2006) ind8(2004(1)2006) ind9(2004(1)2006) educ1(2004(1)2006) educ2(2004(1)2006) educ3(2004(1)2006) rate(2004(1)2006), 
trunit(4) counit(1 2 5 6 8 9 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 29 30 31 32 33 34 35 36 37 38 39 40 41 42 46 47 48 50 51 53 54 55 56)
trperiod(2007) fig;
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
list treated synthetic in 1/12

*the following code estimaes the synthetic treatment effect for each state in the donor pool to generate the distribution of placebo estimate for the permutation test of the LAWA effect

local wonka "1 2 5 6 8 9 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 29 30 31 32 33 34 35 36 37 38 39 40 41 42 46 47 48 50 51 53 54 55 56"

	set more off
	foreach val of local wonka {
		display as text "`val'"
		quietly: synth hispcitizen hispcitizen(1998) hispcitizen(1999) hispcitizen(2000) hispcitizen(2001) hispcitizen(2002) hispcitizen(2003) hispcitizen(2004) hispcitizen(2005) hispcitizen(2006) ind1(1998(1)2000) ind2(1998(1)2000) ind3(1998(1)2000) ind4(1998(1)2000) ind5(1998(1)2000) ind6(1998(1)2000) ind8(1998(1)2000) ind9(1998(1)2000) educ1(1998(1)2000) educ2(1998(1)2000) educ3(1998(1)2000) rate(1998(1)2000) ind1(2001(1)2003) ind2(2001(1)2003) ind3(2001(1)2003) ind4(2001(1)2003) ind5(2001(1)2003) ind6(2001(1)2003) ind8(2001(1)2003) ind9(2001(1)2003) educ1(2001(1)2003) educ2(2001(1)2003) educ3(2001(1)2003) rate(2001(1)2003) ind1(2004(1)2006) ind2(2004(1)2006) ind3(2004(1)2006) ind4(2004(1)2006) ind5(2004(1)2006) ind6(2004(1)2006) ind8(2004(1)2006) ind9(2004(1)2006) educ1(2004(1)2006) educ2(2004(1)2006) educ3(2004(1)2006) rate(2004(1)2006), trunit(`val') trperiod(2007)		
       