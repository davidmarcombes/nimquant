import std/times
import std/math

type 
    YearMonthDay* = tuple
        year: int
        month: int
        day: int                

proc getOaDate*(year: int, 
                month: int, 
                day: int) : int {.noSideEffect.} =
 
  let serial = 
    int(( 1461 * ( year + 4800 + ( month - 14 ) div 12 ) ) div 4 +
    ( 367 * ( month - 2 - 12 * ( ( month - 14 ) div 12 ) ) ) div 12 -
    ( 3 * ( ( year + 4900 + ( month - 14 ) div 12 ) div 100 ) ) div 4 +
    day - 2447094)
  # Adjust to account for 29 Feb 1900 bug in MS initial implementation that was never fixed
  # 1900 is not a leap, but MS believed it was
  case serial:
    of 1..60 : result = int(serial-1)
    of 61: result = if day == 29: 60 else: 61
    else: result = int(serial)

proc getOaDate*(date: DateTime) : int {.noSideEffect.} =
    result = getOaDate(date.year, 1, 1) + date.yearday

proc getOaDate*(date: YearMonthDay) : int {.noSideEffect.} =
    result = getOaDate(date.year, date.month, date.day)

proc getOaDateTime*(year: int, 
                month: int, 
                day: int,
                hours: int,
                minutes: int,
                seconds: int,
                milliseconds: int) : float {.noSideEffect.} =

    result = float(getOaDate(year, month, day)) +
        ( float(hours) + 
        ( float(minutes) +
        ( float(seconds) + 
          float(milliseconds)/1000.0 )  / 60.0 ) / 60.0 ) / 24.0
        
proc getOaDateTime*(date: DateTime) : float {.noSideEffect.} =
    result = getOaDateTime(date.year, 1, 1, 
                       date.hour, date.minute, date.second, 
                       int( float(date.nanosecond) / 1e6 ) ) + 
                       float(date.yearday)

proc oaDateToYearMonthday*(date: int) : YearMonthDay {.noSideEffect.} =
    var serial = date
    if serial < 60: serial += 1
    var l = serial + 68569 + 2415019
    let n = ( 4 * l ) div 146097
    l = l - ( 146097 * n + 3 ) div 4
    let i = ( 4000 * ( l + 1 ) ) div 1461001
    l = l - ( 1461 * i ) div 4 + 31
    let j = ( 80 * l ) div 2447

    let d = int(l - ( 2447 * j ) div 80)
    l = j div 11
    let m = int(j + 2 - ( 12 * l ))
    let y = int(100 * ( n - 49 ) + i + l)
    result = (y, m, d)

proc oaDateToDateTime*(date: int) : DateTime  =
    let (y, m, d) = oaDateToYearMonthday(date)
    result = dateTime(y, Month(m), d)

proc oaDateToDateTime*(date: float) : DateTime  =
    let serial = floor(date)
    let (y, m, d) = oaDateToYearMonthday(int(serial))
    var frac = (date - serial) * 24
    let hours = floor(frac)
    frac = ( frac - hours ) * 60
    let minutes = floor(frac)
    frac = ( frac - minutes ) * 60
    let seconds = floor(frac)
    frac =  ( frac - seconds ) * 1e9
    let nanosecond = floor(frac)

    result = dateTime(y, Month(m), d, int(hours), int(minutes), int(seconds), int(nanosecond))