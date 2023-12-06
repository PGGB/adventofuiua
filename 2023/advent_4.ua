# $ Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
# $ Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
# $ Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
# $ Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
# $ Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
# $ Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
Input ← &fras "input_4"
Lines ← ⊜∘ ≠@\n.Input

Numbers ← ≡(
  regex "[\\d ]+"
  ⊡:
  ⊜parse≠@ .⊔⊢
) Lines
Winning ← Numbers 1
Draws ← Numbers 2

PartOne ← /+≡(
  /+∊    # find amount of matching numbers
  ⌊ⁿ:2-1 # calculate points
)Winning Draws
PartOne

# make vector of form [1 1 1... 0 0 0...] with amount of 1s on the stack
W ← ⊂⊓(↯:1|↯:0)⊃∘-:⧻Lines
# construct array of form [.. 1 1 x 1 1 ..] at position y
X ← ⍜⊏;:↯⧻Lines 1
PartTwo ← (
  ≡(W/+∊)Winning Draws     # matrix with amount of winning numbers per ticket as 1s
  ≡↻¯+1⇡⧻.                 # rotate rows to the correct position
  ;⍥(+1⊙(×X).:+1/+⊏,⍉,)⧻,0 # multiply copies by the tickets already owned
  /++1/+                   # add up tickets
)
PartTwo
