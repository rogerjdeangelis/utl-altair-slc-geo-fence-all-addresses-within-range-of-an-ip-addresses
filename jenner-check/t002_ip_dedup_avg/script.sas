/* Adapted from step 4 "ipv4 fix dups index" of the geo-fence pipeline.
   The original collapses duplicate START_IP rows by averaging their
   latitude/longitude (some IP ranges repeat with slightly different points).
   Same count(*) / avg(latitude) / avg(longitude) grouped by START_IP, run
   here against a small inline sample lifted from the author's captured
   SD1.IPIDX output (note 1.178.4.0 appears twice -> DUP_GROUP_SIZE=2). */
data ipv4;
  length start_ip $15 city $32 state $20;
  input start_ip $ city $ state $ latitude longitude;
datalines;
1.178.1.0 Boardman Ohio 41.0242 -80.6629
1.178.30.0 Boardman Ohio 41.0242 -80.6629
1.178.4.0 Ashburn Virginia 39.0437 -77.4875
1.178.4.0 Ashburn Virginia 39.0437 -77.4875
1.178.8.0 Columbus Ohio 39.9612 -82.9988
185.253.142.0 Fremont California 37.5483 -121.989
;
run;

proc sql;
  create table ipIdx as
  select
    start_ip
   ,count(*)       as dup_group_size
   ,max(city)      as city
   ,max(state)     as state
   ,avg(latitude)  as avgLat
   ,avg(longitude) as avgLon
  from ipv4
  group by start_ip
;quit;

proc print data=ipIdx;
run;
