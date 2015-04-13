# -*- coding: utf-8 -*-

# sets var formatter to string w/ sort of params inside
formatter = "Test %{first} this %{second} thing %{third} like %{fourth} so."

# prints to the terminal formatter w/ four numbers set as sort of params
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
# prints to the terminal formatter w/ four str set as sort of params
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
# prints to term formatter w/ four bools set as sort of params
puts formatter % {first: true, second: false, third: true, fourth: false}
# prints to term form w/ form set as all four sort of params
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}

# prints form w/ four str vals as sort of params
puts formatter % {
	first: "I had this thing.",
	second: "That you could type up right.",
	third: "But it didn't sing.",
	fourth: "So I said goodnight."
}

# they are sort key indexy !Q what is this concept called?