################################################################################
# _master.R: runs every component of the analysis in order.
#
# Rule: each component script in analysis/ must also run on its own, from a
# fresh R session with the working directory at the project root (open the
# .Rproj file). A script must not depend on objects left in memory by an
# earlier script; it loads what it needs from data/ or output/.
#
# Uncomment each line once the component script exists. File names follow
# <component number>_<description>.R; see the lab-conventions skill.
################################################################################

devtools::load_all(".")

#### 01 Model inputs ####
# source("analysis/01_model_inputs.R", echo = TRUE)

#### 02 Decision model implementation ####
# source("analysis/02_decision_model.R", echo = TRUE)

#### 03 Model calibration ####
# source("analysis/03_calibration.R", echo = TRUE)

#### 04 Model validation ####
# source("analysis/04_validation.R", echo = TRUE)

#### 05a Probabilistic analysis (primary analysis) ####
# source("analysis/05a_probabilistic_analysis.R", echo = TRUE)

#### 05b Scenario and deterministic sensitivity analysis ####
# source("analysis/05b_deterministic_analysis.R", echo = TRUE)

#### 05c Value of information ####
# source("analysis/05c_value_of_information.R", echo = TRUE)
