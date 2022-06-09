#!/bin/bash

DATA_SRV=/srv/www/xxx.com/public_html
RES=data
EXT_DATA=ext_data
S3PATH=cdn.XXXX.com/docs/api/

echo -e "\r\n\e[1;33mstart\e[0m generate apidoc..."

docker run --rm -v ${DATA_SRV}:${DATA_SRV} -v ${DATA_SRV}/.apidocs:/home/node/apidoc -v $HOME/.s3cfg:${HOME}/.s3cfg config_apidoc -o ${DATA_SRV}/.apidocs/data -i ${DATA_SRV}/netcat/modules/default/classes/ -i ${DATA_SRV}/netcat/modules/default/API/;

cd ${DATA_SRV}/.apidocs;

cp -f ./${EXT_DATA}/ru.js ./${RES}/locales
cp -f ./${EXT_DATA}/index.html ./${RES}
cp -f ./${EXT_DATA}/main.css ./${RES}/assets
cp -f ./${EXT_DATA}/sheme-integration.png ./${RES}
cp -f ./${EXT_DATA}/docs_orders_sap.zip ./${RES}
cp -f ./${EXT_DATA}/mailchimp.html ./${RES}

echo -e "\e[0;32mfinish\e[0m generate apidoc!"
echo -e "\r\n\e[1;33mstart\e[0m upload to ${S3PATH}"

s3cmd put ./${RES}/ s3://$S3PATH --recursive --human-readable-sizes --no-mime-magic --guess-mime-type --quiet

echo -e "\e[0;32mfinish\e[0m upload to $S3PATH"

yc cdn cache purge --resource-id "bc8wej7j2kj2q7zujsme" --path "/docs/api/*"

echo -e "\e[0;32mclear cache\e[0m on $S3PATH"

rm -rf ./${RES}