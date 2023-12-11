# $ ...#......
# $ .......#..
# $ #.........
# $ ..........
# $ ......#...
# $ .#........
# $ .........#
# $ ..........
# $ .......#..
# $ #...#.....
Input ← &fras "input_11"
Table ← =@#⊜∘≠ @\n .Input

Expand ← ⊏⊏⍏.⊂⊃(⇡⧻|⊚=0/+⍉).
ExTable ← ⍉Expand⍉Expand Table
PartOne ← (
  .⊚ExTable
  ⊠(/+⌵-) # Find the distance between two points
  ÷2/+/+  # Sum them up, divide by 2 because we only
  # want one distance per pair
)
PartOne

EmptyColumns ← ⊚=0/+Table
EmptyRows ← ⊚=0/+⍉Table
ExpandSize ← 1000000
ExpandTwo ← ≡(+-:×ExpandSize./+<,)¤
PartTwo ← (
  ⍉⊚Table
  .⍉⊟∩ExpandTwo ⊃(EmptyRows ⊡0|EmptyColumns ⊡1)
  ⊠(/+⌵-)
  ÷2/+/+
)
PartTwo
