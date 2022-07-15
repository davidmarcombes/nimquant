import std/times
import std/strformat
import nimquant/datetools

proc testGetOaDate(year: int, month: int, day: int, serial: int) = 

  let oa = getOaDate(year, month, day)
  assert oa == serial, fmt"got {oa} != {serial}"

  let oaymd = getOaDate( (year, month, day) )
  assert oaymd == serial, fmt"got {oaymd} != {serial}"


  if year != 1900 and month != 2 and day != 29:
    let oad = getOaDate(dateTime(year, Month(month), day))
    assert oad == serial, fmt"got {oad} != {serial}"

    let ymd = oaDateToYearMonthday(serial)
    assert ymd.year == year and ymd.month == month and ymd.day == day, 
      fmt"got {ymd.year} {ymd.month} {ymd.day} != {year} {month} {day}"

    let idt = oaDateToDateTime(serial)
    assert idt == dateTime(year, Month(month), day), 
      fmt"got {idt} != {dateTime(year, Month(month), day)}"
    
    let fdt = oaDateToDateTime(float(serial))
    assert idt == dateTime(year, Month(month), day), 
      fmt"got {fdt} != {dateTime(year, Month(month), day)}"


testGetOaDate(1990, 7, 19, 33073)

testGetOaDate(1900, 1, 1, 1)
testGetOaDate(1900, 1, 31, 31)
testGetOaDate(1900, 2, 27, 58)
testGetOaDate(1900, 2, 28, 59)
testGetOaDate(1900, 2, 29, 60)
testGetOaDate(1900, 3, 1, 61)
testGetOaDate(1990, 7, 19, 33073)
testGetOaDate(2022, 3, 8, 44628)
testGetOaDate(2014, 4, 17, 41746)
testGetOaDate(2027, 6, 11, 46549)
testGetOaDate(2077, 12, 1, 64985)
testGetOaDate(2061, 3, 15, 58880)
testGetOaDate(1988, 10, 25, 32441)
testGetOaDate(1992, 10, 15, 33892)
testGetOaDate(2002, 12, 10, 37600)
testGetOaDate(2087, 5, 4, 68426)
testGetOaDate(2037, 9, 21, 50304)
testGetOaDate(2047, 10, 23, 53988)
testGetOaDate(1968, 4, 5, 24933)
testGetOaDate(1975, 7, 10, 27585)
testGetOaDate(2087, 6, 14, 68467)
testGetOaDate(1996, 7, 22, 35268)
testGetOaDate(2027, 6, 14, 46552)
testGetOaDate(2019, 12, 11, 43810)
testGetOaDate(1972, 8, 16, 26527)
testGetOaDate(2032, 10, 9, 48496)
testGetOaDate(2038, 2, 4, 50440)
testGetOaDate(1965, 8, 30, 23984)
testGetOaDate(2011, 8, 14, 40769)
testGetOaDate(1966, 2, 12, 24150)
testGetOaDate(1959, 10, 6, 21829)
testGetOaDate(1985, 4, 28, 31165)
testGetOaDate(1992, 5, 6, 33730)
testGetOaDate(2026, 9, 22, 46287)
testGetOaDate(1978, 3, 4, 28553)
