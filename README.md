# Numerical-Method
Useful matlab function to solve Numerical problem
--
### Roots and Optimization
1. Roots : Bracketing Methods
* incsearch.m, bisect.m, false_position.m

2. Roots : Open Methods
* fixiter.m,newtrpah.m,Newthon-Rapshonsecant.m, modified_secant.m

3. Optimization
* goldmin.m, goldmax.m, interpol2.m, interpol3.m 
---
### Linear Systems
1. Gauss Elimination
* GaussNaive.m, GaussPivot.m, Tridang.m

2. LU Factorization
* my_LU_Naive, my_LU_pivot.m, my_chol.m

3. Iterative Methods
* Gauss_Seidal.m, Jacobi.m, Gauss_SeidalR.m, succesive_sum.m,newtmult.m
* digon_domin.m(checking digonally dominant to check out convergence)
* sor.m : succecive overrelaxation
* jfreact2.m : making jacobian.
---
### Curve Fitting
1. Linear Regression
* linreger.m, lin_quan.m(Quanification of error of linear sys)
* expfit2.m, powerfit.m, sat_growth.m : transform Non-linear to linear

2. General Linear Least-Squares and Non-linear Regression
* gen_quan.m : Quanification of error of General linear Least-Squares)

3. Polynominal Interpolation
* polyint.m , Newtint.m, Lagrange.m

4. Splines and Piecewise Interpolation
* natspline.m
---
### Integration and Differentiation
1. Numerical Integration Formulas
* trap,trap2,trapuneq.m : based on synthesis trapezoidal rule
* simpson,simpson2.m : based on synthesis simpson1/3 + simpson3/8 rule
* simpson13,simpson13d.m : simpson1/3 rule
* simpson38,simpson38d.m : simpson3/8 rule
* simpsMulti.m : multiple integral using simpson rule

2. Numerical Integration of Functions
* romberg.m : integrate using Richardson extrapolation.
* gausslege.m : integrate using Gauss-Legendre rule.
* quadadapt.m : depend on gradient, change the interval size

3. Numerical Differentiation
* rombdiff.m : diffrential using Richardson extrapolation.
* diffeq,diffuneq.m : if interval size eqaul using diffeq, else diffuneq
* diff_fin.m : finite diffrential based on High-Accuracy Differentiation Formulas.
* partia_diff.m
---
