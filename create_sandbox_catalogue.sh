#!/usr/bin/env bash
# create_standard_plan_sandbox.sh
# Creates the “Standard Plan” catalogue in your Launch_test sandbox.
# Run:  chmod +x create_standard_plan_sandbox.sh && ./create_standard_plan_sandbox.sh

# ---------- Product ----------
stripe products create --project-name Launch_test \
  --id=prod_standard \
  --name="Standard Plan" \
  --description="Praxio AI – Standard Plan"

# ---------- Monthly price ----------
stripe prices create --project-name Launch_test \
  --product=prod_standard \
  --unit_amount=7900 \
  --currency=aud \
  --recurring[interval]=month \
  --lookup_key=standard_monthly

# ---------- Annual price ----------
stripe prices create --project-name Launch_test \
  --product=prod_standard \
  --unit_amount=86900 \
  --currency=aud \
  --recurring[interval]=year \
  --lookup_key=standard_yearly

# ---------- Inclusive 10 % GST ----------
stripe tax_rates create --project-name Launch_test \
  --display_name="GST" \
  --percentage=10 \
  --inclusive=true \
  --country=AU
