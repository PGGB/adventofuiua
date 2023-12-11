# $ .....
# $ 7-F7-
# $ .FJ|7
# $ SJLL7
# $ |F--J
# $ LJ.LJ
Input ← &fras "input_10"
Lines ← ⊜∘≠@\n.Input
Start ← ♭⊚⌕@S Lines
Up ← -1_0
Down ← +1_0
Left ← -0_1
Right ← +0_1
Connections ← "|-LJ7F"
FindConnections ← (
  ⊢⊚=Connections⊡,Lines
  [
    (
      ⊃Up Down    # |
    | ⊃Left Right # -
    | ⊃Up Right   # L
    | ⊃Up Left    # J
    | ⊃Left Down  # 7
    | ⊃Right Down # F
    )  ]
)

Traverse ← ;⍢((∘|⊃⊢⊂)⧻.▽¬∊,,FindConnections)(>0⧻)
ConnectedPipe ← (¯1_¯1;|∘)∊⊡:Lines,
GetStart ← ⊢▽¬/↥⍉<0.[
  ⊃(
    ConnectedPipe "|7F" Up
  | ConnectedPipe "|LJ" Down
  | ConnectedPipe "-LF" Left
  | ConnectedPipe "-J7" Right
  )]Start
Loop ← Traverse⊃∘⊂GetStart [Start]

PartOne ← ÷2⧻Loop
PartOne

# LoopRows ← ⊕(□([]|⊡1)>0⧻.⍉)≡(⊢).⊏⍏.Loop
# LoopRows
# IsInside ← ◿2⊐/+<⊃(⋅∘|⊡?⊙⋅∘)°⊟:LoopRows
IsInside ← ◿2⧻⊝⊛-⇡⧻.▽<⊃(⋅∘|.⊡1⍉▽⊢=⍉,⊙⋅∘)°⊟:⊏⍏.Loop
# IsInside 0_0
NonLoop ← ⊚/↧≡(⍜⊡;⊙::0):¤↯ △ Lines 1Loop
# Loop
# ▽≡IsInside .NonLoop
# ⧻ LoopRows
# IsInside 3_2
# △ Loop

/↧≡(⍜⊡;)NonLoop ¤Lines " "
&fwa "output"↘1♭≡⊂@\n
