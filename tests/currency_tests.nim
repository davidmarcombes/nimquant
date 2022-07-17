import nimquant/currency

assert "EUR" == getCurrency(Currency.EUR).code
assert "EUR" == getCurrency("EUR").code
assert "EUR" == getCurrency(978).code

assert 978 == getCurrency(Currency.EUR).number
assert 978 == getCurrency("EUR").number
assert 978 == getCurrency(978).number

assert "USD" == getCurrency(Currency.USD).code
assert "USD" == getCurrency("USD").code
assert "USD" == getCurrency(840).code

assert 840 == getCurrency(Currency.USD).number
assert 840 == getCurrency("USD").number
assert 840 == getCurrency(840).number

