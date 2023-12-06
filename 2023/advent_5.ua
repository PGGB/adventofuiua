# $ seeds: 79 14 55 13
# $
# $ seed-to-soil map:
# $ 50 98 2
# $ 52 50 48
# $
# $ soil-to-fertilizer map:
# $ 0 15 37
# $ 37 52 2
# $ 39 0 15
# $
# $ fertilizer-to-water map:
# $ 49 53 8
# $ 0 11 42
# $ 42 0 7
# $ 57 7 4
# $
# $ water-to-light map:
# $ 88 18 7
# $ 18 25 70
# $
# $ light-to-temperature map:
# $ 45 77 23
# $ 81 45 19
# $ 68 64 13
# $
# $ temperature-to-humidity map:
# $ 0 69 1
# $ 1 0 69
# $
# $ humidity-to-location map:
# $ 60 56 37
# $ 56 93 4
Input ← &fras "input_5"

Parse! ← (
  regex : Input
  ⊔⊏1♭
  ⊜^1≠⊙.:
)

Seeds ← Parse!(parse) : @ "seeds: ([\\d ]+)"

Maps ← ⊐≡(Parse!(⊜parse≠@ .) : @\n) {
  "seed-to-soil map:\\n([\\d \\n]+)"
  "soil-to-fertilizer map:\\n([\\d \\n]+)"
  "fertilizer-to-water map:\\n([\\d \\n]+)"
  "water-to-light map:\\n([\\d \\n]+)"
  "light-to-temperature map:\\n([\\d \\n]+)"
  "temperature-to-humidity map:\\n([\\d \\n]+)"
  "humidity-to-location map:\\n([\\d \\n]+)"}
IsInRange ← ↧⊃(>|≥0)-:⊙⊃(⊡1|⊡2)
MapRange ← +-:⊙⊃(⊡1|⊡0)

CycleOne ← (
  ⊠((¯1;;|MapRange)IsInRange,,) , # check if any ranges match
  <0.⍜⍉/↥                         # find the entries without a match
  (⊙;|∘;)                         # replace location if found
)

PartOne ← (
  :0⧻.Maps Seeds
  ⍥(
    ⊔⊡,,                 # pick the next map
    ⊃(⋅⊙∘)(CycleOne⊙⋅⋅∘) # calculate new locations
    +1                   # increment counter
  )
  /↧⋅⋅∘
)
# PartOne

STS ← ⊔⊡0Maps
STF ← ⊔⊡1Maps
FTW ← ⊔⊡2Maps
WTL ← ⊔⊡3Maps
LTT ← ⊔⊡4Maps
TTH ← ⊔⊡5Maps
HTL ← ⊔⊡6Maps

SeedRanges ← (
  ↯⇌⊂2 ÷2 ⧻.Seeds # reshape into pairs
  # ≡(□+⇡⊃(⊡1|⊡0))  # blow out ranges
)

CycleTwo ← (
  ≡((¯1;;|MapRange)IsInRange,,) , # check if any ranges match
  <0.⍜⍉/↥                         # find the entries without a match
  (⊙;|∘;)                         # replace location if found
)
RunWholeCycle ← (
  CycleTwo STS
  CycleTwo STF
  CycleTwo FTW
  CycleTwo WTL
  CycleTwo WTL
  CycleTwo LTT
  CycleTwo TTH
  CycleTwo HTL
)

SplitSize ← 8
SelectedSeedRange ← 0
PackSize ← ⌊÷SplitSize⊡1⊡SelectedSeedRange SeedRanges
PackStarts ← ⍥(⊂+PackSize ⊢.)-1SplitSize ¤⊢⊡SelectedSeedRange SeedRanges
# ÷10000/+⊡1⍉↯⇌⊂2 ÷2 ⧻.Seeds # reshape into pairs
# ≡(\+)SeedRanges

PartTwo ← (
  PackStarts
  ≡spawn(&p"Thread finished"⊙;⍥(⊃(+⊙⋅∘1|↧⊙⋅∘)RunWholeCycle .) PackSize : 9999999999)
  /↧wait
)
PartTwo

&pf "Answer for seed range "
&p SelectedSeedRange
