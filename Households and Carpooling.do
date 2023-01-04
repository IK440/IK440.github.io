clear

set more off

use "/Users/ik_4275/Downloads/The Effects of Carpooling on Household Income.dta"

browse

describe

*How many people are less than 1 year old are in the dataset?
tabulate age 
summarize age if age==1, detail
count if age==1

*Clean up data
sum incwage, detail
drop if incwage<600
drop if incwage<10000
drop if incwage==999999
drop if age<18 | age>75
drop if city==0
format incwage %8.0g
drop educ
drop raced
drop if famsize>=9
drop if carpool==0
drop if fertyr==0

tab city, nolabel
tab educd, nolabel
tab statefip
tab famsize
tab carpool
tab fertyr

sum incwage, detail
