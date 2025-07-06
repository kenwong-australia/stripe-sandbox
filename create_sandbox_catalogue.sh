#!/usr/bin/env bash
# create_sandbox_catalogue.sh
# Builds the Standard plan catalogue in the Launch_test sandbox

# ---------- Product ----------
#stripe products create --project-name Launch_test \
#  --id prod_standard \
#  --name "Standard Plan" \
#  --description "Praxio AI – Standard Plan"

# ---------- Monthly price ----------
stripe prices create \
  --project-name Launch_test \
  --data product=prod_standard \
  --data unit_amount=7900 \
  --data currency=aud \
  --data recurring[interval]=month \
  --data lookup_key=standard_monthly

# ---------- Annual price ----------
stripe prices create \
  --project-name Launch_test \
  --data product=prod_standard \
  --data unit_amount=86900 \
  --data currency=aud \
  --data recurring[interval]=year \
  --data lookup_key=standard_yearly

# ---------- Inclusive 10 % GST ----------
stripe tax_rates create \
  --project-name Launch_test \
  --data display_name="GST" \
  --data percentage=10 \
  --data inclusive=true \
  --data country=AU