
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