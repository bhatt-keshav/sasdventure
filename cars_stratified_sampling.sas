* -- select some cols -- ; 
data aaa_cars;
set sashelp.cars;
keep make MPG_City Model Cylinders;
run;

* -- data needs to be sorted for performing stratified sampling -- ;
proc sort data=aaa_cars; 
by make mpg_city; 
run; 

* -- selects a unique 'make' randomly -- ;
proc surveyselect data=aaa_cars
out = aaa_cars_sample
seed=42
sampsize=1; 
strata make MPG_City;
run;

* -- takes combination of a unique 'mpg_city' per 'make' -- ;
proc surveyselect data=aaa_cars
out = aaa_cars_sample
seed=42
sampsize=1; 
strata make MPG_City;
run;

/* REFER: https://www.datasciencemadesimple.com/stratified-sampling-in-sas/ */ 