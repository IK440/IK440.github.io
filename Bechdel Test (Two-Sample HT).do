clear
set more off

use "/Users/ik_4275/Downloads/Bechdel Test (Small Stata)(1).dta"

*Run a two-sample HT for movies that pass the Bechdel test vs. movies that don't
*H0: Mu(boxoffice),Bechdelpass = Mu(boxoffice),Bechdelfail
*H1: Mu(boxoffice),Bechdelpass != Mu(boxoffice),Bechdelfail

*Run a two-sample HT for movies that pass the Bechdel test have lower budgets in 2013 dollars than those that don't
*H0: Mubudget,Bechdelpass >= Mubudget,Bechdelfail
*H1: Mubudget,Bechdelpass < Mubudget,Bechdelfail

*Compare the standard deviations for domestic gross for movies by those that pass and don't pass the Bechdeltest
sdtest domgross_2013, by(bechdel_test)

ttest domgross_2013, by(bechdel_test) unequal

* Create a new variable called return on investment
generate dom_roi = domgross_2013 / budget_2013

*Run a two-sample hypothesis test to see if the ROI on movies that passed the Bechdel test is different than the ROI that failed the Bechdel test
*H0: Mu(ROI),Bechdelpass = Mu(ROI),Bechdelfail
*H1: Mu(ROI),Bechdelpass != Mu(ROI),Bechdelfail
ttest dom_roi, by(bechdel_test) unequal
