$ 1abc2
$ pqr3stu8vwx
$ a1b2c3d4e5f
$ treb7uchet
X ←
File ← &fras "input_1"
FileTable ← ⊜□≠@\n.File
FilterNumbers ← ▽≤@9.⊔
F ← parse⊂∩⊢:⇌.FilterNumbers

# Solution Part 1
# /+∵F FileTable

$ two1nine
$ eightwothree
$ abcone2threexyz
$ xtwone3four
$ 4nineeightseven2
$ zoneight234
$ 7pqrstsixteen
Y ←

NumStrings ← {
  "zero" "one" "two" "three" "four" "five"
  "six" "seven" "eight" "nine"
}

Nums ← {"0" "1" "2" "3" "4" "5" "6" "7" "8" "9"}

FindNums ← ×⇡10≡(⬚@ ⊐⌕)
# Maps strings to the found numbers
MapNums ← ⬚0≡(/↥⊂∩FindNums Nums:NumStrings.) FileTable
# Filter out 0s and combine the first and last number
# then add reduce
/+≡(+×10∩⊢:⇌.▽≠0.)MapNums
