import std/times
import strformat
import ./constants

type
    DayCountRule* = enum
        dcActAct
        dc30360
        dc30E360
        dcAct360
        dcAct365F

#proc isLeapYear*(year: int): bool =
#    result = ((year mod 4 == 0) and (year mod 100 != 0)) or (year mod 400 == 0)

proc dayCount*(startDate: DateTime, endDate: DateTime, rule: DayCountRule ): float =
    case rule
    of dcActAct:
        #if startDate.year == endDate.year
        result = 1
    of dc30360:
        result = 1
    of dc30E360:
        result = 1
    of dcAct360:
        result = 1
    of dcAct365F:
        result = 1


