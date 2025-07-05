#!/usr/bin/env bash
# Creates Essential plan in the SANDBOX account

stripe --profile sandbox products create \
  --id=prod_essential \
  --name="Essential Plan" \
  --description="Core AI tax-advisor features"

stripe --profile sandbox prices create \
  --product=prod_essential \
  --unit_amount=7000 --currency=aud \
  --recurring[interval]=month \
  --lookup_key=essential_monthly

stripe --profile sandbox prices create \
  --product=prod_essential \
  --unit_amount=700000 --currency=aud \
  --recurring[interval]=year \
  --lookup_key=essential_annual

stripe --profile sandbox tax_rates create \
  --display_name="GST" --percentage=10 \
  --inclusive=true --country=AU
