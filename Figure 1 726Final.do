/*generate proporiton with high school or less among targeted age group combining dropouts and high school grads*/
gen hispnoncitizene1e21545=hispnoncitizene11545+hispnoncitizene21545

*dropping states with legislation targeting employment of undocumented immigrants*/

drop if statefip==28
drop if statefip==44
drop if statefip==45
drop if statefip==49

sort statefip year

** Declare panel dataset

tsset statefip year




** Initial synthetic cohort analysis for Arizona.  The results from this step produce the set of weights for the comparison states in column 3 of table 2.  this step also produces the data points for figure 1

#delimit;
synth hispnoncitizene1e21545 hispnoncitizene1e21545(1998) hispnoncitizene1e21545(1999) hispnoncitizene1e21545(2000) hispnoncitizene1e21545(2001) hispnoncitizene1e21545(2002) hispnoncitizene1e21545(2003) hispnoncitizene1e21545(2004) hispnoncitizene1e21545(2005) hispnoncitizene1e21545(2006)
ind1(1998(1)2000) ind2(1998(1)2000) ind3(1998(1)2000) ind4(1998(1)2000) ind5(1998(1)2000) ind6(1998(1)2000) ind8(1998(1)2000) ind9(1998(1)2000) educ1(1998(1)2000) educ2(1998(1)2000) educ3(1998(1)2000) rate(1998(1)2000)
ind1(2001(1)2003) ind2(2001(1)2003) ind3(2001(1)2003) ind4(2001(1)2003) ind5(2001(1)2003) ind6(2001(1)2003) ind8(2001(1)2003) ind9(2001(1)2003) educ1(2001(1)2003) educ2(2001(1)2003) educ3(2001(1)2003) rate(2001(1)2003)
ind1(2004(1)2006) ind2(2004(1)2006) ind3(2004(1)2006) ind4(2004(1)2006) ind5(2004(1)2006) ind6(2004(1)2006) ind8(2004(1)2006) ind9(2004(1)2006) educ1(2004(1)2006) educ2(2004(1)2006) educ3(2004(1)2006) rate(2004(1)2006), 
trunit(4) counit(1 2 5 6 8 9 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 29 30 31 32 33 34 35 36 37 38 39 40 41 42 46 47 48 50 51 53 54 55 56)
trperiod(2007) fig;
#delimit cr

