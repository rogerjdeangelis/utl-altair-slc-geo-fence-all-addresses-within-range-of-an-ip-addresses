/* Adapted from step 2 "ipv4 csv to wpd dataset" of
   utl-altair-slc-geo-fence-all-addresses-within-range-of-an-ip-addresses.sas
   The original reads d:/csv/geolocationDatabaseIPv4.csv via INFILE; here the
   same INFORMAT / INPUT layout and the  if country_code=:"US"  subset run
   against a small inline sample (rows taken from the author's own captured
   PROC PRINT of SD1.IPV4). Logic and column shapes are unchanged. */
data ipv4;
  length start_ip end_ip $15 continent country_code $2 country $13
         state $20 city $32 zip $8 source $139 timezone $30;
  infile datalines dsd missover;
  informat latitude longitude accuracy best32. ip_version 3.;
  input ip_version start_ip $ end_ip $ continent $ country_code $
        country $ state $ city $ zip $ timezone $
        latitude longitude accuracy source $;
  if country_code=:"US";
datalines;
4,1.32.232.0,1.32.239.255,NA,US,United States,DC,Washington,56972,America/New_York,38.8951,-77.0364,5,whois
4,1.178.1.0,1.178.1.255,NA,US,United States,Ohio,Boardman,44512,America/New_York,41.0242,-80.6629,5,amazonaws
4,1.178.4.0,1.178.5.255,NA,US,United States,Virginia,Ashburn,20598,America/New_York,39.0437,-77.4875,5,amazonaws
4,1.178.8.0,1.178.8.255,NA,US,United States,Ohio,Columbus,43215,America/New_York,39.9612,-82.9988,5,amazonaws
4,185.253.142.0,185.253.142.255,NA,US,United States,California,Fremont,94538,America/Los_Angeles,37.5483,-121.989,5,charter
4,8.8.8.0,8.8.8.255,NA,CA,Canada,Ontario,Toronto,00000,America/Toronto,43.6532,-79.3832,5,google
;
run;

proc print data=ipv4;
run;
