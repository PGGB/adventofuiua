# $ 
# $ AAA = (BBB, BBB)
# $ BBB = (AAA, ZZZ)
# $ ZZZ = (ZZZ, ZZZ)
Input ← &fras "input_8"
Lines ← ⊜□ ≠@\n.Input
Commands ← °□=@R⊢Lines
Table ← ↘1⍉ regex "(\\w+) = \\((\\w+), (\\w+)\\)" Input
NextCommand ← ⊡◿ ⧻,:Commands
Locations ← ⇡⧻Lines
Connections ← ⍉≡≡(⊢⊚⌕)↘1Table ¤¤⊢Table
Start ← ⊢⊚=□"AAA"⊢Table
End ← ⊢⊚=□"ZZZ"⊢Table

PartOne ← (
  Start 0
  ;⍢(
    ⊡:Connections
    ⊙(+1)(⊡0|⊡1)NextCommand,
  )(≠End)
)
PartOne

Starts ← ⊚=@A⊡2⍉≡°□⊢Table
Ends ← ⊚=@Z⊡2⍉≡°□⊢Table
PartTwo ← (
  Starts 0
  ;⍢(
    ≡(
      ⊡:Connections
      (⊡0|⊡1)NextCommand,
    )
    ⊙(&p⊢.+1)
  )(¬/↧∊Ends)
)
PartTwo
