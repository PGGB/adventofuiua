# Experimental!
# $ 0 3 6 9 12 15
# $ 1 3 6 10 15 21
# $ 10 13 16 21 30 45
Input ← &fras "input_9"
Lines ← ⊜□≠@\n.Input
Report ← ≡(⊜⋕≠@ .°□)Lines
NextValue! ← (
  : [] # accumulator
  ;⍢(
    ⊙⊂:⊢^1. # add value to acc
    /-⍉◫2   # get value change
  )(≠0/+≠0) # while non-zero differences
)
PartOne ← /+≡(/+NextValue!⇌) Report
PartOne

NextValueRec ← ↬(
  : ⊢ .
  /-⍉◫2
  ≠0/+≠0.
  (;||1.0 -↫)
)
/+≡NextValueRec Report
