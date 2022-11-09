/*  Creates a dataset with columns and no data */
data want;
  format date date9. air 10. region $Char5. char_col $7. open_dt MMDDYY10. number_col BEST12.;
  stop;
run;
