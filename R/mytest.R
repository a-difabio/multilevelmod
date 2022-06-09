glmer_recipe = recipe(height_cm ~ years_after_planting + trial_name + provenance,
                      data = training)

glmer_model = linear_reg() %>%
  set_engine("glmer", family = Gamma("log"))

glmer_formula = height_cm ~ years_after_planting + (years_after_planting|trial_name/provenance)

glmer_workflow = workflow() %>%
  add_recipe(glmer_recipe) %>%
  add_model(glmer_model, formula = glmer_formula)

glmer_fitted = fit_resamples(glmer_workflow, resamples = training_folds)


# -------------------------------------------------------------------------


lmer_recipe = recipe(height_cm ~ years_after_planting + trial_name + provenance,
                      data = training)

lmer_model = linear_reg() %>%
  set_engine("lmer")

lmer_formula = height_cm ~ years_after_planting + (years_after_planting|trial_name/provenance)

lmer_workflow = workflow() %>%
  add_recipe(lmer_recipe) %>%
  add_model(lmer_model, formula = lmer_formula)

lmer_fitted = fit_resamples(lmer_workflow, resamples = training_folds)

