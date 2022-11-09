## The difference between a RUN statement and a QUIT statement is

that a RUN statement executes previously submitted SAS statements and a QUIT statement executes previously submitted 
SAS statements and ends the procedure. 

A `RUN` or `QUIT` statement tells SAS to terminate the PROC step before executing the next step in a program. A `RUN`
statement is normally specified to designate an end to a *non-interactive procedure* like `PROC PRINT`, whereas a
`QUIT` statement is specified to terminate an interactive procedure such as `PROC SQL` (more will be said about
interactive procedures later). Although not required statements, specifying a `RUN` or `QUIT` statement can provide
modest CPU improvements since the SAS Supervisor knows when one step ends and another begins

The `DATASETS` procedure is an interactive procedure (like the SQL procedure), it remains active even after a
RUN statement is issued. To turn it off you issue a `QUIT` statement. 


## TLDR
_Use Quit with:_

- `PROC SQL`
- `DATASETS`
- `ANOVA`
- `ARIMA`
- `CATMOD`
- `FACTEX`
-  `GLM` 
-  `MODEL`
-  `OPTEX`
-  `PLAN`
-  `REG`

### References:
- https://chemicalstatistician.wordpress.com/2018/08/01/some-sas-procedures-like-proc-reg-glm-anova-sql-and-iml-end-with-quit-not-run/
- https://www.lexjansen.com/wuss/2012/18.pdf
    - pg 2, 6, 14 (search for "interactive")
