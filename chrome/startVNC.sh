#!/bin/bash
export CHROME_LOG_FILE=/tmp/log.txt;


if [[ -z "${PROXY_URL}" ]]; then
	google-chrome --no-sandbox --enable-logging --v=1 \
				  --no-first-run \
				  --disable-dev-shm-usage --disable-software-rasterizer --disable-gpu --use-fake-ui-for-media-stream --use-fake-device-for-media-stream --disable-sync \
				  --no-default-browser-check \
				  --ignore-certificate-errors \
				  --ignore-urlfetcher-cert-requests \
#				  --proxy-server="$PROXY_URL" \ 
				  --no-sandbox --kiosk "$PROCESS_URL" \
				  -inkognito
else
	google-chrome --no-sandbox --enable-logging --v=1 \
				  --no-first-run \
				  --disable-dev-shm-usage --disable-software-rasterizer --disable-gpu --use-fake-ui-for-media-stream --use-fake-device-for-media-stream --disable-sync \
				  --no-default-browser-check \
				  --ignore-certificate-errors \
				  --ignore-urlfetcher-cert-requests \
				  --no-sandbox --kiosk "$PROCESS_URL" \
                                  --proxy-server="$PROXY_URL" \
				  -inkognito
fi
