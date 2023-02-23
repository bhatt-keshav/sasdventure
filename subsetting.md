## There are various ways to subset

### By using if
Here it is implied if condition is true, keep records. If clauses join without problem
```
data carz;
set SASHELP.CARS;
if make eq 'Acura' and Type eq 'Sedan';
run;
```

### Where with also
According to this paper, multiple where clauses after each other are not good. The last `where` will replace previous `where`. Hence, better to use `where also`
https://www.pharmasug.org/proceedings/2014/CC/PharmaSUG-2014-CC13.pdf

```
data carz;
set SASHELP.CARS;
where make eq 'Acura';
where also Type eq 'Sedan';
run;
```
### Where together
It seems multiple `where` work just fine. Test before use though. 

PS: If the WHERE= option is attached to the SET statement, SAS selects the observations that meet the condition as it reads in the data. 
If the WHERE= option is attached to the DATA statement, SAS selects the observations as it writes the data from the program data vector 
to the output data set
```
data carz;
set SASHELP.CARS (WHERE=(make eq 'Acura' AND Type eq 'Sedan'));
run;
```

