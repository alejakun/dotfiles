#!/bin/sh
# echo "Hawaii;$(export TZ='Pacific/Honolulu';date +'%-l:%M %p');unset )"
# echo "Alaska;$(export TZ='America/Anchorage';date +'%-l:%M %p');unset )"
# echo "Pacific;$(export TZ='US/Pacific';date +'%-l:%M %p');unset )"
# echo "Mountain;$(export TZ='US/Mountain';date +'%-l:%M %p');unset )"
# echo "Central;$(export TZ='US/Central';date +'%-l:%M %p');unset )"
# echo "Eastern;$(export TZ='US/Eastern';date +'%-l:%M %p');unset )"
# echo "London;$(export TZ='Europe/London';date +'%-l:%M %p');unset )"
# echo "Paris;$(export TZ='Europe/Paris';date +'%-l:%M %p');unset )"
# echo "Moscow;$(export TZ='Europe/Moscow';date +'%-l:%M %p');unset )"
# echo "India;$(export TZ='Asia/Kolkata';date +'%-l:%M %p');unset )"
# echo "Shanghai;$(export TZ='Asia/Shanghai';date +'%-l:%M %p');unset )"

export TZ='America/Los_Angeles'
printf "San Francisco;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='America/Mexico_City'
printf "Cd. de México;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='America/Santiago'
printf "Santiago;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='America/New_York'
printf "New York City;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='America/Sao_Paulo'
printf "São Paulo;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Europe/London'
printf "London;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Europe/Madrid'
printf "Madrid;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Europe/Paris'
printf "Paris;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Europe/Berlin'
printf "Berlin;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Europe/Moscow'
printf "Москва;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Asia/Shanghai'
printf "北京;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Asia/Tokyo'
printf "東京;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"
export TZ='Australia/Sydney'
printf "Sydney;$(date +'%-l:%M %p');$(if [ $(date '+%k') -ge 6 ] && [ $(date '+%k') -le 19 ]; then printf '☀️' ; else printf '🌙'; fi)$(unset TZ)\n"