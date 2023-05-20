* -- does not print all info to the log only what you need -- ; 
options nosource;
* -- prints all info to the log -- ;
options source;

/*  ----------------------------------------------------------
# How loops work
----------------------------------------------------------  */

/* Do loop in the conventional manner w/o macros 
requires a data step though */
DATA salary;
    /*define variables*/
    raise=0.1;
    salary=50000;
    year=1;
    /*do loop*/
    DO year=1 to 20 by 2;
        salary + salary*raise;
        output; /*generates an observation for each iteration of the do loop, optional*/
    END;
RUN;

/*  ---------------------------------------------------------
# How macros work
-------------------------------------------------------------  */

* -- example 1 -- ;
/* everything in the macro statement should be prefixed with %*/
%let string = This is a string of words.;

%macro scan_example;
%do i = 1 %to %sysfunc(countw(&string));
    %let current_word = %scan(&string,&i);
    %PUT &=current_word;
%end;
%mend;
/* call the macro by %macro; */
%SCAN_EXAMPLE;

* -- example 2 -- ;
%macro doloop;
  %do age=11 %to 15 %by 2;
    /* can do a normal task also between the %do-%end block */
    title Age=&age.;
    proc print data=sashelp.class(where=(age=&age.));
    run;
  %end;
%mend;
%doloop;

* -- example 3 -- ;
/* can take in args in () */
%macro create(howmany);
   %do i=1 %to &howmany;
      data month&i;         
	  infile in&i;
	  input product cost date;
      run;
   %end;
%mend create;
%create(3);

/* displays data in your table */
proc contents data = ead_table;
run;


/*  ---------------------------------------------------------
# Determine the PATH of your script
-------------------------------------------------------------  */

/* Writes all the (global) variables associated with your 
*script* to the log*/
%put _ALL_;

/* Where  is this project/program located*/
%put &=_CLIENTPROJECTPATH;
%put %sysfunc(getoption(work));

What do these do?
%sysfunc(pathname(sasautos));

%put sysin: %sysfunc(getoption(sysin));


  /* Compare 2 datasets */
proc compare base=base-dataset
compare=comparison-dataset;
run;

/* Convert numeric date format to human readable*/
%sysfunc(putn(12461, date7.));

/* This macro language statement deletes global macro variables: */
%SYMDEL macro-variable(s);

/* Renaming */
data temp;
   input (score1-score3) (2.,+1) name $;      
   datalines;
12 24 36 Lisa
13 44 66 Fran
11 44 66 Gran
15 44 66 Hran
16 44 66 Iran
;

data temp2;
rename score1=newscore;
set temp;
if score1 > 12;
run;

/* ###################################################################
						Copying A Dataset				
####################################################################*/
libname keshav "/repo/userdata/Keshav";
%macro store_locally;
%do months = 6 %to 36 %by 6;
	DATA keshav.a;
	set work.a;	
RUN;
	%end;
%mend;

%store_locally;

###### JOINING WITH WHERE ####
https://documentation.sas.com/doc/en/pgmsascdc/v_024/sqlproc/p0o4a5ac71mcchn1kc1zhxdnm139.htm

libname sql 'SAS-library';

proc sql;
   title 'US Cities South of Cairo, Egypt';
   select us.City, us.State, us.Latitude, world.city, world.latitude
      from sql.worldcitycoords world, sql.uscitycoords us
      where world.city = 'Cairo' and
            us.latitude lt world.latitude;
