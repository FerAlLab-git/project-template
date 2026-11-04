# CLAUDE.md

<!-- Replace this paragraph: one or two sentences on what this model is, the
population and interventions it compares, and who to ask about it. -->

## Lab plugin

This repository follows FerAl Lab conventions, which come from the `decision-modeling`
plugin. Install it once per machine:

```
/plugin marketplace add FerAlLab-git/feral-lab-os
/plugin install decision-modeling@feral-lab-os
```

Then run `/reload-plugins`, or restart Claude Code.

## Coding rules

The `lab-conventions` skill holds the coding rules: DARTH naming and prefixes, file,
function and test-file names, the five components, the model as a function, and the
supporting packages. Follow it, and do not restate or override it here. If a change would
break a convention, say so and let the author decide.

Use `model-code-review` to review code and `dm-calibration` for calibration work.

## This repository

- The folder layout and `analysis/_master.R` rule are described in `README.md`.
- Never commit restricted data, large model outputs, `.Renviron` or `renv/library`.
  See "Never commit" in `README.md`. Do not read or summarize files under any
  `restricted/` folder unless the user asks you to.

<!-- Add project-specific notes below: data sources and their access terms, how long
key components take to run, open decisions. -->
