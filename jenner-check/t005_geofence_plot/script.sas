/* Adapted from step 9 "300ft Geofence" of the geo-fence pipeline -- the
   ASCII map at the top of the repo. The author renders the fenced addresses
   as a boxed PROC PLOT of AVGLAT*AVGLON, using the LTR counter as the point
   label so each residence shows its number on the map. Same
   plot avglat*avglon='*' $ltr / box  against a small inline fence
   (rows taken from the author's own captured RESIDENCES table). */
data fence;
  length adr $32 ltr $2;
  input adr $char32. avglat avglon;
  ltr=put(_n_,z2.);
datalines;
38447 KIMBRO ST 94536            37.5485 -121.998
38461 KIMBRO ST 94536            37.5484 -121.998
38514 KIMBRO ST 94536            37.5485 -121.997
38658 DREXEL CTS 94536           37.5485 -121.995
38670 DREXEL CTS 94536           37.5483 -121.995
38679 BELOIT ST 94536            37.5485 -121.994
38705 BELOIT ST 94536            37.5484 -121.994
38870 BELL ST 94536              37.5485 -121.990
;
run;

proc print data=fence;
run;

options ls=64 ps=44;
proc plot data=fence;
 plot avglat*avglon='*' $ltr/box;
run;
options ls=255 ps=255;
