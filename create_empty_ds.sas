/*  Creates a dataset with columns and no data */
data want;
  format date date9. air 10. region $Char5.;
  stop;
run;
