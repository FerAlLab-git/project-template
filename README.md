# project-template

Starter repository for FerAl Lab decision-analysis models in R, following the DARTH coding
framework ([Alarid-Escudero et al., *PharmacoEconomics* 2019](https://doi.org/10.1007/s40273-019-00837-x);
reference implementation [darthpack](https://github.com/DARTH-git/darthpack)).

Coding and naming rules are not repeated here. They live in the `lab-conventions` skill of
the [`decision-modeling` plugin](https://github.com/FerAlLab-git/feral-lab-os).

## Start a new model

1. On GitHub, click **Use this template** → **Create a new repository**. Choose
   **Private** for anything that will touch restricted data or unpublished results.
2. Clone it and rename `project-template.Rproj` to `<your repo name>.Rproj`.
3. In `DESCRIPTION`, set `Package`, `Title`, `Authors@R` and `Description`.
4. Replace the first paragraph of `CLAUDE.md` with a description of the model.
5. Decide on a license for the new project and replace `LICENSE`. The MIT license here
   covers this template.
6. Rewrite this README for the model.

The new repository starts with its own history. Nothing from other lab repositories
comes with it.

## Folder layout

From Table 1 of the DARTH paper. Each folder has a `.gitkeep` so it survives
"Use this template"; delete the `.gitkeep` once the folder has real files.

| Folder | Contents |
|---|---|
| `data-raw` | Raw data plus the `.R` scripts that read, process and save it to `data/` |
| `data` | Cleaned and processed input data used by the components |
| `R` | Function definitions, one script per component, plus dataset documentation |
| `analysis` | Scripts controlling the flow, one per component, plus `_master.R` |
| `output` | Calibration output, PSA datasets and other generated data files (git-ignored) |
| `figs` | Figures |
| `tables` | Tables for a publication or report |
| `report` | R Markdown describing the full analysis, knitted for publication or HTA submission |
| `vignettes` | R Markdown documenting how to use the functions and data of each component |
| `tests` | `testthat` unit tests in `tests/testthat/` |

The repository is structured as an R package, so the model loads with
`devtools::load_all(".")`.

### `analysis/_master.R`

`analysis/_master.R` runs every component in order. Each component script must also run
independently of the others: from a fresh R session at the project root, without relying
on objects left in memory by an earlier script. A script loads what it needs from `data/`
or `output/`.

### Model repositories only

This layout is for decision-analysis model repositories. Do not apply it to lab
operations (meeting notes, administration, planning) or to other kinds of projects.

## Never commit

Do not commit any of the following, to a private or a public repository:

- **Restricted data.** Anything covered by a data use agreement, IRB protocol or
  confidentiality terms, including individual-level and linked data and anything with
  PHI. Keep it outside the repository. If it must sit inside, put it in a folder named
  `restricted/`, which `.gitignore` excludes anywhere in the tree.
- **Large model outputs.** Calibration runs, PSA datasets, simulated cohorts and other
  generated files. `output/` is git-ignored; regenerate outputs from the code. For a
  small output that must be versioned, add it on purpose with `git add -f`.
- **`.Renviron`.** It holds API keys, tokens and machine-specific paths.
- **`renv/library`.** It is rebuilt from `renv.lock`. Commit `renv.lock`,
  `renv/activate.R` and `renv/settings.json` only.

`.gitignore` covers all four, but it is only a backstop. Check `git status` before every
commit. If something on this list is committed by mistake, deleting it in a later commit
does not remove it from the history. Stop, do not push (or push again), and tell the PI
right away.

## Claude Code settings

`.claude/settings.json` is shared by everyone who opens the repository in Claude Code:

- **Restricted folders.** A `Read` deny rule, `Read(/**/restricted/**)`, stops Claude's
  file tools from reading anything under a `restricted/` folder at any depth. It also
  covers `cat`, `head` and similar commands that name the file. It does **not** stop a
  command that reads files without naming them, such as `grep -r pattern .`, or a script
  that opens files itself. Keep restricted data outside the repository when you can.
- **Lab plugin.** When you trust the folder, Claude Code offers the `decision-modeling`
  plugin from [FerAlLab-git/feral-lab-os](https://github.com/FerAlLab-git/feral-lab-os).

Put personal overrides in `.claude/settings.local.json`, which is git-ignored.

## License

The template is released under the MIT License. See [LICENSE](LICENSE).
