#!/usr/bin/env bash
# Creates Essential plan in the SANDBOX account

stripe --profile sandbox products create \
  --id=prod_standard \
  --name="Standard Plan" \
  --description="Praxio AI - Standard Plan"

stripe --profile sandbox prices create \
  --product=prod_standard \
  --unit_amount=7900 --currency=aud \
  --recurring[interval]=month \
  --lookup_key=standard_monthly

stripe --profile sandbox prices create \
  --product=prod_standard \
  --unit_amount=86900 --currency=aud \
  --recurring[interval]=year \
  --lookup_key=standard_yearly

stripe --profile sandbox tax_rates create \
  --display_name="GST" --percentage=10 \
  --inclusive=true --country=AU
