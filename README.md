# SF1 Fast EXP

`sf1_fast_exp` is a gameplay-focused fork of [ShiningForceCentral/SF1DISASM](https://github.com/ShiningForceCentral/SF1DISASM).

This repository tracks the upstream `main` branch and reapplies a fast EXP tweak on top of it, while keeping the normal split/build workflow from the base disassembly project.

## What Changed

This fork changes battle EXP gain behavior to speed up leveling:

- healing actions now use a 20 EXP floor instead of 10,
- support/status actions now award 20 EXP instead of 1 or 10,
- physical attacks and kill rewards now resolve to the 50 EXP action cap,
- the per-action EXP cap is now 50 instead of 48.

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

- This fork is not intended to stay bit-perfect with the original ROM, because it deliberately changes EXP behavior.
- The split/build process remains the same as upstream; only the gameplay EXP logic is changed here.
- If you want the unmodified upstream disassembly baseline, use `ShiningForceCentral/SF1DISASM` directly.

## Credits

- Base disassembly: [ShiningForceCentral/SF1DISASM](https://github.com/ShiningForceCentral/SF1DISASM)
- Original game rights belong to Sega and Climax/Sonic! Software Planning
