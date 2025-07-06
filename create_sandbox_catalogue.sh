#!/usr/bin/env bash
# create_sandbox_catalogue.sh
# Builds the Standard plan catalogue in the Launch_test sandbox

# ---------- Product ----------
#stripe products create --project-name Launch_test \
#  --id prod_standard \
#  --name "Standard Plan" \
#  --description "Praxio AI – Standard Plan"

# ---------- 2  Monthly price ----------
stripe prices create \
  --project-name Launch_test \
  -d product=prod_standard \
  -d unit_amount=7900 \
  -d currency=aud \
  -d recurring[interval]=month \
  -d lookup_key=standard_monthly

# ---------- 3  Annual price ----------
stripe prices create \
  --project-name Launch_test \
  -d product=prod_standard \
  -d unit_amount=86900 \
  -d currency=aud \
  -d recurring[interval]=year \
  -d lookup_key=standard_yearly

# ---------- 4  Inclusive 10 % GST ----------
stripe tax_rates create \
  --project-name Launch_test \
  -d display_name="GST" \
  -d percentage=10 \
  -d inclusive=true \
  -d country=AU