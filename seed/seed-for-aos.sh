#!/bin/sh

cd $(dirname $0)

#########################################################################################
# Mint/grant tokens

# Give the Scheduler Location Publisher 1 AR
curl -q http://localhost:4000/mint/UYe164X2V5k_Lm1jqeoDH05OoQ9uDLZ3uFDRg48jUdw/1000000000000
echo
# Give the `aos` Module Publisher 1 AR
curl -q http://localhost:4000/mint/dn01jCzuww0ovcX_3lAOWx5aMCXL02YW0HsqkW0A1P4/1000000000000
echo
# Give the bundler service 1 AR
curl -q http://localhost:4000/mint/StTLAZucZLJdp2MydkCcnytXUKlA2LmK-hD8_opGGWk/1000000000000
echo
# Give the `ao` units 1 AR
curl -q http://localhost:4000/mint/2x64zW6Q5kPPDcsAh9bMnh_4lrXE224IvoHKVdfKOcg/1000000000000
echo

echo "!!!"
echo "!!!"
echo "!!!"
echo "!!! Edit this script to grant tokens to your wallet(s)."
echo "!!!"
echo "!!!"
echo "!!!"

#########################################################################################
# Publish the 'Scheduler-Location' record

echo "publishing scheduler location"
./publish-scheduler-location.mjs
echo "mining"
./mine.mjs

#########################################################################################
# Publish the `aos` Module

echo "publishing aos module"
./publish-aos-module.mjs
echo
echo "copy this   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo
./mine.mjs
