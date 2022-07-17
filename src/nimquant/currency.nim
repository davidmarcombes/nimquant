import tables
type
  CurrencyDetails* = tuple
    code: string
    number: int
    name: string

  Currency* = enum
    # Official
    AED
    AFN
    ALL
    AMD
    ANG
    AOA
    ARS
    AUD
    AWG
    AZN
    BAM
    BBD
    BDT
    BGN
    BHD
    BIF
    BMD
    BND
    BOB
    BOV
    BRL
    BSD
    BTN
    BWP
    BYN   
    BZD
    CAD
    CDF
    CHE   
    CHF
    CHW
    CLF
    CLP
    CNY
    COP
    COU
    CRC
    CUC
    CUP
    CVE
    CZK
    DJF
    DKK
    DOP
    DZD
    EGP
    ERN
    ETB
    EUR
    FJD
    FKP
    GBP
    GEL
    GHS
    GIP
    GMD
    GNF
    GTQ
    GYD    
    HKD
    HNL
    HRK
    HTG
    HUF
    IDR
    ILS
    INR
    IQD
    IRR
    ISK
    JMD
    JOD
    JPY
    KES
    KGS
    KHR
    KMF
    KPW
    KRW
    KWD
    KYD
    KZT
    LAK
    LBP
    LKR
    LRD
    LSL
    LYD
    MAD
    MDL
    MGA
    MKD
    MMK
    MNT
    MOP
    MRU
    MUR
    MVR
    MWK
    MXN
    MXV
    MYR
    MZN
    NAD
    NGN
    NIO
    NOK
    NPR
    NZD
    OMR
    PAB
    PEN
    PGK
    PHP
    PKR
    PLN
    PYG
    QAR
    RON
    RSD
    RUB
    RWF
    SAR
    SBD
    SCR
    SDG
    SEK
    SGD
    SHP
    SLL
    SOS
    SRD
    SSP
    STN
    SVC
    SYP
    SZL
    THB
    TJS
    TMT
    TND
    TOP
    TRY
    TTD
    TWD
    TZS
    UAH
    UGX
    USD
    USN
    UYI
    UYU
    UYW
    UZS
    VES
    VND
    VUV
    WST
    XAF
    XAG
    XAU
    XBA
    XBB
    XBC
    XBD
    XCD
    XDR
    XOF
    XPD
    XPF
    XPT
    XSU
    XTS
    XUA
    XXX
    YER
    ZAR
    ZMW
    ZWL
    # Unofficial
    CNH
    CNT
    GGP
    IMP
    JEP
    KID
    NIS
    NTD
    PRB
    SLS
    RMB
    TVD
    # Crypto
    DASH
    ETH
    VTC
    XBT
    XLM
    XMR
    XRP
    ZEC
    # No ccy
    NONE

let currencyTable* = {
  AED: ( "AED", 784, "United Arab Emirates dirham"),
  AFN: ( "AFN", 971, "Afghan afghani" ),
  ALL: ( "ALL",   8, "Albanian lek" ),
  AMD: ( "AMD",  51, "Armenian dram" ),
  ANG: ( "ANG", 532, "Netherlands Antillean guilder" ),
  AOA: ( "AOA", 973, "Angolan kwanza" ),
  ARS: ( "ARS",  32, "Argentine peso" ),
  AUD: ( "AUD",  36, "Australian dollar" ),
  AWG: ( "AWG", 533, "Aruban florin" ),
  AZN: ( "AZN", 944, "Azerbaijani manat" ),
  BAM: ( "BAM", 977, "Bosnia and Herzegovina convertible mark" ),
  BBD: ( "BBD",  52, "Barbados dollar" ),
  BDT: ( "BDT",  50, "Bangladeshi taka" ),
  BGN: ( "BGN", 975, "Bulgarian lev" ),
  BHD: ( "BHD",  48, "Bahraini dinar" ),
  BIF: ( "BIF", 108, "Burundian franc" ),
  BMD: ( "BMD",  60, "Bermudian dollar" ),
  BND: ( "BND",  96, "Brunei dollar" ),
  BOB: ( "BOB",  68, "Boliviano" ),
  BOV: ( "BOV", 984, "Bolivian Mvdol" ),
  BRL: ( "BRL", 986, "Brazilian real" ),
  BSD: ( "BSD",  44, "Bahamian dollar" ),
  BTN: ( "BTN",  64, "Bhutanese ngultrum" ),
  BWP: ( "BWP",  72, "Botswana pula" ),
  BYN: ( "BYN", 933, "Belarusian ruble" ),
  BZD: ( "BZD",  84, "Belize dollar" ),
  CAD: ( "CAD", 124, "Canadian dollar" ),
  CDF: ( "CDF", 976, "Congolese franc" ),
  CHE: ( "CHE", 947, "WIR Euro" ),
  CHF: ( "CHF", 756, "Swiss franc" ),
  CHW: ( "CHW", 948, "WIR Franc" ),
  CLF: ( "CLF", 990, "Unidad de Fomento" ),
  CLP: ( "CLP", 152, "Chilean peso" ),
  CNY: ( "CNY", 156, "Renminbi" ),
  COP: ( "COP", 170, "Colombian peso" ),
  COU: ( "COU", 970, "Unidad de Valor Real" ),
  CRC: ( "CRC", 188, "Costa Rican colon" ),
  CUC: ( "CUC", 931, "Cuban convertible peso" ),
  CUP: ( "CUP", 192, "Cuban peso" ),
  CVE: ( "CVE", 132, "Cape Verde escudo" ),
  CZK: ( "CZK", 203, "Czech koruna" ),
  DJF: ( "DJF", 262, "Djiboutian franc" ),
  DKK: ( "DKK", 208, "Danish krone" ),
  DOP: ( "DOP", 214, "Dominican peso" ),
  DZD: ( "DZD",  12, "Algerian dinar" ),
  EGP: ( "EGP", 818, "Egyptian pound" ),
  ERN: ( "ERN", 232, "Eritrean nakfa" ),
  ETB: ( "ETB", 230, "Ethiopian birr" ),
  EUR: ( "EUR", 978, "Euro" ),
  FJD: ( "FJD", 242, "Fiji dollar" ),
  FKP: ( "FKP", 238, "Falkland Islands pound" ),
  GBP: ( "GBP", 826, "Pound sterling" ),
  GEL: ( "GEL", 981, "Georgian lari" ),
  GHS: ( "GHS", 936, "Ghanaian cedi" ),
  GIP: ( "GIP", 292, "Gibraltar pound" ),
  GMD: ( "GMD", 270, "Gambian dalasi" ),
  GNF: ( "GNF", 324, "Guinean franc" ),
  GTQ: ( "GTQ", 320, "Guatemalan quetzal" ),
  GYD: ( "GYD", 328, "Guyanese dollar" ),
  HKD: ( "HKD", 344, "Hong Kong dollar" ),
  HNL: ( "HNL", 340, "Honduran lempira" ),
  HRK: ( "HRK", 191, "Croatian kuna" ),
  HTG: ( "HTG", 332, "Haitian gourde" ),
  HUF: ( "HUF", 348, "Hungarian forint" ),
  IDR: ( "IDR", 360, "Indonesian rupiah" ),
  ILS: ( "ILS", 376, "Israeli new shekel" ),
  INR: ( "INR", 356, "Indian rupee" ),
  IQD: ( "IQD", 368, "Iraqi dinar" ),
  IRR: ( "IRR", 364, "Iranian rial" ),
  ISK: ( "ISK", 352, "Icelandic krona" ),
  JMD: ( "JMD", 388, "Jamaican dollar" ),
  JOD: ( "JOD", 400, "Jordanian dinar" ),
  JPY: ( "JPY", 392, "Japanese yen" ),
  KES: ( "KES", 404, "Kenyan shilling" ),
  KGS: ( "KGS", 417, "Kyrgyzstani som" ),
  KHR: ( "KHR", 116, "Cambodian riel" ),
  KMF: ( "KMF", 174, "Comoro franc" ),
  KPW: ( "KPW", 408, "North Korean won" ),
  KRW: ( "KRW", 410, "South Korean won" ),
  KWD: ( "KWD", 414, "Kuwaiti dinar" ),
  KYD: ( "KYD", 136, "Cayman Islands dollar" ),
  KZT: ( "KZT", 398, "Kazakhstani tenge" ),
  LAK: ( "LAK", 418, "Lao kip" ),
  LBP: ( "LBP", 422, "Lebanese pound" ),
  LKR: ( "LKR", 144, "Sri Lankan rupee" ),
  LRD: ( "LRD", 430, "Liberian dollar" ),
  LSL: ( "LSL", 426, "Lesotho loti" ),
  LYD: ( "LYD", 434, "Libyan dinar" ),
  MAD: ( "MAD", 504, "Moroccan dirham" ),
  MDL: ( "MDL", 498, "Moldovan leu" ),
  MGA: ( "MGA", 969, "Malagasy ariary" ),
  MKD: ( "MKD", 807, "Macedonian denar" ),
  MMK: ( "MMK", 104, "Myanmar kyat" ),
  MNT: ( "MNT", 496, "Mongolian tögrög" ),
  MOP: ( "MOP", 446, "Macanese pataca" ),
  MRU: ( "MRU", 929, "Mauritanian ouguiya" ),
  MUR: ( "MUR", 480, "Mauritian rupee" ),
  MVR: ( "MVR", 462, "Maldivian rufiyaa" ),
  MWK: ( "MWK", 454, "Malawian kwacha" ),
  MXN: ( "MXN", 484, "Mexican peso" ),
  MXV: ( "MXV", 979, "Mexican Unidad de Inversion" ),
  MYR: ( "MYR", 458, "Malaysian ringgit" ),
  MZN: ( "MZN", 943, "Mozambican metical" ),
  NAD: ( "NAD", 516, "Namibian dollar" ),
  NGN: ( "NGN", 566, "Nigerian naira" ),
  NIO: ( "NIO", 558, "Nicaraguan cordoba" ),
  NOK: ( "NOK", 578, "Norwegian krone" ),
  NPR: ( "NPR", 524, "Nepalese rupee" ),
  NZD: ( "NZD", 554, "New Zealand dollar" ),
  OMR: ( "OMR", 512, "Omani rial" ),
  PAB: ( "PAB", 590, "Panamanian balboa" ),
  PEN: ( "PEN", 604, "Peruvian sol" ),
  PGK: ( "PGK", 598, "Papua New Guinean kina" ),
  PHP: ( "PHP", 608, "Philippine peso" ),
  PKR: ( "PKR", 586, "Pakistani rupee" ),
  PLN: ( "PLN", 985, "Polish zloty" ),
  PYG: ( "PYG", 600, "Paraguayan guarani" ),
  QAR: ( "QAR", 634, "Qatari riyal" ),
  RON: ( "RON", 946, "Romanian leu" ),
  RSD: ( "RSD", 941, "Serbian dinar" ),
  RUB: ( "RUB", 643, "Russian ruble" ),
  RWF: ( "RWF", 646, "Rwandan franc" ),
  SAR: ( "SAR", 682, "Saudi riyal" ),
  SBD: ( "SBD",  90, "Solomon Islands dollar" ),
  SCR: ( "SCR", 690, "Seychelles rupee" ),
  SDG: ( "SDG", 938, "Sudanese pound" ),
  SEK: ( "SEK", 752, "Swedish krona" ),
  SGD: ( "SGD", 702, "Singapore dollar" ),
  SHP: ( "SHP", 654, "Saint Helena pound" ),
  SLL: ( "SLL", 694, "Sierra Leonean leone" ),
  SOS: ( "SOS", 706, "Somali shilling" ),
  SRD: ( "SRD", 968, "Surinamese dollar" ),
  SSP: ( "SSP", 728, "South Sudanese pound" ),
  STN: ( "STN", 930, "Sao Tome and Principe dobra" ),
  SVC: ( "SVC", 222, "Salvadoran colon" ),
  SYP: ( "SYP", 760, "Syrian pound" ),
  SZL: ( "SZL", 748, "Swazi lilangeni" ),
  THB: ( "THB", 764, "Thai baht" ),
  TJS: ( "TJS", 972, "Tajikistani somoni" ),
  TMT: ( "TMT", 934, "Turkmenistan manat" ),
  TND: ( "TND", 788, "Tunisian dinar" ),
  TOP: ( "TOP", 776, "Tongan pa'anga" ),
  TRY: ( "TRY", 949, "Turkish lira" ),
  TTD: ( "TTD", 780, "Trinidad and Tobago dollar" ),
  TWD: ( "TWD", 901, "New Taiwan dollar" ),
  TZS: ( "TZS", 834, "Tanzanian shilling" ),
  UAH: ( "UAH", 980, "Ukrainian hryvnia" ),
  UGX: ( "UGX", 800, "Ugandan shilling" ),
  USD: ( "USD", 840, "United States dollar" ),
  USN: ( "USN", 997, "United States dollar (next day) " ),
  UYI: ( "UYI", 940, "Uruguay Peso en Unidades Indexadas " ),
  UYU: ( "UYU", 858, "Uruguayan peso" ),
  UYW: ( "UYW", 927, "Unidad previsional" ),
  UZS: ( "UZS", 860, "Uzbekistan som" ),
  VES: ( "VES", 928, "Venezuelan bolívar soberano" ),
  VND: ( "VND", 704, "Vietnamese dong" ),
  VUV: ( "VUV", 548, "Vanuatu vatu" ),
  WST: ( "WST", 882, "Samoan tala" ),
  XAF: ( "XAF", 950, "CFA franc BEAC" ),
  XAG: ( "XAG", 961, "Silver" ),
  XAU: ( "XAU", 959, "Gold" ),
  XBA: ( "XBA", 955, "European Composite Unit (EURCO)" ),
  XBB: ( "XBB", 956, "European Monetary Unit" ),
  XBC: ( "XBC", 957, "European Unit of Account 9" ),
  XBD: ( "XBD", 958, "European Unit of Account 17" ),
  XCD: ( "XCD", 951, "East Caribbean dollar" ),
  XDR: ( "XDR", 960, "Special drawing rights" ),
  XOF: ( "XOF", 952, "CFA franc BCEAO" ),
  XPD: ( "XPD", 964, "Palladium" ),
  XPF: ( "XPF", 953, "CFP franc" ),
  XPT: ( "XPT", 962, "Platinum" ),
  XSU: ( "XSU", 994, "SUCRE" ),
  XTS: ( "XTS", 963, "Reserved for testing" ),
  XUA: ( "XUA", 965, "ADB Unit of Account" ),
  XXX: ( "XXX", 999, "" ),
  YER: ( "YER", 886, "Yemeni rial" ),
  ZAR: ( "ZAR", 710, "South African rand" ),
  ZMW: ( "ZMW", 967, "Zambian kwacha" ),
  ZWL: ( "ZWL", 932, "Zimbabwean dollar" ),
  CNH: ( "CNH", 0, "Chinese yuan" ),
  CNT: ( "CNT", 0, "Chinese yuan" ),
  GGP: ( "GGP", 0, "Guernsey pound" ),
  IMP: ( "IMP", 0, "Isle of Man pound" ),
  JEP: ( "JEP", 0, "Jersey pound" ),
  KID: ( "KID", 0, "Kiribati dollar" ),
  NIS: ( "NIS", 0, "Israeli new shekel" ),
  NTD: ( "NTD", 0, "New Taiwan dollar" ),
  PRB: ( "PRB", 0, "Transnistrian ruble" ),
  SLS: ( "SLS", 0, "Somaliland shilling" ),
  RMB: ( "RMB", 0, "Renminbi (Chinese) yuan" ),
  TVD: ( "TVD", 0, "Tuvalu dollar" ),
  DASH: ( "DASH", 0, "Dash" ),
  ETH: ( "ETH",  0, "Ether" ),
  VTC: ( "VTC",  0, "Vertcoin" ),
  XBT: ( "XBT",  0, "Bitcoin" ),
  XLM: ( "XLM",  0, "Stellar Lumen" ),
  XMR: ( "XMR",  0, "Monero" ),
  XRP: ( "XRP",  0, "Ripple" ),
  ZEC: ( "ZEC",  0, "Zcash" ),
  NONE: ( "", 0, "" )
}.toTable()

let codeToCurrencyTable* = {
  784: AED,
  971: AFN,
    8: ALL,
   51: AMD,
  532: ANG,
  973: AOA,
   32: ARS,
   36: AUD,
  533: AWG,
  944: AZN,
  977: BAM,
   52: BBD,
   50: BDT,
  975: BGN,
   48: BHD,
  108: BIF,
   60: BMD,
   96: BND,
   68: BOB,
  984: BOV,
  986: BRL,
   44: BSD,
   64: BTN,
   72: BWP,
  933: BYN,
   84: BZD,
  124: CAD,
  976: CDF,
  947: CHE,
  756: CHF,
  948: CHW,
  990: CLF,
  152: CLP,
  156: CNY,
  170: COP,
  970: COU,
  188: CRC,
  931: CUC,
  192: CUP,
  132: CVE,
  203: CZK,
  262: DJF,
  208: DKK,
  214: DOP,
   12: DZD,
  818: EGP,
  232: ERN,
  230: ETB,
  978: EUR,
  242: FJD,
  238: FKP,
  826: GBP,
  981: GEL,
  936: GHS,
  292: GIP,
  270: GMD,
  324: GNF,
  320: GTQ,
  328: GYD,
  344: HKD,
  340: HNL,
  191: HRK,
  332: HTG,
  348: HUF,
  360: IDR,
  376: ILS,
  356: INR,
  368: IQD,
  364: IRR,
  352: ISK,
  388: JMD,
  400: JOD,
  392: JPY,
  404: KES,
  417: KGS,
  116: KHR,
  174: KMF,
  408: KPW,
  410: KRW,
  414: KWD,
  136: KYD,
  398: KZT,
  418: LAK,
  422: LBP,
  144: LKR,
  430: LRD,
  426: LSL,
  434: LYD,
  504: MAD,
  498: MDL,
  969: MGA,
  807: MKD,
  104: MMK,
  496: MNT,
  446: MOP,
  929: MRU,
  480: MUR,
  462: MVR,
  454: MWK,
  484: MXN,
  979: MXV,
  458: MYR,
  943: MZN,
  516: NAD,
  566: NGN,
  558: NIO,
  578: NOK,
  524: NPR,
  554: NZD,
  512: OMR,
  590: PAB,
  604: PEN,
  598: PGK,
  608: PHP,
  586: PKR,
  985: PLN,
  600: PYG,
  634: QAR,
  946: RON,
  941: RSD,
  643: RUB,
  646: RWF,
  682: SAR,
   90: SBD,
  690: SCR,
  938: SDG,
  752: SEK,
  702: SGD,
  654: SHP,
  694: SLL,
  706: SOS,
  968: SRD,
  728: SSP,
  930: STN,
  222: SVC,
  760: SYP,
  748: SZL,
  764: THB,
  972: TJS,
  934: TMT,
  788: TND,
  776: TOP,
  949: TRY,
  780: TTD,
  901: TWD,
  834: TZS,
  980: UAH,
  800: UGX,
  840: USD,
  997: USN,
  940: UYI,
  858: UYU,
  927: UYW,
  860: UZS,
  928: VES,
  704: VND,
  548: VUV,
  882: WST,
  950: XAF,
  961: XAG,
  959: XAU,
  955: XBA,
  956: XBB,
  957: XBC,
  958: XBD,
  951: XCD,
  960: XDR,
  952: XOF,
  964: XPD,
  953: XPF,
  962: XPT,
  994: XSU,
  963: XTS,
  965: XUA,
  999: XXX,
  886: YER,
  710: ZAR,
  967: ZMW,
  932: ZWL
}.toTable()

let stringToCurrencyTable* = {
  "AED": AED,
  "AFN": AFN,
  "ALL": ALL,
  "AMD": AMD,
  "ANG": ANG,
  "AOA": AOA,
  "ARS": ARS,
  "AUD": AUD,
  "AWG": AWG,
  "AZN": AZN,
  "BAM": BAM,
  "BBD": BBD,
  "BDT": BDT,
  "BGN": BGN,
  "BHD": BHD,
  "BIF": BIF,
  "BMD": BMD,
  "BND": BND,
  "BOB": BOB,
  "BOV": BOV,
  "BRL": BRL,
  "BSD": BSD,
  "BTN": BTN,
  "BWP": BWP,
  "BYN": BYN,
  "BZD": BZD,
  "CAD": CAD,
  "CDF": CDF,
  "CHE": CHE,
  "CHF": CHF,
  "CHW": CHW,
  "CLF": CLF,
  "CLP": CLP,
  "CNY": CNY,
  "COP": COP,
  "COU": COU,
  "CRC": CRC,
  "CUC": CUC,
  "CUP": CUP,
  "CVE": CVE,
  "CZK": CZK,
  "DJF": DJF,
  "DKK": DKK,
  "DOP": DOP,
  "DZD": DZD,
  "EGP": EGP,
  "ERN": ERN,
  "ETB": ETB,
  "EUR": EUR,
  "FJD": FJD,
  "FKP": FKP,
  "GBP": GBP,
  "GEL": GEL,
  "GHS": GHS,
  "GIP": GIP,
  "GMD": GMD,
  "GNF": GNF,
  "GTQ": GTQ,
  "GYD": GYD,
  "HKD": HKD,
  "HNL": HNL,
  "HRK": HRK,
  "HTG": HTG,
  "HUF": HUF,
  "IDR": IDR,
  "ILS": ILS,
  "INR": INR,
  "IQD": IQD,
  "IRR": IRR,
  "ISK": ISK,
  "JMD": JMD,
  "JOD": JOD,
  "JPY": JPY,
  "KES": KES,
  "KGS": KGS,
  "KHR": KHR,
  "KMF": KMF,
  "KPW": KPW,
  "KRW": KRW,
  "KWD": KWD,
  "KYD": KYD,
  "KZT": KZT,
  "LAK": LAK,
  "LBP": LBP,
  "LKR": LKR,
  "LRD": LRD,
  "LSL": LSL,
  "LYD": LYD,
  "MAD": MAD,
  "MDL": MDL,
  "MGA": MGA,
  "MKD": MKD,
  "MMK": MMK,
  "MNT": MNT,
  "MOP": MOP,
  "MRU": MRU,
  "MUR": MUR,
  "MVR": MVR,
  "MWK": MWK,
  "MXN": MXN,
  "MXV": MXV,
  "MYR": MYR,
  "MZN": MZN,
  "NAD": NAD,
  "NGN": NGN,
  "NIO": NIO,
  "NOK": NOK,
  "NPR": NPR,
  "NZD": NZD,
  "OMR": OMR,
  "PAB": PAB,
  "PEN": PEN,
  "PGK": PGK,
  "PHP": PHP,
  "PKR": PKR,
  "PLN": PLN,
  "PYG": PYG,
  "QAR": QAR,
  "RON": RON,
  "RSD": RSD,
  "RUB": RUB,
  "RWF": RWF,
  "SAR": SAR,
  "SBD": SBD,
  "SCR": SCR,
  "SDG": SDG,
  "SEK": SEK,
  "SGD": SGD,
  "SHP": SHP,
  "SLL": SLL,
  "SOS": SOS,
  "SRD": SRD,
  "SSP": SSP,
  "STN": STN,
  "SVC": SVC,
  "SYP": SYP,
  "SZL": SZL,
  "THB": THB,
  "TJS": TJS,
  "TMT": TMT,
  "TND": TND,
  "TOP": TOP,
  "TRY": TRY,
  "TTD": TTD,
  "TWD": TWD,
  "TZS": TZS,
  "UAH": UAH,
  "UGX": UGX,
  "USD": USD,
  "USN": USN,
  "UYI": UYI,
  "UYU": UYU,
  "UYW": UYW,
  "UZS": UZS,
  "VES": VES,
  "VND": VND,
  "VUV": VUV,
  "WST": WST,
  "XAF": XAF,
  "XAG": XAG,
  "XAU": XAU,
  "XBA": XBA,
  "XBB": XBB,
  "XBC": XBC,
  "XBD": XBD,
  "XCD": XCD,
  "XDR": XDR,
  "XOF": XOF,
  "XPD": XPD,
  "XPF": XPF,
  "XPT": XPT,
  "XSU": XSU,
  "XTS": XTS,
  "XUA": XUA,
  "XXX": XXX,
  "YER": YER,
  "ZAR": ZAR,
  "ZMW": ZMW,
  "ZWL": ZWL
}.toTable()


proc getCurrency*(code: int) : CurrencyDetails =
  result = currencyTable[codeToCurrencyTable[code]] 

proc getCurrency*(ccy: Currency) : CurrencyDetails =
  result = currencyTable[ccy] 

proc getCurrency*(name: string) : CurrencyDetails =
  result = currencyTable[stringToCurrencyTable[name]] 
