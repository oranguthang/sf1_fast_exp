# SF1 Fast EXP

`sf1_fast_exp` is a gameplay-focused fork of [ShiningForceCentral/SF1DISASM](https://github.com/ShiningForceCentral/SF1DISASM).

This repository tracks the upstream `main` branch and reapplies a set of easy mode tweaks on top of it, while keeping the normal split/build workflow from the base disassembly project.

## Easy Mode Settings

All tweaks are controlled by constants in [`disasm/sf1patches.asm`](disasm/sf1patches.asm). Setting a value back to its vanilla default disables the tweak. Code patches keep the original instruction sizes, so the ROM layout is not shifted.

| Constant | Default | Vanilla | Effect |
|---|---|---|---|
| `EASY_FAST_EXP` | 1 | 0 | Faster leveling (see below) |
| `EASY_ENEMY_GOLD_PERCENT` | 200 | 100 | Gold earned for defeating enemies, in percent |
| `EASY_SHOP_PRICE_PERCENT` | 100 | 100 | Item prices, in percent (also sell prices) |
| `EASY_KEEP_GOLD_ON_DEFEAT` | 1 | 0 | Gold is not halved when Max is defeated |
| `EASY_CHURCH_RAISE_COST_PER_LEVEL` | 5 | 10 | Raise cost per level |
| `EASY_CHURCH_CURE_POISON_COST` | 5 | 10 | Cure poison cost |
| `EASY_CHURCH_CURE_CURSE_COST` | 10 | 20 | Cure curse cost |
| `EASY_NO_DEFEAT_ON_LEADER_DEATH` | 1 | 0 | The battle is lost only when no ally is left, not when Max dies; Max is revived when the battle ends |
| `EASY_NO_TERRAIN_MOVE_PENALTY` | 1 | 0 | Every passable terrain costs allies 1 MOV, like plains; impassable terrain stays impassable, land effect and enemies are unchanged |
| `EASY_POISON_DAMAGE` | 1 | 2 | Poison damage per turn, for allies and enemies |
| `EASY_STAT_GROWTH_PERCENT` | 150 | 100 | Total ally stat growth from level 1 to 20, in percent (growth values are capped at 63) |
| `EASY_LINEAR_GROWTH` | 1 | 0 | All growth curves are linear, so stats grow evenly instead of late in the level range |
| `EASY_HIGH_LEVEL_STAT_GAIN_ODDS` | 2 | 4 | Above level 20 each stat gains 1 point with a 1 in N chance |
| `EASY_ENEMY_HP_PERCENT` | 100 | 100 | Enemy HP, in percent |
| `EASY_ENEMY_ATK_PERCENT` | 100 | 100 | Enemy base ATK, in percent |
| `EASY_ENEMY_DEF_PERCENT` | 100 | 100 | Enemy base DEF, in percent |
| `EASY_ENEMY_AGI_PERCENT` | 100 | 100 | Enemy base AGI, in percent |

### Fast EXP

With `EASY_FAST_EXP` enabled:

- healing actions use a 20 EXP floor instead of 10,
- support/status actions award 20 EXP instead of 1 or 10,
- physical attacks and kill rewards resolve to the 50 EXP action cap,
- the per-action EXP cap is 50 instead of 48.

## Upstream Base

- Upstream repository: [ShiningForceCentral/SF1DISASM](https://github.com/ShiningForceCentral/SF1DISASM)
- Base branch used here: `main`

## Quick Start

1. Put the original US ROM in `rom/` as `sf1.bin`.
2. Run `split\split.bat` to extract the binary assets into the disassembly tree.
3. Run `build\build.bat` to assemble a new ROM build.

## Project Structure

```text
sf1_fast_exp/
|-- build/              # Build output, logs, symbols, generated IPS
|-- disasm/             # Main disassembly source tree
|-- rom/                # Original source ROM (sf1.bin)
|-- split/              # Split scripts and split definition list
|-- tools/              # Assemblers and helper tools
`-- README.md
```

## Build Workflow

### Split

`split\split.bat`:

- reads `rom\sf1.bin`,
- uses `tools\splitrom`,
- extracts required binary chunks into the `disasm/` tree.

### Build

`build\build.bat`:

- assembles the sound driver and music banks first,
- assembles the main game through `asm68k`,
- writes output files into `build/`,
- copies the latest successful build to `build\sf1build-last.bin`,
- generates an IPS patch against `rom\sf1.bin` when the original ROM is present.

## Notes

- This fork is not intended to stay bit-perfect with the original ROM, because it deliberately changes gameplay behavior. Setting every easy mode constant to its vanilla value should produce the original ROM.
- The split/build process remains the same as upstream; only gameplay values and logic are changed here.
- If you want the unmodified upstream disassembly baseline, use `ShiningForceCentral/SF1DISASM` directly.

## Credits

- Base disassembly: [ShiningForceCentral/SF1DISASM](https://github.com/ShiningForceCentral/SF1DISASM)
- Original game rights belong to Sega and Climax/Sonic! Software Planning
