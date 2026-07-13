/* Adapted from step 5 "ipv4 address to lat lon" of the geo-fence pipeline.
   Given the averaged IP index, the author pulls the one apriori IP
   (185.253.142.0) and builds a coarse INTLATLON bucket key by concatenating
   the integer parts of the latitude and longitude -- this key later drives a
   fast indexed lookup against 132M addresses. Same WHERE-subset and
   intlatlon=cats(int(avglat),int(avglon)) run against a small inline index. */
data ipIdx;
  length start_ip $15 city $32 state $20;
  input dup_group_size start_ip $ city $ state $ avglat avglon;
datalines;
1 1.178.1.0 Boardman Ohio 41.0242 -80.6629
1 1.178.8.0 Columbus Ohio 39.9612 -82.9988
1 185.253.142.0 Fremont California 37.5483 -121.989
;
run;

data getlatlon;
  length intlatlon $7;
  set ipIdx(where= (start_ip = "185.253.142.0"));
  intlatlon=cats(int(avglat),int(avglon));
run;

proc print data=getlatlon;
run;
