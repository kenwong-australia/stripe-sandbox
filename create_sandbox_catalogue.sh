#!/usr/bin/env bash
# create_sandbox_catalogue.sh
# Builds the Standard plan catalogue in the Launch_test sandbox

# ---------- Product ----------
#stripe products create --project-name Launch_test \
#  --id prod_standard \
#  --name "Standard Plan" \
#  --description "Praxio AI – Standard Plan"

# ----- Monthly price -----
stripe prices create \
  --project-name Launch_test \
  --product prod_standard \
  --unit-amount 7900 \
  --currency aud \
  --interval month \
  --lookup-key standard_monthly

# ----- Annual price -----
stripe prices create \
  --project-name Launch_test \
  --product prod_standard \
  --unit-amount 86900 \
  --currency aud \
  --interval year \
  --lookup-key standard_yearly

# ----- Inclusive GST 10 % -----
stripe tax-rates create \
  --project-name Launch_test \
  --display-name "GST" \
  --percentage 10 \
  --inclusive \
  --country AU