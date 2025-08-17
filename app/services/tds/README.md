
### Aircraft Report CSV Output Data Format

The aircraft report fields are always returned in the order indicated by the Aircraft Report Field Description Table .

Each row of aircraft report data is returned as a separate line and aircraft report fields are separated by a comma ','.

A header precedes the aircraft report data, with header names indicating the units of the fields wherever applicable.

Any fields that appear to be missing are either not reported in the aircraft report or were not parsed.

The aircraft report fields are returned in the order indicated by the Aircraft Report Field Description Table

Any fields that appear to be missing are either not reported in the aircraft report or were not parsed.

The output includes some statistics about the request, such as the number of results and the time taken to fulfill the request.

All data is ordered by descending observation time.

An error message is generated when an error in the input request prevents the retrieval of data.

If a constraint parameter is missing and a default value exists, an appropriate warning message is produced and the default request is fulfilled.

For a description of the aircraft report field names, their units and types, please refer to: Aircraft Report Field Description


### S3 selects

```sql
SELECT * FROM s3object s LIMIT 5 
SELECT * FROM s3object s where s._43 = 'PIREP' 
SELECT * FROM s3object s where s._43 = 'AIREP'
```


### CSV record lines

```csv
2022-09-01T05:55:03Z,2022-09-01T05:47:00Z,,,,,,,AT75,34.759,-96.5863,21000,,,,,,,,MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,1F0 UA /OV KADH120005 /TM 0547 /FL210 /TP AT75 /TB MOD /RM ZFW AWC-WEB,
2022-09-01T05:40:03Z,2022-09-01T05:36:00Z,,,,,,,BE20,61.1785,-150.408,2000,,,,,,,,MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,ANC UA /OV TED255013/TM 0536/FL020/TP BE20/TB MOD TURB/RM DURD ON FINAL,
2022-09-01T05:51:06Z,2022-09-01T05:21:00Z,,,,,,,A321,22.7747,-74.6372,33000,,,,,,,CHOP,LGT-MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,MBPV UA /OV PVN305145/TM 0521/FL330/TP A321/TB LGT-MOD CHOP/RM MBPV,
2022-09-01T05:20:12Z,2022-09-01T04:59:00Z,,,,,,,BE20,63.1301,-150.1371,25000,,,,,,,,,,,,,,,,,RIME,MOD,,,,,,,,,-25,,,,PIREP,TKA UA /OV TKA340050/TM 0459/FL250/TP BE20/TA M25/IC MOD RIME/RM ZAN,
2022-09-01T05:29:12Z,2022-09-01T04:57:00Z,,,,,,,A20N,33.5139,-94.0732,36000,SCT,36000,,,,,CAT,LGT,,,,,,,,,,,,,,,,,,,,,,,PIREP,TXK UA /OV TXK/TM 0457/FL360/TP A20N/SK SCT360/TB LGT CAT/RM ZFW AWC-WEB/,
2022-09-01T05:00:04Z,2022-09-01T04:50:00Z,,,,,,,A321,33.6639,-98.1241,20000,,,,,,,CAT,MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,SPS UA /OV UKW291017 /TM 0450 /FL200 /TP A321 /TB MOD CAT /RM ALL A/C FROM WEST AND SOUTH OF SPS MOD CAT FL200-135 ON ARIVAL -- ZFW AWC-WEB,
2022-09-01T04:55:47Z,2022-09-01T04:49:00Z,,,,,,,B38M,62.0,-40.0,36000,,,,,,,,LGT-MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,QX UA /OV 62N040W /TM 0449 /FL360 /TP B38M /TB LGT/MOD ,
2022-09-01T05:03:17Z,2022-09-01T04:44:00Z,,,,,,,B757,34.2284,-97.5701,24000,,,,,,,CAT,MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,1F0 UA /OV ADM267020/TM 0444/FL240/TP B757/TB MOD CAT/RM ALL A/C ON ARRIVAL FROM NORTH OVER FAWNT MOD CAT FL240-FL190 -- ZFW AWC-WEB/,
2022-09-01T04:57:17Z,2022-09-01T04:43:00Z,,,,,,,B763,63.0,-40.0,35000,,,,,,,,LGT-MOD,,,,,,,,,,,,,,,,,,,,,,,PIREP,QX UA /OV 63N040W /TM 0443 /FL350 /TP B763 /TB LGT/MOD ,
2022-09-01T05:03:17Z,2022-09-01T04:32:00Z,,,,,,,SH36,38.9243,-85.9097,7000,SKC,7000,60000,,,,,NEG,,,,,,,,,,,,,,NEGclr,7000,60000,,,15,,,,PIREP,LOZ UA /OV SER/TM 0432/FL070/TP SH36/SK SKC/TA 15/TB NEG,
2022-09-01T05:51:12Z,2022-09-01T04:30:00Z,,,,,,,B737,56.4988,-134.9229,34000,,,,,,,CHOP,LGT,,,,,,,,,,,,,,,,,,,,,,,PIREP,SIT UA /OV BKA116030/TM 0430/FL340/TP B737/TB LGT CHOP/RM ZAN,
```

### CSV Headers
Rows [0] through [4]
```csv
No errors
No warnings
58 ms
data source=aircraftreports
1957 results
receipt_time,observation_time,mid_point_assumed,no_time_stamp,flt_lvl_range,above_ground_level_indicated,no_flt_lvl,bad_location,aircraft_ref,latitude,longitude,altitude_ft_msl,sky_cover,cloud_base_ft_msl,cloud_top_ft_msl,sky_cover,cloud_base_ft_msl,cloud_top_ft_msl,turbulence_type,turbulence_intensity,turbulence_base_ft_msl,turbulence_top_ft_msl,turbulence_freq,turbulence_type,turbulence_intensity,turbulence_base_ft_msl,turbulence_top_ft_msl,turbulence_freq,icing_type,icing_intensity,icing_base_ft_msl,icing_top_ft_msl,icing_type,icing_intensity,icing_base_ft_msl,icing_top_ft_msl,visibility_statute_mi,wx_string,temp_c,wind_dir_degrees,wind_speed_kt,vert_gust_kt,report_type,raw_text
```

### Headers

```
[
    [ 0] "receipt_time",
    [ 1] "observation_time",
    [ 2] "mid_point_assumed",
    [ 3] "no_time_stamp",
    [ 4] "flt_lvl_range",
    [ 5] "above_ground_level_indicated",
    [ 6] "no_flt_lvl",
    [ 7] "bad_location",
    [ 8] "aircraft_ref",
    [ 9] "latitude",
    [10] "longitude",
    [11] "altitude_ft_msl",
    [12] "sky_cover",
    [13] "cloud_base_ft_msl",
    [14] "cloud_top_ft_msl",
    [15] "sky_cover",
    [16] "cloud_base_ft_msl",
    [17] "cloud_top_ft_msl",
    [18] "turbulence_type",
    [19] "turbulence_intensity",
    [20] "turbulence_base_ft_msl",
    [21] "turbulence_top_ft_msl",
    [22] "turbulence_freq",
    [23] "turbulence_type",
    [24] "turbulence_intensity",
    [25] "turbulence_base_ft_msl",
    [26] "turbulence_top_ft_msl",
    [27] "turbulence_freq",
    [28] "icing_type",
    [29] "icing_intensity",
    [30] "icing_base_ft_msl",
    [31] "icing_top_ft_msl",
    [32] "icing_type",
    [33] "icing_intensity",
    [34] "icing_base_ft_msl",
    [35] "icing_top_ft_msl",
    [36] "visibility_statute_mi",
    [37] "wx_string",
    [38] "temp_c",
    [39] "wind_dir_degrees",
    [40] "wind_speed_kt",
    [41] "vert_gust_kt",
    [42] "report_type",
    [43] "raw_text"
]
```



```ruby
    TEI_DICTIONARY =
      {
        '-': 'Light', # intensity, except when associated with LLWS',
        '+': 'Heavy', # intensity',
        '/': 'Solidus. Separator between cloud layers, layers of turbulence, or layers of icing',
        ABV: 'Above',
        AC: 'Altocumulus Cloud(s)',
        ACC: 'Altocumulus Castellanus Cloud(s)',
        'ACFT MSHP': 'Aircraft Mishap',
        ACSL: 'Standing Lenticular Altocumulus Castellanus Cloud(s)',
        APCH: 'Approach',
        APRNT: 'Apparent',
        APRX: 'Approximate',
        ATCT: 'Air Traffic Control Tower',
        B: 'Becoming',
        BC: 'Patches (descriptor used with FG)',
        BKN: 'Broken (used to describe cloud cover or weather phenomena)',
        BL: 'Blowing (descriptor used with DU, SA, or SN)',
        BLO: 'Below',
        BR: 'Mist',
        CA: 'Cloud to air (lightning)',
        CAS: 'Committee for Aviation Services',
        CAT: 'Clear Air Turbulence',
        CB: 'Cumulonimbus Cloud(s)',
        CBMAM: 'Cumulonimbus Mammatus Cloud(s)',
        CC: 'Cirrocumulus Cloud(s)',
        CCSL: 'Standing Lenticular Cirrocumulus Cloud(s)',
        CG: 'Cloud to ground (lightning)',
        CHOP: 'Chop',
        CIG: 'Ceiling',
        CLR: 'Clear', # Clear (Icing) - a type of glossy, clear, or translucent ice, or  (Sky condition) - the absence of clouds reported by an automated weather reporting station
        CONS: 'Continuous',
        CONTRAILS: 'Condensation trails', #--ice vapor trails created by high-flying aircraft',
        CS: 'Cirrus Cloud(s)',
        CTC: 'Contact',
        DR: 'Drifting', # (descriptor used with DU, SA, or SN)
        DS: 'Duststorm',
        DSNT: 'Distant',
        DU: 'Widespread Dust',
        DURGC: 'During Climb',
        DURGD: 'During Descent',
        DZ: 'Drizzle',
        E: 'East',
        EMBD: 'Embedded',
        ENE: 'East-northeast',
        ENRT: 'Enroute',
        EST: 'Estimated',
        EXTRM: 'Extreme',
        FAA: 'Federal Aviation Administration',
        FC: 'Funnel Cloud(s)',
        '+FC': 'Tornado',
        FEW: 'Few', # (used to describe cloud cover or weather phenomena)
        FG: 'Fog',
        FRQ: 'Frequent',
        FT: 'Feet',
        FU: 'Smoke',
        FV: 'Flight Visibility',
        FZ: 'Freezing',
        G: 'Gusting',
        GND: 'Ground',
        GR: 'Hail',
        GS: 'Snow pellets',
        HLSTO: 'Hailstone',
        HVY: 'Heavy',
        HZ: 'Haze',
        IC: 'Ice Crystals',
        ICAO: 'International Civil Aviation Organization',
        IMC: 'Instrument Meteorological Conditions',
        INCRG: 'Increasing',
        INTMT: 'Intermittent',
        ISOL: 'Isolated',
        KT: 'Knots',
        LGT: 'Light',
        LLWS: 'Low Level Wind Shear',
        LN: 'Line',
        LST: 'Local Standard Time',
        LTG: 'Lightning',
        LTGCA: 'Cloud to air',
        LTGCC: 'Cloud to cloud',
        LTGCG: 'Cloud to ground',
        LTGIC: 'Intracloud',
        LYR: 'Layer',
        LWR: 'Lower',
        M: 'Sub-zero temperature',
        METAR: 'Meteorological Aerodrome Report',
        MI: 'Shallow',
        MOD: 'Moderate',
        MOV: 'Moving',
        MSL: 'Mean Sea Level',
        MT: 'Mountains',
        MX: 'Mixed',
        N: 'North',
        NAVAID: 'Navigation Aid',
        NE: 'Northeast',
        NMRS: 'Numerous',
        NW: 'Northwest',
        OCNL: 'Occasional',
        OFCM: 'Office of the Federal Coordinator for Meteorology',
        OVC: 'Overcast (used to describe cloud cover or weather phenomena)',
        OVR: 'Over',
        PCPN: 'Precipitation',
        PIREP: 'Pilot Report',
        'PK WND': 'Peak Wind',
        PL: 'Ice Pellets',
        PO: 'Dust/sand whirls',
        PR: 'Partial',
        PY: 'Spray',
        RA: 'Rain',
        RCA: 'Reach Cruising Altitude',
        RIME: 'Rime', # Type of Icing characterized by a rough, milky, opaque appearance
        RY: 'Runway',
        S: 'South',
        SA: 'Sand',
        SCSL: 'Standing Lenticular Cirrus Cloud(s)',
        SCT: 'Scattered', # (used to describe cloud cover or weather phenomena)',
        SE: 'Southeast',
        SEV: 'Severe',
        SFC: 'Surface',
        SG: 'Snow Grains',
        SH: 'Showers',
        SKC: 'Sky Clear',
        SLD: 'Solid',
        SM: 'Statute Mile',
        SN: 'Snow',
        SP: 'Snow Pellets',
        SPECI: 'Aviation Wewather Special Report',
        SQ: 'Squalls',
        SS: 'Sandstorm',
        STN: 'Station',
        SW: 'Southwest',
        TACAN: 'Tactical Air Navigation',
        TCU: 'Towering Cumulus Cloud(s)',
        TEI: 'Text Element Identifier',
        TOC: 'Top of Climb',
        TOP: 'Top of Clouds',
        TS: 'Thunderstorm',
        UA: 'Routine Report', # Text Element Indicator for a Routine Pilot Report (PIREP)
        UNKWN: 'Unknown',
        UP: 'Unknown Precipitation',
        UTC: 'Coordinated Universal Time',
        UUA: 'Urgent Report', # Text Element Indicator for an Urgent Pilot Report (PIREP)
        VA: 'Volcanic Ash',
        VC: 'In Vicinity',
        VHF: 'Very High Frequency',
        VIS: 'Visibility',
        VMC: 'Visual Meteorological Conditions',
        VOR: 'VHF Omnidirectional Range',
        VORTAC: 'VHF Omnidirectional Range/Tactical Air Navigation',
        VRB: 'Variable',
        W: 'West',
        WMO: 'World Meteorological Organization',
        WND: 'Wind',
        Z: 'Zulu Time'
      }.with_indifferent_access
```

Metars
===

Headers and Metadata

```
{
  "_1": "No errors"
}
{
  "_1": "No warnings"
}
{
  "_1": "379 ms"
}
{
  "_1": "data source=metars"
}
{
  "_1": "4757 results"
}
{
  "_1": "raw_text",
  "_2": "station_id",
  "_3": "observation_time",
  "_4": "latitude",
  "_5": "longitude",
  "_6": "temp_c",
  "_7": "dewpoint_c",
  "_8": "wind_dir_degrees",
  "_9": "wind_speed_kt",
  "_10": "wind_gust_kt",
  "_11": "visibility_statute_mi",
  "_12": "altim_in_hg",
  "_13": "sea_level_pressure_mb",
  "_14": "corrected",
  "_15": "auto",
  "_16": "auto_station",
  "_17": "maintenance_indicator_on",
  "_18": "no_signal",
  "_19": "lightning_sensor_off",
  "_20": "freezing_rain_sensor_off",
  "_21": "present_weather_sensor_off",
  "_22": "wx_string",
  "_23": "sky_cover",
  "_24": "cloud_base_ft_agl",
  "_25": "sky_cover",
  "_26": "cloud_base_ft_agl",
  "_27": "sky_cover",
  "_28": "cloud_base_ft_agl",
  "_29": "sky_cover",
  "_30": "cloud_base_ft_agl",
  "_31": "flight_category",
  "_32": "three_hr_pressure_tendency_mb",
  "_33": "maxT_c",
  "_34": "minT_c",
  "_35": "maxT24hr_c",
  "_36": "minT24hr_c",
  "_37": "precip_in",
  "_38": "pcp3hr_in",
  "_39": "pcp6hr_in",
  "_40": "pcp24hr_in",
  "_41": "snow_in",
  "_42": "vert_vis_ft",
  "_43": "metar_type",
  "_44": "elevation_m"
}
```


`SELECT * FROM s3object s where s._43 = 'METAR' or s._43 = 'SPECI'`



```
CYNA 120423Z AUTO 27003KT 3SM BR CLR 12/11 A2985 RMK SLP111,CYNA,2022-09-12T04:23:00Z,50.18,-61.78,12.0,11.0,270,3,,3.0,29.84941,1011.1,,TRUE,,,,,,,BR,CLR,,,,,,,,MVFR,,,,,,,,,,,,SPECI,9.0
KPWC 120422Z AUTO 00000KT 1SM BR 07/06 A3011 RMK AO2,KPWC,2022-09-12T04:22:00Z,46.72,-94.38,7.0,6.0,0,0,,1.0,30.109253,,,TRUE,TRUE,,,,,,BR,,,,,,,,,,,,,,,,,,,,,METAR,394.0
KNAK 120422Z AUTO 00000KT 10SM BKN010 23/22 A2994 RMK AO2 T02330222,KNAK,2022-09-12T04:22:00Z,38.98,-76.48,23.3,22.2,0,0,,10.0,29.940945,,,TRUE,TRUE,,,,,,,BKN,1000,,,,,,,MVFR,,,,,,,,,,,,SPECI,2.0
CYCY 120422Z AUTO 34011KT 2 1/2SM BR OVC003 02/02 A2953 RMK SLP003,CYCY,2022-09-12T04:22:00Z,70.48,-68.52,2.0,2.0,340,11,,2.5,29.530512,1000.3,,TRUE,,,,,,,BR,OVC,300,,,,,,,LIFR,,,,,,,,,,,,SPECI,73.0
KTOL 120421Z 22007KT 10SM SCT008 BKN011 BKN023 21/19 A2984 RMK AO2 T02060189,KTOL,2022-09-12T04:21:00Z,41.58,-83.8,20.6,18.9,220,7,,10.0,29.840551,,,,TRUE,,,,,,,SCT,800,BKN,1100,BKN,2300,,,MVFR,,,,,,,,,,,,SPECI,206.0
KOXC 120421Z AUTO 09003KT 2 1/2SM BR FEW007 OVC011 17/17 A3000 RMK AO2 RAB01E16 P0000,KOXC,2022-09-12T04:21:00Z,41.47,-73.13,17.0,17.0,90,3,,2.5,30.0,,,TRUE,TRUE,,,,,,BR,FEW,700,OVC,1100,,,,,IFR,,,,,,0.005,,,,,,SPECI,211.0
KMBL 120421Z AUTO 07010KT 10SM -RA SCT008 BKN018 OVC023 17/17 A2976 RMK AO2 PNO $,KMBL,2022-09-12T04:21:00Z,44.27,-86.25,17.0,17.0,70,10,,10.0,29.760826,,,TRUE,TRUE,TRUE,,,,,-RA,SCT,800,BKN,1800,OVC,2300,,,MVFR,,,,,,,,,,,,SPECI,187.0
KISP 120421Z AUTO 09003KT 3SM -RA BR OVC004 20/20 A2997 RMK AO2 CIG 002V008 P0002 T02000200,KISP,2022-09-12T04:21:00Z,40.8,-73.1,20.0,20.0,90,3,,3.0,29.970472,,,TRUE,TRUE,,,,,,-RA BR,OVC,400,,,,,,,LIFR,,,,,,0.02,,,,,,SPECI,25.0
KHGR 120421Z AUTO 01003KT 6SM BR OVC015 21/20 A2995 RMK AO2 T02060200 $,KHGR,2022-09-12T04:21:00Z,39.7,-77.73,20.6,20.0,10,3,,6.0,29.949802,,,TRUE,TRUE,TRUE,,,,,BR,OVC,1500,,,,,,,MVFR,,,,,,,,,,,,SPECI,206.0
KFFZ 120421Z AUTO 15020G50KT 2 1/2SM -TSRA BKN007 BKN043 OVC060 24/17 A2999 RMK AO2 PK WND 13050/0414 WSHFT 0401 LTG DSNT ALQDS RAB12 TSB11 P0000 T02390172,KFFZ,2022-09-12T04:21:00Z,33.47,-111.72,23.9,17.2,150,20,50,2.5,29.991142,,,TRUE,TRUE,,,,,,-TSRA,BKN,700,BKN,4300,OVC,6000,,,IFR,,,,,,0.005,,,,,,SPECI,420.0
KELZ 120421Z AUTO 15003KT 1/2SM FG VV003 18/17 A2998 RMK AO2 T01830167 TSNO,KELZ,2022-09-12T04:21:00Z,42.1,-77.98,18.3,16.7,150,3,,0.5,29.97933,,,TRUE,TRUE,,,TRUE,,,FG,OVX,0,,,,,,,LIFR,,,,,,,,,,,300,SPECI,639.0
KELM 120421Z AUTO 13003KT 10SM OVC015 19/18 A2995 RMK AO2 T01890178,KELM,2022-09-12T04:21:00Z,42.15,-76.9,18.9,17.8,130,3,,10.0,29.949802,,,TRUE,TRUE,,,,,,,OVC,1500,,,,,,,MVFR,,,,,,,,,,,,SPECI,287.0
CYMT 120421Z AUTO 32005KT 9SM BKN008 OVC012 16/16 A2999 RMK SLP161 DENSITY ALT 1700FT,CYMT,2022-09-12T04:21:00Z,49.77,-74.52,16.0,16.0,320,5,,9.0,29.991142,1016.1,,TRUE,,,,,,,,BKN,800,OVC,1200,,,,,IFR,,,,,,,,,,,,SPECI,388.0
RCMQ 120420Z 35016G26KT 4000 -RA BR SCT004 BKN016 BKN040 25/25 Q1004 RERA BECMG 2400 -RA BR BKN004 RMK A2967 APCH CLD SCT004,RCMQ,2022-09-12T04:20:00Z,24.27,120.62,25.0,25.0,350,16,26,2.49,29.64567,,,,,,,,,,-RA BR,SCT,400,BKN,1600,BKN,4000,,,IFR,,,,,,,,,,,,SPECI,202.0
PKWA 120420Z AUTO 13004KT 4SM RA BKN025 BKN038 OVC055 30/24 A2981 RMK AO2 P0003 T02970237,PKWA,2022-09-12T04:20:00Z,8.72,167.72,29.7,23.7,130,4,,4.0,29.811024,,,TRUE,TRUE,,,,,,RA,BKN,2500,BKN,3800,OVC,5500,,,MVFR,,,,,,0.03,,,,,,SPECI,6.0
PASM 120420Z AUTO 15007G14KT 10SM SCT010 BKN039 OVC120 10/09 A2949 RMK AO2 RAE05 P0000,PASM,2022-09-12T04:20:00Z,62.07,-163.3,10.0,9.0,150,7,14,10.0,29.489174,,,TRUE,TRUE,,,,,,,SCT,1000,BKN,3900,OVC,12000,,,VFR,,,,,,0.005,,,,,,SPECI,108.0
PAQH 120420Z AUTO 15015KT 10SM BKN028 OVC035 11/08 A2952 RMK AO2,PAQH,2022-09-12T04:20:00Z,59.75,-161.85,11.0,8.0,150,15,,10.0,29.518702,,,TRUE,TRUE,,,,,,,BKN,2800,OVC,3500,,,,,MVFR,,,,,,,,,,,,SPECI,8.0
LSZS 120420Z AUTO VRB01KT 9999 NCD M02/M03 Q1022,LSZS,2022-09-12T04:20:00Z,46.53,9.88,-2.0,-3.0,0,1,,6.21,30.177166,,,TRUE,,,,,,,,CLR,,,,,,,,VFR,,,,,,,,,,,,METAR,1708.0
LSZR 120420Z VRB02KT CAVOK 09/08 Q1017 RMK A,LSZR,2022-09-12T04:20:00Z,47.48,9.57,9.0,8.0,0,2,,6.21,30.029528,,,,,,,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,396.0
LSZH 120420Z VRB01KT 9999 BCFG FEW002 SCT008 09/09 Q1018 TEMPO 2500 BR,LSZH,2022-09-12T04:20:00Z,47.48,8.53,9.0,9.0,0,1,,6.21,30.059055,,,,,,,,,,BCFG,FEW,200,SCT,800,,,,,VFR,,,,,,,,,,,,METAR,424.0
LSZG 120420Z AUTO 09002KT 0300 FG VV001 09/09 Q1017,LSZG,2022-09-12T04:20:00Z,47.17,7.42,9.0,9.0,90,2,,0.19,30.029528,,,TRUE,,,,,,,FG,OVX,0,,,,,,,LIFR,,,,,,,,,,,100,METAR,428.0
LSZC 120420Z AUTO VRB03KT 9999 NCD 11/09 Q1017,LSZC,2022-09-12T04:20:00Z,46.97,8.38,11.0,9.0,0,3,,6.21,30.029528,,,TRUE,,,,,,,,CLR,,,,,,,,VFR,,,,,,,,,,,,METAR,445.0
LSZB 120420Z AUTO 15002KT 9999 NCD 08/07 Q1017,LSZB,2022-09-12T04:20:00Z,46.92,7.5,8.0,7.0,150,2,,6.21,30.029528,,,TRUE,,,,,,,,CLR,,,,,,,,VFR,,,,,,,,,,,,METAR,510.0
LSZA 120420Z AUTO VRB01KT 9999 NCD 12/11 Q1017,LSZA,2022-09-12T04:20:00Z,46.0,8.92,12.0,11.0,0,1,,6.21,30.029528,,,TRUE,,,,,,,,CLR,,,,,,,,VFR,,,,,,,,,,,,METAR,276.0
LSMP 120420Z AUTO VRB02KT 9999NDV NCD 10/09 Q1017 RMK,LSMP,2022-09-12T04:20:00Z,46.83,6.92,10.0,9.0,0,2,,,30.029528,,,TRUE,,,,,,,,CLR,,,,,,,,,,,,,,,,,,,,METAR,490.0
LSME 120420Z AUTO 00000KT 9999NDV NCD 09/09 Q1017 RMK,LSME,2022-09-12T04:20:00Z,47.1,8.3,9.0,9.0,0,0,,,30.029528,,,TRUE,,,,,,,,CLR,,,,,,,,,,,,,,,,,,,,METAR,427.0
LSMD 120420Z AUTO 00000KT 9999NDV NCD 09/08 Q1018 RMK,LSMD,2022-09-12T04:20:00Z,47.4,8.65,9.0,8.0,0,0,,,30.059055,,,TRUE,,,,,,,,CLR,,,,,,,,,,,,,,,,,,,,METAR,436.0
LSMA 120420Z AUTO VRB02KT 9999NDV NCD 09/08 Q1017 RMK,LSMA,2022-09-12T04:20:00Z,46.95,8.28,9.0,8.0,0,2,,,30.029528,,,TRUE,,,,,,,,CLR,,,,,,,,,,,,,,,,,,,,METAR,441.0
LSGS 120420Z AUTO 06003KT CAVOK 13/09 Q1018,LSGS,2022-09-12T04:20:00Z,46.22,7.32,13.0,9.0,60,3,,6.21,30.059055,,,TRUE,,,,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,482.0
LSGG 120420Z 32001KT CAVOK 11/09 Q1017 NOSIG,LSGG,2022-09-12T04:20:00Z,46.25,6.12,11.0,9.0,320,1,,6.21,30.029528,,,,,,TRUE,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,411.0
LSGC 120420Z AUTO 00000KT 9999 NCD 07/05 Q1018,LSGC,2022-09-12T04:20:00Z,47.08,6.8,7.0,5.0,0,0,,6.21,30.059055,,,TRUE,,,,,,,,CLR,,,,,,,,VFR,,,,,,,,,,,,METAR,1018.0
LLBG 120420Z 12005KT CAVOK 23/19 Q1007 NOSIG,LLBG,2022-09-12T04:20:00Z,32.0,34.88,23.0,19.0,120,5,,6.21,29.734253,,,,,,TRUE,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,35.0
LGRP 120420Z 26012KT CAVOK 25/22 Q1004 NOSIG,LGRP,2022-09-12T04:20:00Z,36.4,28.08,25.0,22.0,260,12,,6.21,29.64567,,,,,,TRUE,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,3.0
LGKR 120420Z 26007KT 9999 FEW018 23/19 Q1010 NOSIG,LGKR,2022-09-12T04:20:00Z,39.62,19.92,23.0,19.0,260,7,,6.21,29.822834,,,,,,TRUE,,,,,FEW,1800,,,,,,,VFR,,,,,,,,,,,,METAR,2.0
LGIR 120420Z 26006KT CAVOK 25/15 Q1007 NOSIG,LGIR,2022-09-12T04:20:00Z,35.33,25.17,25.0,15.0,260,6,,6.21,29.734253,,,,,,TRUE,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,37.0
LGAV 120420Z 02006KT 9999 FEW025 24/16 Q1008 NOSIG,LGAV,2022-09-12T04:20:00Z,37.93,23.95,24.0,16.0,20,6,,6.21,29.763779,,,,,,TRUE,,,,,FEW,2500,,,,,,,VFR,,,,,,,,,,,,METAR,83.0
LATI 120420Z VRB02KT CAVOK 15/15 Q1012 NOSIG,LATI,2022-09-12T04:20:00Z,41.42,19.72,15.0,15.0,0,2,,6.21,29.88189,,,,,,TRUE,,,,,CAVOK,,,,,,,,VFR,,,,,,,,,,,,METAR,32.0
```

```
irb(main):032:0> ap t[:response][7][:data][1][:TAF]
{
           :raw_text => "KBOI 151026Z 1510/1606 12010G20KT P6SM VCTS BKN070CB TEMPO 1510/1513 30010G20KT -SHRA OVC070 FM151300 13007KT P6SM BKN100 FM160100 20006KT P6SM VCTS BKN100CB",
         :station_id => "KBOI", 
         :issue_time => "2022-09-15T10:26:00Z",
      :bulletin_time => "2022-09-15T10:26:00Z",
    :valid_time_from => "2022-09-15T10:00:00Z",
      :valid_time_to => "2022-09-16T06:00:00Z",
            :remarks => "AMD",  
           :latitude => "43.57",
          :longitude => "-116.23",
        :elevation_m => "860.0",
           :forecast => [       
        [0] {                   
                   :fcst_time_from => "2022-09-15T10:00:00Z",
                     :fcst_time_to => "2022-09-15T13:00:00Z",
                 :wind_dir_degrees => "120",
                    :wind_speed_kt => "10",
                     :wind_gust_kt => "20",
            :visibility_statute_mi => "6.21",
                        :wx_string => "VCTS",
                    :sky_condition => [
                [0] {
                            :sky_cover => "BKN",
                    :cloud_base_ft_agl => "7000",
                           :cloud_type => "CB"
                }
            ]
        },
        [1] {
              :fcst_time_from => "2022-09-15T10:00:00Z",
                :fcst_time_to => "2022-09-15T13:00:00Z",
            :change_indicator => "TEMPO",
            :wind_dir_degrees => "300",
               :wind_speed_kt => "10",
                :wind_gust_kt => "20",
                   :wx_string => "-SHRA",
               :sky_condition => [
                [0] {
                            :sky_cover => "OVC",
                    :cloud_base_ft_agl => "7000"
                }
            ]
        },
        [2] {
                   :fcst_time_from => "2022-09-15T13:00:00Z",
                     :fcst_time_to => "2022-09-16T01:00:00Z",
                 :change_indicator => "FM",
                 :wind_dir_degrees => "130",
                    :wind_speed_kt => "7",
            :visibility_statute_mi => "6.21",
                    :sky_condition => [
                [0] {
                            :sky_cover => "BKN",
                    :cloud_base_ft_agl => "10000"
                }
            ]
        },
        [3] {
                   :fcst_time_from => "2022-09-16T01:00:00Z",
                     :fcst_time_to => "2022-09-16T06:00:00Z",
                 :change_indicator => "FM",
                 :wind_dir_degrees => "200",
                    :wind_speed_kt => "6",
            :visibility_statute_mi => "6.21",
                        :wx_string => "VCTS",
                    :sky_condition => [
                [0] {
                            :sky_cover => "BKN",
                    :cloud_base_ft_agl => "10000",
                           :cloud_type => "CB"
                }
            ]
        }
    ]
}

```