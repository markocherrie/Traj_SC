* Install plugin from the web

*net from http://www.andrew.cmu.edu/user/bjones/traj
*net install traj, force
*help traj

use http://www.andrew.cmu.edu/user/bjones/traj/data/montreal_sim.dta,
    clear

	
traj, var(qcp*op) indep(age*) model(cnorm) min(0) max(10) order(1 3 2)

trajplot, xtitle(Age) ytitle(Opposition) xlabel(6(1)15) ylabel(0(1)6)

list _traj_Group - _traj_ProbG3 if _n < 3, ab(12)

matrix list e(plot1), format(%9.2f) noheader


