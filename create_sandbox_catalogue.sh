# ---------- 1  Monthly product + price ----------
# stripe products create --project-name Launch_test \
#  --id standard_monthly \
#  --name "Standard Monthly" \
#  --description "Praxio AI - Tax Assistant"

 stripe prices create --project-name Launch_test \
  -d product=standard_monthly \
  -d unit_amount=7900 \
  -d currency=aud \
  -d recurring[interval]=month

# ---------- 2  Annual product + price ----------
#stripe products create --project-name Launch_test \
#  --id standard_yearly \
#  --name "Standard Yearly" \
#  --description "Praxio AI - Tax Assistant"

stripe prices create --project-name Launch_test \
  -d product=standard_yearly \
  -d unit_amount=86900 \
  -d currency=aud \
  -d recurring[interval]=year

# ---------- 3  Inclusive 10% GST tax rate ----------
#stripe tax_rates create --project-name Launch_test \
#  -d display_name="GST" \
#  -d percentage=10 \
#  -d inclusive=true \
 # -d country=AU
