options mprint;
Options mlogic;

%macro avrg(table=, col=);
	proc sql noprint;
	select avg(&col.) into :av from &table.;
	%put &av;
	run;
%mend avrg;

%avrg(table=sashelp.air, col=air);

%macro test2(t1=, c1=);
	%avrg(table=sashelp.air, col=air);
	%avrg(table=&t1., col=&c1.);  
%mend;
%test2(t1=sashelp.bmt, c1=T);

%macro top(table=, col=);
	proc sql noprint;
		select avg(&col.) into :av from &table.;
		%put &av;
		run;
	%macro mid(varb=);
		%let c = %sysevalf(&varb. + 2);
		%put &c;
	%mend;
	%mid(varb= &av);
%mend;

%top(table=sashelp.air, col=air);

%macro top1(table=, col=);
	proc sql noprint;
		select avg(&col.) into :av from &table.;
		%put &av;
		run;
	%mid(varb= &av);
%mend;
%macro mid1(varb=);
	%let c = %sysevalf(&varb. + 2);
	%put &c;
%mend;


%top1(table=sashelp.air, col=air);
