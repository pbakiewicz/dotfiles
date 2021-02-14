#!/bin/bash
set -u

currency=$1

if [ ${currency} = "BTC" ]; then
				icon=
else
				icon=
fi
				
api_url="https://min-api.cryptocompare.com/data/price?fsym=${currency}&tsyms=USD"


curl -s ${api_url} | python -c "import json, sys; result=json.load(sys.stdin); print('${icon}', f'{result[\"USD\"]:,.0f}' + '$')"
