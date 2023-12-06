# $ 467..114..
# $ ...*......
# $ ..35..633.
# $ ......#...
# $ 617*......
# $ .....+.58.
# $ ..592.....
# $ ......755.
# $ ...$.*....
# $ .664.598..
Input ← &fras "input_3"
Lines ← ⊜∘≠@\n.Input
SymbolMap ← ↧⊓(↥⊓(<@0|>@9).|≠@.).Lines
NumberMap ← ↧⊓(↧⊓(≥@0|≤@9).|≠@.).Lines
# IsAdjacent ← /↥/↥≡≡/↧≤1⌵⊠-⊚⊙¤

# NumsAdjacentSym ← ⊙;⍢(↧NumberMap ≡≡IsAdjacent ¤¤,⊞⊂.⇡⧻:)(¬≍)SymbolMap NumberMap
# /+≡(/+⊜(⍣(parse|0;;)))NumsAdjacentSym Lines

IsAdjacent ← /↧≤1⌵-
GearMap ← =@*Lines
Coords ← ⊞⊂.⇡⧻GearMap
# mask of spots adjacent to gears
GearsAdjacent ← (
  ≡(↧NumberMap≡≡IsAdjacent¤¤)⊚GearMap¤Coords
)
# mask of numbers adjacent to gears
NumsAdjacentGears ← ;≡(
  :NumberMap
  ⍢(/↥≡(↧NumberMap≡≡IsAdjacent¤¤)⊚,¤Coords ⊙;)(¬≍)
) GearsAdjacent

# mask of gears with 2 numbers
TwoGears ← =2≡(/+≡(⧻⊜□≠0.))NumsAdjacentGears
# solution to part 2
/+×TwoGears≡(⬚1/×≡(□/×⊜parse): Lines)NumsAdjacentGears
