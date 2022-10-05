/* DELETEALL global macros */

%macro deleteALL;
 
   	options nonotes;
 
  	%local vars;
 
  	proc sql noprint;
      	     select name into: vars separated by ' '
         	  from dictionary.macros
            	      where scope='GLOBAL' 
			   and not name contains 'SYS_SQL_IP_';
   	quit;
 
   	%symdel &vars;
 
   	options notes;
 
    	%put NOTE: Macro variables deleted.;
 
%mend deleteALL;