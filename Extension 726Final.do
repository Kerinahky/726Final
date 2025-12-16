
* EXTENSION

* Create the same outcome as Figure 1 (low-edu noncitizen Hispanic, age 15–45)
capture drop hispnoncitizene1e21545
gen hispnoncitizene1e21545 = hispnoncitizene11545 + hispnoncitizene21545

* Drop same "LAWA-like" states as your replication
drop if inlist(statefip, 28, 44, 45, 49)

* Keep AZ + donor pool states used in synth
keep if inlist(statefip, 4, ///
1,2,5,6,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,38,39,40,41,42,46,47,48,50,51,53,54,55,56)

* Define treatment + post
gen AZ   = (statefip==4)
gen post = (year>=2008)
gen did  = AZ*post

* Panel setup
xtset statefip year

* DiD regression with state FE + year FE, clustered SEs
xtreg hispnoncitizene1e21545 did i.year, fe cluster(statefip)

xtreg hispcitizen1545 did i.year, fe cluster(statefip)
