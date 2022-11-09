/* One var */
data new_data;
    set original_data;
    if var1 = "string" then delete;
run;

/* Two vars. with AND  */
data new_data;
    set original_data;
    if var1 = "string" and var2 < 10 then delete;
run;

/* Two vars. with OR  */
data new_data;
    set original_data;
    if var1 = "string" or var2 < 10 then delete;
run;
