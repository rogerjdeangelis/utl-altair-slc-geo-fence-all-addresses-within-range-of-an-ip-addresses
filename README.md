# utl-altair-slc-geo-fence-all-addresses-within-range-of-an-ip-addresses
Altair slc geo fence all addresses within range of an ip addresses
    %let pgm=utl-altair-slc-geo-fence-all-addresses-within-range-of-an-ip-addresses;

    %stop_submission;

    Altair slc geo fence all addresses within range of an ip addresses

    Too long to post on a list, see github
    https://github.com/rogerjdeangelis/utl-altair-slc-geo-fence-all-addresses-within-range-of-an-ip-addresses

    Closest to IPV4 185.253.142.0 (Charter Communications / Spectrum Network? Northen CA ??)

                                                                            From                    From
                                                                          IPV4 Dtabase         Address Dtabase
                                                                       ------------------    --------------------
       START_IP               ADR              CITY        STATE       IPV4LAT    ADRLAT     IPV4LON      ADRLON

     185.253.142.0    4025 MOWRY AVE 94538    Fremont    California    37.5483    37.5485    -121.989    -121.989

                                 GEOFENCE

             -122    -121.9975 -121.995  -121.9925 -121.99 -121.9875
             --+---------+---------+---------+---------+---------+--
      AVGLAT |                                                     |                RESIDENCES AROUND IPV4 185.253.142.0
             |  APPROX 700fT Fence around IP Address 185.253.142.0 |
     37.5485 +                                                     +  37.5485   NUM          ADR                AVGLAT      AVGLON
             |                                             * 10    |
             |        * 01                               * 09      |            01   38447 KIMBRO ST 94536     37.5485    -121.998
             |                                                     |            02   38461 KIMBRO ST 94536     37.5484    -121.998
             |                       * 06                          |            03   38514 KIMBRO ST 94536     37.5485    -121.997
             |            * 03                                     |            04   38658 DREXEL CTS 94536    37.5485    -121.995
    37.54845 +                     * 04              * 08          + 37.54845   05   38670 DREXEL CTS 94536    37.5483    -121.995
             |                                                     |            06   38679 BELOIT ST 94536     37.5485    -121.994
             |              * 14                                   |            07   38705 BELOIT ST 94536     37.5484    -121.994
             |                                                     |            08   38870 BELL ST 94536       37.5485    -121.990
             |      * 15                                           |            09   38891 FREMONT BL 94536    37.5485    -121.990
             |                                                     |            10   4025 MOWRY AVE 94538      37.5485    -121.989
     37.5484 +                * 13                                 +  37.5484
             |                              Closest                |            11   4055 MOWRY AVE 94538      37.5484    -121.989 * Exact Location
             |                              185.253.142.0 * 11     |                                                                 185.253.142.0
             |                              ------------------     |            12   4200 GARLAND DR 94536     37.5483    -121.993
             |        * 02                                         |            13   4260 CANFIELD DR 94536    37.5484    -121.996
             |                                                     |            14   4289 CANFIELD DR 94536    37.5484    -121.997
    37.54835 +   * 16                 * 07                         + 37.54835   15   4327 COGNINA CTS 94536    37.5484    -121.999
             |                                                     |            16   4342 EGGERS DR 94536      37.5484    -121.999
             |                      * 05  * 12                     |
             |                                                     |
             |                                See Legend on Right  |
             |                                                     |
     37.5483 +                                                     +  37.5483
             |                                                     |
             --+---------+---------+---------+---------+---------+--
             -122    -121.9975 -121.995  -121.9925 -121.99 -121.9875

                                     AVGLON

    macros
    https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories
    https://github.com/rogerjdeangelis/utl-altair-slc-free-unlimited-geofencing-geocoding-reverse-geocoding-all-I32-million-us-addresses

    CONTENTS

       1 preparation

     Build ipv4 database
       2 ipv4 csv to wpd dataset (char length $255, numeric best32.)
       3 ipv4 optimize lengths
       4 ipv4 fix dups index
       5 ipv4 address to lat lon

     Build us address database

       6 address csv to wpd
       7 address sort index
       8 get closest address
       9 300ft Geofence

    Related Repos
    ---------------------------------------------------------------------------------------------------------------------------------
    https://github.com/rogerjdeangelis/utl-altair-slc-separate-invoices-for-a-mailing-list-and-adressing-tools
    https://github.com/rogerjdeangelis/utl-given-us-household-adresses-with-geoid-and-census-track-add-acs-census-variables
    https://github.com/rogerjdeangelis/utl-given-us-household-adresses-with-zipcode-add-census-acs5yr-zcta-zipcode-census-variables
    https://github.com/rogerjdeangelis/utl-altair-slc-free-unlimited-geofencing-geocoding-reverse-geocoding-all-I32-million-us-addresses
    https://github.com/rogerjdeangelis/utl-dept-of-trans-address-database-to-sas-wps-tables-for-geocoding-and-reverse-geocoding
    https://github.com/rogerjdeangelis/utl-free-unlimited-geocoding-reverse-geocoding-wps-aprox-I41-million-addresses-with-gps
    https://github.com/rogerjdeangelis/utl-given-a-list-of-messy-addresses-geocode-and-reverse-geocode-using-us-address-database
    https://github.com/rogerjdeangelis/utl-ipv4-ipaddress-in-four-binary-bytes-or-five-or-fewer-printable-characters
    https://github.com/rogerjdeangelis/utl-join-us-addresses-with-census-acs-five-yr-block-group-data-most-granular
    https://github.com/rogerjdeangelis/utl-openaddress-database-to-sas-wps-tables-for-geocoding-and-reverse-geocoding
    https://github.com/rogerjdeangelis/utl-standardize-address-suffix-using-usps-abreviations
    https://github.com/rogerjdeangelis/utl-use-geo-fencing-to-find-all-addresses-in-a-latitude-longitude-quadrangle-reverse-geocoding
    https://github.com/rogerjdeangelis/utl_US_address-standardization
    https://github.com/rogerjdeangelis/utl_geocode_and_reverse_geocode_netherland_addresses_and_latitudes_longitudes

    /*
    / |  _ __  _ __ ___ _ __
    | | | `_ \| `__/ _ \ `_ \
    | | | |_) | | |  __/ |_) |
    |_| | .__/|_|  \___| .__/
        |_|            |_|
    */

    Create folders

       Decide on IP address
            Use 185.253.142.0

       IPV4 (ip addresesses us only)

             https://ipapi.is/geolocation.html

             download ipv4  csv data bases
             unnzip into d:/csv/geolocationDatabaseIPv4.csv

        US 132 million residential & business adresses

          A  create folders
             d:/exe  place downloaded self extracting 7-zip
             d:/csv  place csv from the self extracting 7-zip
             d:/sd1  address database and ip database
             d:/zip  unnzip into d:/csv/geolocationDatabaseIPv4.csv


          B  download adr_fix132e6.exe 143 million addresses (1.45gb win10) into d:/adr/exe/adr_fix132e6.exe (10gb unzipped)
             https://github.com/rogerjdeangelis/utl-altair-slc-free-unlimited-geofencing-geocoding-reverse-geocoding-all-I32-million-us-addresses

             Same csv file (just belt and suspenders)
             https://1drv.ms/u/c/bb0f3c4c9b1dc58b/EeJAnwdAgy9Oo1C4IIzf_VIBVcUhQGZRHBZZ2ulv0gICSQ?e=LXtbdk

             https://drive.google.com/file/d/1j3u9g9X4t5GYoz4O62oEs63RVp_qSlhq/view?usp=drive_link
             https://www.dropbox.com/scl/fi/hijvujwjotftaqiu93dgt/adr_fix132e6.exe?rlkey=efa8b49x52tpc25kz1vloc06g&st=f8insd26&dl=0

          C  Unzip the self extracting 7-zip file you downloaded save in d:/csv/adr_fix132e6.csv
             Just click on the exe file (131,789,977 records)
             Be patient you may need to allow win 11 to run the self extrating zip.
             This takes a couple of minutes

    /*___    _            _  _     _                            _      _       _                 _
    |___ \  (_)_ ____   _| || |   | |_ ___  __      ___ __   __| |  __| | __ _| |_ __ _ ___  ___| |_
      __) | | | `_ \ \ / / || |_  | __/ _ \ \ \ /\ / / `_ \ / _` | / _` |/ _` | __/ _` / __|/ _ \ __|
     / __/  | | |_) \ V /|__   _| | || (_) | \ V  V /| |_) | (_| || (_| | (_| | || (_| \__ \  __/ |_
    |_____| |_| .__/ \_/    |_|    \__\___/   \_/\_/ | .__/ \__,_| \__,_|\__,_|\__\__,_|___/\___|\__|
              |_|                                    |_|
    */

    /*--- NOTE YOU CAN GET A SAMPLE IPV4 USING COMMAND IPCONFIG   ---*/
    /*---  ADDRESS. . . . . . . . . . . : 192.168.4.30            ---*/
    /*--- CREATE IP DATABASE                                      ---*/

    options validvarname=v7;
    libname sd1 wpd "d:/sd1";

    /*--- NOTE THE VERY LONG DATA LENGTHS, WE WILL OPTIMIZE LATER ---*/
    data sd1.ipv4(compress=char);

    infile 'd:/csv/geolocationDatabaseIPv4.csv'
           delimiter = ','
           missover dsd
           lrecl=1000
           firstobs=2 ;

      informat
        start_ip
        end_ip
        continent
        country_code
        country
        state
        city
        zip
        source
        timezone       $255.
        ip_version
        latitude
        longitude
        accuracy       best32.
        ;

      input
        ip_version
        start_ip  $
        end_ip  $
        continent  $
        country_code  $
        country  $
        state  $
        city  $
        zip  $
        timezone  $
        latitude
        longitude
        accuracy
        source  $
        ;

     if country_code=:"US";

    run;

    libname sd1 wpd "d:/sd1";
    proc contents data=sd1.ipv4 position;run;
    run;
    proc print data=sd1.ipv4(obs=10);
    run;

    /**************************************************************************************************************************/
    /*  Altair SLC                                                                                                            */
    /*                                                                                                                        */
    /* The CONTENTS Procedure                                                                                                 */
    /*                                                                                                                        */
    /* Data Set Name            IPV4                                                                                          */
    /* Member Type              DATA                                                                                          */
    /* Engine                   WPD                                                                                           */
    /* Created                  06APR2026:10:45:59                                                                            */
    /* Last Modified            06APR2026:10:45:59                                                                            */
    /* Observations                1018171                                                                                    */
    /* Variables                14                                                                                            */
    /* Indexes                  0                                                                                             */
    /* Observation Length       2582                                                                                          */
    /* Deleted Observations              0                                                                                    */
    /* Data Set Type                                                                                                          */
    /* Label                                                                                                                  */
    /* Compressed               CHAR                                                                                          */
    /* Point to Observations    YES                                                                                           */
    /* Sorted                   NO                                                                                            */
    /* Data Representation      Little endian, IEEE Windows                                                                   */
    /* Encoding                 wlatin1 Windows-1252 Western                                                                  */
    /*                                                                                                                        */
    /*      Engine/Host Dependent Information                                                                                 */
    /*                                                                                                                        */
    /* Data Set Page Size          20480                                                                                      */
    /* Number of Data Set Pages    10219                                                                                      */
    /* Data Set Diagnostic Code    0013                                                                                       */
    /* File Name                   d:\sd1\IPV4.wpd                                                                            */
    /* WPD Engine Version          3                                                                                          */
    /* Large Data Set Support      no                                                                                         */
    /* Encrypted                   no                                                                                         */
    /*                                                                                                                        */
    /*                  List of Variables and Attributes in Creation Order                                                    */
    /*                                                                                                                        */
    /*       Number    Variable        Type             Len             Pos    Informat                                       */
    /* ____________________________________________________________________________________                                   */
    /*            1    start_ip        Char             255              32    $255.                                          */
    /*            2    end_ip          Char             255             287    $255.                                          */
    /*            3    continent       Char             255             542    $255.                                          */
    /*            4    country_code    Char             255             797    $255.                                          */
    /*            5    country         Char             255            1052    $255.                                          */
    /*            6    state           Char             255            1307    $255.                                          */
    /*            7    city            Char             255            1562    $255.                                          */
    /*            8    zip             Char             255            1817    $255.                                          */
    /*            9    source          Char             255            2072    $255.                                          */
    /*           10    timezone        Char             255            2327    $255.                                          */
    /*           11    ip_version      Num                8               0    BEST32.                                        */
    /*           12    latitude        Num                8               8    BEST32.                                        */
    /*           13    longitude       Num                8              16    BEST32.                                        */
    /*           14    accuracy        Num                8              24    BEST32.                                        */
    /*                                                                                                                        */
    /* Altair SLC                                                                                                             */
    /*                                country                                                                                 */
    /* Obs   start_ip      end_ip      code       country         state  city        timezone       longitude  accuracy       */
    /*                                                                                                                        */
    /*   1  1.32.232.0  1.32.239.255    US    United States  DC         Washington America/New_York   38.8951   -77.0364      */
    /*   2  1.178.1.0   1.178.1.255     US    United States  Ohio       Boardman   America/New_York   41.0242   -80.6629      */
    /*                                                                                                                        */
    /* ???                                                                                                                    */
    /*   3  1.178.4.0   1.178.5.255     US    United States  Virginia   Ashburn    America/New_York   39.0437   -77.4875      */
    /*   4  1.178.4.0   1.178.4.255     US    United States  Virginia   Ashburn    America/New_York   39.0437   -77.4875      */
    /*   5  1.178.5.0   1.178.5.255     US    United States  Virginia   Ashburn    America/New_York   39.0437   -77.4875      */
    /*   6  1.178.6.0   1.178.6.255     US    United States  Virginia   Ashburn    America/New_York   39.0437   -77.4875      */
    /*                                                                                                                        */
    /*   7  1.178.8.0   1.178.8.255     US    United States  Ohio       Columbus   America/New_York   39.9612   -82.9988      */
    /*   8  1.178.9.0   1.178.9.255     US    United States  Ohio       Boardman   America/New_York   41.0242   -80.6629      */
    /*   9  1.178.30.0  1.178.30.255    US    United States  Ohio       Boardman   America/New_York   41.0242   -80.6629      */
    /*  10  1.178.65.0  1.178.65.255    US    United States  Ohio       Boardman   America/New_York   41.0242   -80.6629      */
    /*                                                                                                                        */
    /*                                                                                       ip                               */
    /* Obs  zip                                      source                               version  latitude                   */
    /*                                                                                                                        */
    /*   1 56972  whoisOnlyCountryAvailable                                                            4          5           */
    /*   2 44512  http://ip-ranges.amazonaws.com/geo-ip-feed.csv                                       4          5           */
    /*   3 20598  http://ip-ranges.amazonaws.com/geo-ip-feed.csv                                       4          5           */
    /*   4 20598  https://raw.githubusercontent.com/chriselsen/AWS-Geofeed/main/data/aws-geofeed.txt   4          5           */
    /*   5 20598  https://raw.githubusercontent.com/chriselsen/AWS-Geofeed/main/data/aws-geofeed.txt   4          5           */
    /*   6 20598  https://raw.githubusercontent.com/chriselsen/AWS-Geofeed/main/data/aws-geofeed.txt   4          5           */
    /*   7 43215  https://raw.githubusercontent.com/chriselsen/AWS-Geofeed/main/data/aws-geofeed.txt   4          5           */
    /*   8 44512  http://ip-ranges.amazonaws.com/geo-ip-feed.csv                                       4          5           */
    /*   9 44512  http://ip-ranges.amazonaws.com/geo-ip-feed.csv                                       4          5           */
    /*  10 44512  http://ip-ranges.amazonaws.com/geo-ip-feed.csv                                       4          5           */
    /**************************************************************************************************************************/

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

     1                                          Altair SLC          10:45 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1
    2         options validvarname=v7;
    3         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    4
    5         /*--- NOTE THE VERY LONG DATA LENGTHS, WE WILL OPTIMIZE LATER ---*/
    6         data sd1.ipv4(compress=char);
    7
    8         infile 'd:/csv/geolocationDatabaseIPv4.csv'
    9                delimiter = ','
    10               missover dsd
    11               lrecl=1000
    12               firstobs=2 ;
    13
    14          informat
    15            start_ip
    16            end_ip
    17            continent
    18            country_code
    19            country
    20            state
    21            city
    22            zip
    23            source
    24            timezone       $255.
    25            ip_version
    26            latitude
    27            longitude
    28            accuracy       best32.
    29            ;
    30
    31          input
    32            ip_version
    33            start_ip  $
    34            end_ip  $
    35            continent  $
    36            country_code  $
    37            country  $
    38            state  $
    39            city  $
    40            zip  $
    41            timezone  $
    42            latitude
    43            longitude
    44            accuracy
    45            source  $
    46            ;
    47
    48         if country_code=:"US";
    49
    50        run;

    NOTE: The infile 'd:\csv\geolocationDatabaseIPv4.csv' is:
          Filename='d:\csv\geolocationDatabaseIPv4.csv',
          Owner Name=SLC\suzie,
          File size (bytes)=520107614,
          Create Time=22:44:24 Mar 06 2026,
          Last Accessed=10:45:59 Apr 06 2026,
          Last Modified=13:40:26 Apr 02 2026,
          Lrecl=1000, Recfm=V

    NOTE: 3844080 records were read from file 'd:\csv\geolocationDatabaseIPv4.csv'
          The minimum record length was 85
          The maximum record length was 262
    NOTE: Data set "SD1.ipv4" has 1018171 observation(s) and 14 variable(s)
    NOTE: Specifying compression for data set "SD1.ipv4" has decreased its size from 145454 to 10219 pages (a 93% reduction)
    NOTE: The data step took :
          real time : 15.869
          cpu time  : 15.781

    51
    52        libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    53        proc contents data=sd1.ipv4 position;run;
    NOTE: Procedure contents step took :
          real time : 0.047
          cpu time  : 0.046

    54        run;
    55        proc print data=sd1.ipv4(obs=10);
    56        run;
    NOTE: 10 observations were read from "SD1.ipv4"
    NOTE: Procedure print step took :
          real time : 0.016
          cpu time  : 0.015


    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 16.027
          cpu time  : 15.906

    /*____  _            _  _     _               _     _                  _   _
    |___ / (_)_ ____   _| || |   | |__   ___  ___| |_  | | ___ _ __   __ _| |_| |__  ___
      |_ \ | | `_ \ \ / / || |_  | `_ \ / _ \/ __| __| | |/ _ \ `_ \ / _` | __| `_ \/ __|
     ___) || | |_) \ V /|__   _| | |_) |  __/\__ \ |_  | |  __/ | | | (_| | |_| | | \__ \
    |____/ |_| .__/ \_/    |_|   |_.__/ \___||___/\__| |_|\___|_| |_|\__, |\__|_| |_|___/
             |_|                                                     |___/
    */

    /*--- SUBSET and OPTIMIZE LENGTHS AND KEEPING ONLY START_IP END_IP LATITUDE LONGITUDE ---*/
    libname sd1 wpd "d:/sd1";
    options validvarname=v7;
    %utl_optlenpos(
       inp=sd1.ipv4
      ,out=sd1.ipv4
      );
    run;

    /**************************************************************************************************************************/
    /*             BEFORE LENGTH OPTIMIZATION           |         AFTER LENGTH OPTIMIZATION                                   */
    /*                                                  |                                                                     */
    /*   IMPORT WITH LONG LENGTHS TO PREVENT TRUNCATION |  USE LONGEST LENGTHS THAT EXIST IN THE DATA                         */
    /*                                                  |                                                                     */
    /* Number    Variable        Type             Len   |  Number    Variable        Type             Len                     */
    /* _________________________________________________|  _____________________________________________________              */
    /*      1    start_ip        Char             255   |       1    start_ip        Char              15                     */
    /*      2    end_ip          Char             255   |       2    end_ip          Char              15                     */
    /*      3    continent       Char             255   |       3    continent       Char               2                     */
    /*      4    country_code    Char             255   |       4    country_code    Char               2                     */
    /*      5    country         Char             255   |       5    country         Char              13                     */
    /*      6    state           Char             255   |       6    state           Char              20                     */
    /*      7    city            Char             255   |       7    city            Char              32                     */
    /*      8    zip             Char             255   |       8    zip             Char               8                     */
    /*      9    source          Char             255   |       9    source          Char             139                     */
    /*     10    timezone        Char             255   |      10    timezone        Char              30                     */
    /*     11    ip_version      Num                8   |      11    ip_version      Num                3                     */
    /*     12    latitude        Num                8   |      12    latitude        Num                8                     */
    /*     13    longitude       Num                8   |      13    longitude       Num                8                     */
    /*     14    accuracy        Num                8   |      14    accuracy        Num                3                     */
    /**************************************************************************************************************************/

     /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

     1                                          Altair SLC          10:50 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    2         options validvarname=v7;
    3         %utl_optlenpos(
    4            inp=sd1.ipv4
    5           ,out=sd1.ipv4
    6           );

    NOTE: Procedure contents step took :
          real time : 0.047
          cpu time  : 0.015


    NOTE: Procedure sql step took :
          real time : 0.000
          cpu time  : 0.015

    NOTE: 1018171 observations were read from "SD1.ipv4"
    NOTE: 14 observations were read from "WORK.__layout"
    NOTE: The data step took :
          real time : 1.965
          cpu time  : 1.953


    NOTE: CALL EXECUTE generated line
    7       + data sd1.ipv4( compress=binary label='Dataset sd1.ipv4 processed by utl_optlen') ;
    8       +  retain
    9       +  start_ip
    10      +  end_ip
    11      +  continent
    12      +  country_code
    13      +  country
    14      +  state
    15      +  city
    16      +  zip
    17      +  source
    18      +  timezone
    19      +  ip_version
    20      +  latitude
    21      +  longitude
    22      +  accuracy
    23      +  ;length
    24      +  start_ip $15
    25      +  end_ip $15
    26      +  continent $2
    27      +  country_code $2
    28      +  country $13
    29      +  state $20
    30      +  city $32
    31      +  zip $8
    32      +  source $139
    33      +  timezone $30
    34      +  ip_version 3
    35      +  latitude 8
    36      +  longitude 8
    37      +  accuracy 3
    38      +  ;set sd1.ipv4;format _all_;informat _all_;run;

    38      +!                                               quit;
    NOTE: 1018171 observations were read from "SD1.ipv4"
    NOTE: Data set "SD1.ipv4" has 1018171 observation(s) and 14 variable(s)
    NOTE: Specifying compression for data set "SD1.ipv4" has decreased its size from 78322 to 45312 pages (a 43% reduction)
    NOTE: The data step took :
          real time : 3.148
          cpu time  : 3.140


    39        run;
    40
    41        proc contents data=sd1.ipv4 position;
    42        run;
    NOTE: Procedure contents step took :
          real time : 0.036
          cpu time  : 0.000


    43
    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 5.311
          cpu time  : 5.203

    /*  _     _            _  _      __ _            _                  _           _
    | || |   (_)_ ____   _| || |    / _(_)_  __   __| |_   _ _ __  ___ (_)_ __   __| | _____  __
    | || |_  | | `_ \ \ / / || |_  | |_| \ \/ /  / _` | | | | `_ \/ __|| | `_ \ / _` |/ _ \ \/ /
    |__   _| | | |_) \ V /|__   _| |  _| |>  <  | (_| | |_| | |_) \__ \| | | | | (_| |  __/>  <
       |_|   |_| .__/ \_/    |_|   |_| |_/_/\_\  \__,_|\__,_| .__/|___/|_|_| |_|\__,_|\___/_/\_\
               |_|                                          |_|
    */

    /*--- THE SAMEIP HAS MUTIPLE LATITUDES AND LOGITUDES, WE AVERAGE TO MAKE IPS UNIQUE ---*/
    /*--- MOST APPEAR TO JUST REPEAT IP WITH THE SAME LAT LON                           ---*/

    libname sd1 wpd "d:/sd1";

    proc sql;
      create
        table sd1.ipIdx(index=(start_ip/unique)) as
      select
        count(*)       as dup_group_size
       ,max(start_ip)  as start_ip
       ,max(city)      as city
       ,max(state)     as state
       ,avg(latitude)  as avgLat
       ,avg(longitude) as avgLon
      from
        sd1.ipv4
      group
        by start_ip
    ;quit;

    proc print data=sd1.ipIdx(obs=10);
    run;

    /**************************************************************************************************************************/
    /* Altair SLC                                                                                                             */
    /*                                                                                                                        */
    /* Obs    DUP_GROUP_SIZE     START_IP          CITY           STATE       AVGLAT      AVGLON                              */
    /*                                                                                                                        */
    /*   1           1          1.178.1.0      Boardman         Ohio          41.0242     -80.663                             */
    /*   2           1          1.178.100.0    San Francisco    California    37.7749    -122.419                             */
    /*   3           1          1.178.30.0     Boardman         Ohio          41.0242     -80.663                             */
    /*                                                                                                                        */
    /*   4           2          1.178.4.0      Ashburn          Virginia      39.0437     -77.487 Averaged                    */
    /*                                                                                            based on START_IP           */
    /*                                                                                                                        */
    /*   5           1          1.178.5.0      Ashburn          Virginia      39.0437     -77.487                             */
    /*   6           1          1.178.6.0      Ashburn          Virginia      39.0437     -77.487                             */
    /*   7           1          1.178.65.0     Boardman         Ohio          41.0242     -80.663                             */
    /*   8           1          1.178.8.0      Columbus         Ohio          39.9612     -82.999                             */
    /*   9           1          1.178.86.0     Columbus         Ohio          39.9612     -82.999                             */
    /*  10           1          1.178.9.0      Boardman         Ohio          41.0242     -80.663                             */
    /**************************************************************************************************************************/
    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */


    1                                          Altair SLC          13:30 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    2
    3         proc sql;
    4           create
    5             table sd1.ipIdx(index=(start_ip/unique)) as
    6           select
    7             count(*)       as dup_group_size
    8            ,max(start_ip)  as start_ip
    9            ,max(city)      as city
    10           ,max(state)     as state
    11           ,avg(latitude)  as avgLat
    12           ,avg(longitude) as avgLon
    13          from
    14            sd1.ipv4
    15          group
    16            by start_ip
    17        ;quit;
    NOTE: Data set "SD1.ipIdx" has 960120 observation(s) and 6 variable(s)
    NOTE: Procedure sql step took :
          real time : 3.144
          cpu time  : 3.640


    18
    19        proc print data=sd1.ipIdx(obs=10);
    20        run;
    NOTE: 10 observations were read from "SD1.ipIdx"
    NOTE: Procedure print step took :
          real time : 0.009
          cpu time  : 0.000


    21
    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 3.522
          cpu time  : 3.718

    /*___    _            _  _               _     _                     _         _       _     _
    | ___|  (_)_ ____   _| || |     __ _  __| | __| |_ __ ___  ___ ___  | |_ ___  | | __ _| |_  | | ___  _ __
    |___ \  | | `_ \ \ / / || |_   / _` |/ _` |/ _` | `__/ _ \/ __/ __| | __/ _ \ | |/ _` | __| | |/ _ \| `_ \
     ___) | | | |_) \ V /|__   _| | (_| | (_| | (_| | | |  __/\__ \__ \ | || (_) || | (_| | |_  | | (_) | | | |
    |____/  |_| .__/ \_/    |_|    \__,_|\__,_|\__,_|_|  \___||___/___/  \__\___/ |_|\__,_|\__| |_|\___/|_| |_|
              |_|
    */

    /*---  185.253.142.0 The IPUT APRIORI IP ---*/

    libname sd1 wpd "d:/sd1";

    data sd1.getlatlon;
      length intlatlon $7;
      set sd1.ipIdx(
         where= (start_ip = "185.253.142.0"));
      intlatlon=cats(int(avglat),int(avglon));
    run;quit;

    proc print data=sd1.getlatlon;
    run;quit;

    /**************************************************************************************************************************/
    /* Altair SLC                                                                                                             */
    /* Obs    INTLATLON    DUP_GROUP_SIZE      START_IP        CITY        STATE       AVGLAT      AVGLON                     */
    /*  1      37-121             1          185.253.142.0    Fremont    California    37.5483    -121.989                    */
    /**************************************************************************************************************************/

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

    1                                          Altair SLC          13:27 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    2
    3         data sd1.getlatlon;
    4           length intlatlon $7;
    5           set sd1.ipIdx(
    6              where= (start_ip = "185.253.142.0"));
    7           intlatlon=cats(int(avglat),int(avglon));
    8         run;

    NOTE: 1 observations were read from "SD1.ipIdx"
    NOTE: Data set "SD1.getlatlon" has 1 observation(s) and 7 variable(s)
    NOTE: The data step took :
          real time : 0.031
          cpu time  : 0.000


    8       !     quit;
    9
    10        proc print data=sd1.getlatlon;
    11        run;quit;
    NOTE: 1 observations were read from "SD1.getlatlon"
    NOTE: Procedure print step took :
          real time : 0.016
          cpu time  : 0.000


    12
    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 0.141
          cpu time  : 0.062


    /*__               _     _                                      _                 _
     / /_     __ _  __| | __| |_ __ ___  ___ ___    ___ _____   __ | |_ ___  __      ___ __   __| |
    | `_ \   / _` |/ _` |/ _` | `__/ _ \/ __/ __|  / __/ __\ \ / / | __/ _ \ \ \ /\ / / `_ \ / _` |
    | (_) | | (_| | (_| | (_| | | |  __/\__ \__ \ | (__\__ \\ V /  | || (_) | \ V  V /| |_) | (_| |
     \___/   \__,_|\__,_|\__,_|_|  \___||___/___/  \___|___/ \_/    \__\___/   \_/\_/ | .__/ \__,_|
                                                                                      |_|
    */

    /*--- WE WILL MATCH THE IP LAT LON TO THE CLOSEST 132 MILLION US ADDRESSES ---*/
    /*--- INTLATLON PROVIDES FAST LOOKUPS                                      ---*/
    /*--- WPD DATASETS ARE FASTER THAN SAS DATASETS                            ---*/

    libname sd1 wpd "d:/sd1";

    data sd1.address(compress=char);
       length intlatlon $7;
       infile 'd:/csv/adr_fix132e6.csv'
          /*---- SKIP FIRST ROW ----*/
          firstobs=2 delimiter=',' DSD lrecl=32767;
       informat MATCHCODE $64. ;
       informat ZIP4 $4. ;
       informat STATE $2. ;
       informat ADR $64. ;
       informat AVGLAT best12. ;
       informat AVGLON best12. ;
       input
          MATCHCODE
          ZIP4
          STATE
          ADR
          AVGLON
          AVGLAT
       ;

       intlatlon=cats(int(avglat),int(avglon));

       keep avglat avglon intlatlon adr;

    run;quit;

    libname sd1 wpd "d:/sd1";
    proc print data=sd1.address(obs=10);
    run;
    proc contents data=sd1.address;
    run;quit;

    /**************************************************************************************************************************/
    /* Altair SLC                                                                                                             */
    /* Obs    INTLATLON                 ADR                 AVGLAT      AVGLON                                                */
    /*   1      41-85      0008 S COUNTY RD 50 W 46701      41.3513    -85.4408                                               */
    /*   2      41-85      0009 E COUNTY RD 1050 N 46784    41.5011    -85.4232                                               */
    /*   3      40-74      000 BELLVALE RD 07046            40.8906    -74.4299                                               */
    /*   4      41-85      0010 N COUNTY RD 375 W 46701     41.3526    -85.4898                                               */
    /*   5      41-85      0010 W COUNTY RD 900 N 46794     41.4825    -85.4238                                               */
    /*   6      40-74      001 26TH ST 07410                40.9194    -74.1074                                               */
    /*   7      40-74      001 27TH ST 07410                40.9196    -74.1066                                               */
    /*   8      40-74      001 28TH ST 07410                40.9198    -74.1057                                               */
    /*   9      40-74      001 29TH ST 07410                40.9201    -74.1048                                               */
    /*  10      41-71      0012 ANTHONY PL 02840            41.4707    -71.3162                                               */
    /**************************************************************************************************************************/

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

    1                                          Altair SLC          13:07 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1
    2         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    3
    4         data sd1.address(compress=char);
    5            length intlatlon $7;
    6            infile 'd:/csv/adr_fix132e6.csv'
    7               /*---- SKIP FIRST ROW ----*/
    8               firstobs=2 delimiter=',' DSD lrecl=32767;
    9            informat MATCHCODE $64. ;
    10           informat ZIP4 $4. ;
    11           informat STATE $2. ;
    12           informat ADR $64. ;
    13           informat AVGLAT best12. ;
    14           informat AVGLON best12. ;
    15           input
    16              MATCHCODE
    17              ZIP4
    18              STATE
    19              ADR
    20              AVGLON
    21              AVGLAT
    22           ;
    23
    24           intlatlon=cats(int(avglat),int(avglon));
    25
    26           keep avglat avglon intlatlon adr;
    27
    28        run;

    NOTE: The infile 'd:\csv\adr_fix132e6.csv' is:
          Filename='d:\csv\adr_fix132e6.csv',
          Owner Name=SLC\suzie,
          File size (bytes)=9299808653,
          Create Time=16:23:47 Apr 05 2026,
          Last Accessed=12:53:29 Apr 06 2026,
          Last Modified=13:26:56 Mar 16 2025,
          Lrecl=32767, Recfm=V

    NOTE: 131789976 records were read from file 'd:\csv\adr_fix132e6.csv'
          The minimum record length was 32
          The maximum record length was 157
    NOTE: Data set "SD1.address" has 131789976 observation(s) and 4 variable(s)
    NOTE: Specifying compression for data set "SD1.address" has decreased its size from 2804044 to 1722515 pages (a 39% reduction)
    NOTE: The data step took :
          real time : 6:16.865
          cpu time  : 6:15.187


    28      !     quit;
    29
    30        libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    31        proc print data=sd1.address(obs=10);
    32        run;
    NOTE: 10 observations were read from "SD1.address"
    NOTE: Procedure print step took :
          real time : 0.438
          cpu time  : 0.015


    33
    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 6:17.390
          cpu time  : 6:15.265

    /*              _     _           _                      _     _
     ___  ___  _ __| |_  (_)_ __   __| | _____  __  __ _  __| | __| |_ __ ___  ___ ___  ___  ___
    / __|/ _ \| `__| __| | | `_ \ / _` |/ _ \ \/ / / _` |/ _` |/ _` | `__/ _ \/ __/ __|/ _ \/ __|
    \__ \ (_) | |  | |_  | | | | | (_| |  __/>  < | (_| | (_| | (_| | | |  __/\__ \__ \  __/\__ \
    |___/\___/|_|   \__| |_|_| |_|\__,_|\___/_/\_\ \__,_|\__,_|\__,_|_|  \___||___/___/\___||___/

    */

    libname sd1 wpd "d:/sd1";
    options threads=yes;
    options utilloc=("e:\spde_e" "f:\spde_f");

    proc sort data=sd1.address out=sd1.adrout(index=(intlatlon)) sortsize=120g;
    by intlatlon;
    run;

    libname sd1 wpd "d:/sd1";
    proc contents data=sd1.adrout position;
    run;quit;

    /**************************************************************************************************************************/
    /* Altair SLC                                                                                                             */
    /*                                                                                                                        */
    /* The CONTENTS Procedure                                                                                                 */
    /*                                                                                                                        */
    /* Data Set Name           ADROUT                                                                                         */
    /* Member Type             DATA                                                                                           */
    /* Engine                  WPD                                                                                            */
    /* Created                 06APR2026:13:18:08                                                                             */
    /* Last Modified           06APR2026:13:18:08                                                                             */
    /* Observations             131789976                                                                                     */
    /* Variables               4                                                                                              */
    /* Indexes                 1                                                                                              */
    /* Observation Length      87                                                                                             */
    /* Deleted Observations             0                                                                                     */
    /* Data Set Type                                                                                                          */
    /* Label                                                                                                                  */
    /* Compressed              NO                                                                                             */
    /* Sorted                  YES                                                                                            */
    /* Data Representation     Little endian, IEEE Windows                                                                    */
    /* Encoding                wlatin1 Windows-1252 Western                                                                   */
    /*                                                                                                                        */
    /*        Engine/Host Dependent Information                                                                               */
    /*                                                                                                                        */
    /* Data Set Page Size            4096                                                                                     */
    /* Number of Data Set Pages      2804044                                                                                  */
    /* First Data Page               1                                                                                        */
    /* Max Obs Per Page              47                                                                                       */
    /* Obs In First Data Page        47                                                                                       */
    /* Data Set Diagnostic Code      0013                                                                                     */
    /* Index File Page Size          4096                                                                                     */
    /* Number of Index File Pages    357508                                                                                   */
    /* Index Diagnostic Code         0003                                                                                     */
    /* File Name                     d:\sd1\ADROUT.wpd                                                                        */
    /* WPD Engine Version            3                                                                                        */
    /* Large Data Set Support        no                                                                                       */
    /* Encrypted                     no                                                                                       */
    /*                                                                                                                        */
    /*          List of Variables and Attributes in Creation Order                                                            */
    /*                                                                                                                        */
    /* Number    Variable     Type             Len             Pos    Informat                                                */
    /* ________________________________________________________________________                                               */
    /*      1    INTLATLON    Char               7              16                                                            */
    /*      2    ADR          Char              64              23    $64.                                                    */
    /*      3    AVGLAT       Num                8               0    BEST12.                                                 */
    /*      4    AVGLON       Num                8               8    BEST12.                                                 */
    /*                                                                                                                        */
    /*    Sort Information                                                                                                    */
    /*                                                                                                                        */
    /* Sorted By    INTLATLON                                                                                                 */
    /* Validated    YES                                                                                                       */
    /*                                                                                                                        */
    /*           Alphabetic List of Indexes and Attributes                                                                    */
    /*                                                                                                                        */
    /*                                               Number of                                                                */
    /*           Index        Unique    Nomiss          Unique                                                                */
    /* Number    Name         Option    Option          Values    Variables                                                   */
    /* ____________________________________________________________________                                                   */
    /*      1    INTLATLON                                 975    INTLATLON                                                   */
    /**************************************************************************************************************************/

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

    1                                          Altair SLC          13:17 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1
    2         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    3         options threads=yes;
    4         options utilloc=("e:\spde_e" "f:\spde_f");
    5
    6         proc sort data=sd1.address out=sd1.adrout(index=(intlatlon)) sortsize=120g;
    7         by intlatlon;
    8         run;
    NOTE: Automatically set SORTSIZE to 10240MiB
    NOTE: 131789976 observations were read from "SD1.address"
    NOTE: Data set "SD1.adrout" has 131789976 observation(s) and 4 variable(s)
    NOTE: Procedure sort step took :
          real time : 2:30.365
          cpu time  : 5:13.109


    9
    10        libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    11        proc contents data=sd1.adrout position;
    12        run;quit;
    NOTE: Procedure contents step took :
          real time : 0.326
          cpu time  : 0.031


    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 2:30.755
          cpu time  : 5:13.203


    /*___               _          _                     _              _     _
     ( _ )    __ _  ___| |_    ___| | ___  ___  ___  ___| |_   __ _  __| | __| |_ __ ___  ___ ___
     / _ \   / _` |/ _ \ __|  / __| |/ _ \/ __|/ _ \/ __| __| / _` |/ _` |/ _` | `__/ _ \/ __/ __|
    | (_) | | (_| |  __/ |_  | (__| | (_) \__ \  __/\__ \ |_ | (_| | (_| | (_| | | |  __/\__ \__ \
     \___/   \__, |\___|\__|  \___|_|\___/|___/\___||___/\__| \__,_|\__,_|\__,_|_|  \___||___/___/
             |___/
    */

    /*--- closest US address to ip 185.253.142.0 ---*/

    libname sd1 wpd "d:/sd1";
    proc sql;
      create
        table sd1.closest as
      select
        l.start_ip
       ,r.adr
       ,l.city
       ,l.state
       ,l.avglat as ipv4lat
       ,r.avglat as adrlat
       ,l.avglon as ipv4lon
       ,r.avglon as adrlon
      from
        sd1.getlatlon as l left join SD1.adrout as r
      on
        l.intlatlon = r.intlatlon
      group
        by r.intlatlon
      having
           ((l.avglat - r.avglat)**2 + (l.avglon - r.avglon)**2) =
        min((l.avglat - r.avglat)**2 + (l.avglon - r.avglon)**2)
    ;quit;

    libname sd1 wpd "d:/sd1";
    proc print data=sd1.closest;
    run;

    /**************************************************************************************************************************/
    /*  Altair SLC                                                                                                            */
    /* Obs      START_IP               ADR              CITY        STATE       IPV4LAT    ADRLAT     IPV4LON      ADRLON     */
    /*  1     185.253.142.0    4025 MOWRY AVE 94538    Fremont    California    37.5483    37.5485    -121.989    -121.989    */
    /**************************************************************************************************************************/

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */
    1                                          Altair SLC          13:34 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"
    NOTE: Library workx assigned as follows:
          Engine:        SAS7BDAT
          Physical Name: d:\wpswrkx

    NOTE: Library slchelp assigned as follows:
          Engine:        WPD
          Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp

    NOTE: Library worksas assigned as follows:
          Engine:        SAS7BDAT
          Physical Name: d:\worksas

    NOTE: Library workwpd assigned as follows:
          Engine:        WPD
          Physical Name: d:\workwpd


    LOG:  13:34:59
    NOTE: 1 record was written to file PRINT

    NOTE: The data step took :
          real time : 0.027
          cpu time  : 0.000


    NOTE: AUTOEXEC processing completed

    1         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    2         proc sql;
    3           create
    4             table sd1.closest as
    5           select
    6             l.start_ip
    7            ,r.adr
    8            ,l.city
    9            ,l.state
    10           ,l.avglat as ipv4lat
    11           ,r.avglat as adrlat
    12           ,l.avglon as ipv4lon
    13           ,r.avglon as adrlon
    14          from
    15            sd1.getlatlon as l left join SD1.adrout as r
    16          on
    17            l.intlatlon = r.intlatlon
    18          group
    19            by r.intlatlon
    20          having
    21               ((l.avglat - r.avglat)**2 + (l.avglon - r.avglon)**2) =
    22            min((l.avglat - r.avglat)**2 + (l.avglon - r.avglon)**2)
    23        ;quit;
    NOTE: Summary results are required to be remerged with the original data
    NOTE: Data set "SD1.closest" has 1 observation(s) and 8 variable(s)
    NOTE: Procedure sql step took :
          real time : 12.900
          cpu time  : 13.125


    24
    25        libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    26        proc print data=sd1.closest;
    27        run;
    NOTE: 1 observations were read from "SD1.closest"
    NOTE: Procedure print step took :
          real time : 0.015
          cpu time  : 0.000


    28
    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 12.990
          cpu time  : 13.171
    /*___    _____  ___   ___   __ _                       __
     / _ \  |___ / / _ \ / _ \ / _| |_    __ _  ___  ___  / _| ___ _ __   ___ ___
    | (_) |   |_ \| | | | | | | |_| __|  / _` |/ _ \/ _ \| |_ / _ \ `_ \ / __/ _ \
     \__, |  ___) | |_| | |_| |  _| |_  | (_| |  __/ (_) |  _|  __/ | | | (_|  __/
       /_/  |____/ \___/ \___/|_|  \__|  \__, |\___|\___/|_|  \___|_| |_|\___\___|
                                         |___/
    */

    libname sd1 wpd "d:/sd1";
    data sd1.fence;
       retain ltr '  ';
       set SD1.adrout(
         where= (
           37.5483   <= avglat <= 37.5485 and
          -122.000  <= avglon <= -121.989 )
         );
       ltr=put(_n_,z2.);
    run;quit;

    libname sd1 wpd "d:/sd1";
    proc print data=sd1.fence;
    run;

    options ls=64 ps=44;
    libname sd1 wpd "d:/sd1";
    proc plot data=sd1.fence;
     plot avglat*avglon='*' $ltr/box;
    run;
    options ls=255 ps=255;


    /**************************************************************************************************************************************/
    /*                             GEOFENCE                                     |                                                         */
    /*                                                                          |                                                         */
    /*         -122    -121.9975 -121.995  -121.9925 -121.99 -121.9875          |                                                         */
    /*         --+---------+---------+---------+---------+---------+--          |                                                         */
    /*  AVGLAT |                                                     |          |      RESIDENCES AROUND IPV4 185.253.142.0               */
    /*         |  APPROX 700fT Fence around IP Address 185.253.142.0 |          |                                                         */
    /* 37.5485 +                                                     +  37.5485 |  NUM          ADR                AVGLAT      AVGLON     */
    /*         |                                             * 10    |          |                                                         */
    /*         |        * 01                               * 09      |          |  01   38447 KIMBRO ST 94536     37.5485    -121.998     */
    /*         |                                                     |          |  02   38461 KIMBRO ST 94536     37.5484    -121.998     */
    /*         |                       * 06                          |          |  03   38514 KIMBRO ST 94536     37.5485    -121.997     */
    /*         |            * 03                                     |          |  04   38658 DREXEL CTS 94536    37.5485    -121.995     */
    /* 7.54845 +                     * 04              * 08          + 37.54845 |  05   38670 DREXEL CTS 94536    37.5483    -121.995     */
    /*         |                                                     |          |  06   38679 BELOIT ST 94536     37.5485    -121.994     */
    /*         |              * 14                                   |          |  07   38705 BELOIT ST 94536     37.5484    -121.994     */
    /*         |                                                     |          |  08   38870 BELL ST 94536       37.5485    -121.990     */
    /*         |      * 15                                           |          |  09   38891 FREMONT BL 94536    37.5485    -121.990     */
    /*         |                                                     |          |  10   4025 MOWRY AVE 94538      37.5485    -121.989     */
    /* 37.5484 +                * 13                                 +  37.5484 |                                                         */
    /*         |                              Closest                |          |  11   4055 MOWRY AVE 94538      37.5484    -121.989     */
    /*         |                              185.253.142.0 * 11     |          |                                                         */
    /*         |                              ------------------     |          |  12   4200 GARLAND DR 94536     37.5483    -121.993     */
    /*         |        * 02                                         |          |  13   4260 CANFIELD DR 94536    37.5484    -121.996     */
    /*         |                                                     |          |  14   4289 CANFIELD DR 94536    37.5484    -121.997     */
    /* 7.54835 +   * 16                 * 07                         + 37.54835 |  15   4327 COGNINA CTS 94536    37.5484    -121.999     */
    /*         |                                                     |          |  16   4342 EGGERS DR 94536      37.5484    -121.999     */
    /*         |                      * 05  * 12                     |          |                                                         */
    /*         |                                                     |          |                                                         */
    /*         |                                                     |          |                                                         */
    /*         |                                                     |          |                                                         */
    /* 37.5483 +                                                     +  37.5483 |                                                         */
    /*         |                                                     |          |                                                         */
    /*         --+---------+---------+---------+---------+---------+--          |                                                         */
    /*         -122    -121.9975 -121.995  -121.9925 -121.99 -121.9875          |                                                         */
    /*                                                                          |                                                         */
    /*                                 AVGLON                                   |                                                         */
    /**************************************************************************************************************************************/

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */
    1                                          Altair SLC          17:30 Monday, April  6, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"

    NOTE: AUTOEXEC processing completed

    1         options ls=64 ps=44;
    2         libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    2                          Altair SLC


    3         proc plot data=sd1.fence;
    4          libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    NOTE: Procedure plot step took :
          real time : 0.015
          cpu time  : 0.000


    5         data sd1.fence;
    6            retain ltr '  ';
    7            set SD1.adrout(
    8              where= (
    9                37.5483   <= avglat <= 37.5485 and
    10              -122.000  <= avglon <= -121.989 )
    11             );
    12           ltr=put(_n_,z2.);
    13        run;

    NOTE: 16 observations were read from "SD1.adrout"
    NOTE: Data set "SD1.fence" has 16 observation(s) and 5
          variable(s)
    NOTE: The data step took :
          real time : 16.344
          cpu time  : 16.328


    13      !     quit;
    14
    15        libname sd1 wpd "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        WPD
          Physical Name: d:\sd1

    16        proc print data=sd1.fence;
    17        run;
    NOTE: 16 observations were read from "SD1.fence"
    NOTE: Procedure print step took :
          real time : 0.031

    3                          Altair SLC

          cpu time  : 0.015


    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 16.470
          cpu time  : 16.406

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
