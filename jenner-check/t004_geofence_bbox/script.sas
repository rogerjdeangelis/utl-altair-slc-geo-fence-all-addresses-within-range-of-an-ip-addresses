/* Adapted from step 9 "300ft Geofence" of the geo-fence pipeline.
   The heart of the "geo fence": select every address whose averaged
   latitude/longitude falls inside a small bounding box around the target IP,
   numbering the survivors with a zero-padded LTR counter (put(_n_,z2.)) used
   as the plot label. Same WHERE range and RETAIN/z2. logic against a small
   inline address set (one far-away LA row is included to show it is excluded). */
data adrout;
  length intlatlon $7 adr $64;
  input adr $char32. avglat avglon;
  intlatlon=cats(int(avglat),int(avglon));
datalines;
38447 KIMBRO ST 94536            37.5485 -121.998
4025 MOWRY AVE 94538             37.5485 -121.989
4055 MOWRY AVE 94538             37.5484 -121.989
100 FAR AWAY RD 90001            34.0000 -118.000
;
run;

data fence;
   retain ltr '  ';
   set adrout(
     where= (
       37.5483   <= avglat <= 37.5485 and
      -122.000  <= avglon <= -121.989 )
     );
   ltr=put(_n_,z2.);
run;

proc print data=fence;
run;
