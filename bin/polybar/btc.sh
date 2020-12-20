#!/bin/bash
curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python -c "import json, sys; print('',json.load(sys.stdin)['bpi']['USD']['rate'].split('.')[0]+'$')"
