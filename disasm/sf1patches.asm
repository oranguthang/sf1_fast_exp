
; ---------------------------------------------------------------------------
; Easy mode settings
; ---------------------------------------------------------------------------
;
; Flags: 0 = OFF, 1 = ON. Setting a value to its vanilla default disables the change.
;
; Code patches keep the size of the original instructions, so ROM layout is not shifted.

EASY_FAST_EXP:                      equ 1       ; Faster leveling: healing and kill EXP rewards are raised up to the 50 EXP per action cap. See README.md for details.

; Economy
EASY_ENEMY_GOLD_PERCENT:            equ 200     ; Gold earned for defeating enemies, in percent. Vanilla = 100. Resulting amounts must not exceed 65535.
EASY_SHOP_PRICE_PERCENT:            equ 100     ; Item prices, in percent. Also affects sell prices. Vanilla = 100. Resulting prices must not exceed 65535.
EASY_KEEP_GOLD_ON_DEFEAT:           equ 1       ; The Force's gold is not halved when Max is defeated.
EASY_CHURCH_RAISE_COST_PER_LEVEL:   equ 5       ; Vanilla = 10
EASY_CHURCH_CURE_POISON_COST:       equ 5       ; Vanilla = 10. Must not exceed 127.
EASY_CHURCH_CURE_CURSE_COST:        equ 10      ; Vanilla = 20. Must not exceed 127.

; Battle
EASY_NO_DEFEAT_ON_LEADER_DEATH:     equ 1       ; The battle is lost only when no ally is left, instead of when Max dies. Max is revived when the battle ends.
EASY_POISON_DAMAGE:                 equ 1       ; Poison damage per turn, for allies and enemies. Vanilla = 2. Must not exceed 127.

; Ally growth
EASY_STAT_GROWTH_PERCENT:           equ 150     ; Total stat growth from level 1 to 20 (before and after promotion), in percent. Vanilla = 100. Growth values are capped at 63.
EASY_LINEAR_GROWTH:                 equ 1       ; All growth curves are linear, so stats grow evenly instead of late in the level range.
EASY_HIGH_LEVEL_STAT_GAIN_ODDS:     equ 2       ; Above level 20 each stat gains 1 point with a 1 in N chance. Vanilla = 4. Must be between 1 and 127.

; Enemies (base stats from the enemy definitions)
EASY_ENEMY_HP_PERCENT:              equ 100     ; Vanilla = 100. Nonzero stats stay at least 1.
EASY_ENEMY_ATK_PERCENT:             equ 100     ; Vanilla = 100
EASY_ENEMY_DEF_PERCENT:             equ 100     ; Vanilla = 100
EASY_ENEMY_AGI_PERCENT:             equ 100     ; Vanilla = 100
