# $ 32T3K 765
# $ T55J5 684
# $ KK677 28
# $ KTJJT 220
# $ QQQJA 483
Input ← &fras "input_7"
Cards ← "23456789TJQKA"

Lines ← ⊜□≠ @\n .Input
Parsed ← ≡(⊜□≠@ .°□) Lines
Hands ← ≡(⊗:Cards °□)⊢⍉Parsed
Bets ← ≡(⋕°□)⊏1⍉Parsed
RankHand ← (
  ⍤ "There needs to be at least 1 kind" 1
| 6;         # 6: Five of a kind
| (4|5) =4 ⊢ # 5: Four of a kind / 4: Full house
| (2|3) =3 ⊢ # 3: Three of a kind / 2: Two pair
| 1;         # 1: One pair
| 0;         # 0: High card
)⧻.
GroupHand ← ⊏⍖.⊕⧻⊛.
Winnings ← (
  ⊏:Bets⍏  # Sort bets by ranks
  /+×+1⇡⧻. # Multiply bets by rank
)

PartOne ← (
  ≡(⊂RankHand GroupHand.)Hands # Rank hands
  Winnings
)
PartOne

NewCards ← "J23456789TQKA"
NewHands ← ≡(⊗:NewCards °□)⊢⍉Parsed

NewGroupHand ← (
  ⊙GroupHand-:5⧻.▽≠0. # Filter and count J
  (⊙⊂0|)>0⧻,          # Handle special case 5 J
  ⍜⊙⊡+:0              # Add J to highest card
)
PartTwo ← (
  ≡(⊂RankHand NewGroupHand.)NewHands # Rank hands
  Winnings
)
PartTwo
