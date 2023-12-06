# $ Time:      7  15   30
# $ Distance:  9  40  200
Input ← &fras "input_6"

Records ← ⍉≡(⊜parse ≠@ .⊔⊢)regex "[\\d ]+" Input
WaysToWin ← /+>⊃(⊡1|×-,:⇡.⊡0)
/×≡WaysToWin Records

SingleRace ← ≡(parse⊐∧⊂ :""⇌⊜□≠@ .⊔⊢)regex "[\\d ]+" Input
WaysToWin SingleRace
