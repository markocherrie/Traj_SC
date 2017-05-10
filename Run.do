* Install plugin from the web

*net from http://www.andrew.cmu.edu/user/bjones/traj
*net install traj, force
*help traj

use http://www.andrew.cmu.edu/user/bjones/traj/data/montreal_sim.dta,
    clear

	
traj, var(qcp*op) indep(age*) model(cnorm) min(0) max(10) order(1 3 2)

* var= dependent variables
* indep= whent the dependent variables were measured
* model= based on the probability distirbution of the dependent- cnorm (normal), zip (poisson with lots of zeros), logit (binary)
* order= 1-linear, 2-quadratic, 3-cubic
* min= minimum value for cnorm model
* max= max value for cnorm model


ereturn list

*

trajplot, xtitle(Age) ytitle(Opposition) xlabel(6(1)15) ylabel(0(1)6)

* Group assignment and group membership probabilities for the first 2 subject

list _traj_Group - _traj_ProbG3 if _n < 3, ab(12)

matrix list e(plot1), format(%9.2f) noheader

* Introducing Time-Stable Covariates (complete case)
traj, model(cnorm) var(o1-o7) indep(tt1-tt7) order(3 3 3 3 3) min(0) max(10)
risk(qiver91 advers84 h_inatt) 
