#!/bin/bash
if [[ -z "${PROXY_URL}" ]]; then
	google-chrome --no-sandbox \
				  --no-first-run \
				  --no-default-browser-check \
				  --ignore-certificate-errors \
				  --ignore-urlfetcher-cert-requests \
				  --proxy-server="$PROXY_URL" \ 
				  --no-sandbox --kiosk "$PROCESS_URL" \
				  -inkognito
else
	google-chrome --no-sandbox \
				  --no-first-run \
				  --no-default-browser-check \
				  --ignore-certificate-errors \
				  --ignore-urlfetcher-cert-requests \
				  --no-sandbox --kiosk "$PROCESS_URL" \
				  -inkognito
fi