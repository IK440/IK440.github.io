clear
set more off

use "/Users/ik_4275/Downloads/New Car Purchasing(1).dta"

browse

*Start off with a regular linear regression on CarPurchase
regress CarPurchase Income OldestVehicle Child

*Run a predict command based on the regression above
predict newcar_ols

summarize newcar_ols, detail

*Run a logistic regression on CarPurchase
logit CarPurchase Income OldestVehicle Child
predict newcar_logit

summarize newcar_logit, detail

*Make a prediction for a family with income of $60K, oldest vehicle is 6 years old and there is no change in child situation
margins, at(Income=60 OldestVehicle=6 Child=0)

*Make this prediction again if child is 1
margins, at(Income=60 OldestVehicle=6 Child=1)

*Make a prediction if income=85, oldest=8 and child=0
margins, at(Income=85 OldestVehicle=8 Child=0)

*Make a prediction if income=85, oldest=8 and child=1
margins, at(Income=85 OldestVehicle=8 Child=1)

*What is the marginal effect of the independent variables on a household with income of 60K, oldest being 6 and no child
margins, dydx(*)at(Income=60 OldestVehicle=6 Child=0)
margins, dydx(*)at(Income=85 OldestVehicle=8 Child=0)
margins, dydx(*)at(Income=20 OldestVehicle=2 Child=0)

*To find out how good our logistic regression is
estat classification

display 385/500
