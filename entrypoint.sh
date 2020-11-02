#!/bin/bash

set -o pipefail

echo "dbt project folder set as: \"${INPUT_DBT_PROJECT_FOLDER}\""
cd ${INPUT_DBT_PROJECT_FOLDER}


if [ -n "${DBT_BIGQUERY_TOKEN}" ] 
then
 echo ${DBT_BIGQUERY_TOKEN} | base64 -d > ./creds.json
fi

if [ -n "${DBT_SNOWFLAKE_KEY}" ] 
then
 echo ${DBT_SNOWFLAKE_KEY} > .dbt-key
fi

if [ -n "${DBT_USER}" ] && [ -n "$DBT_PASSWORD" ]
then
 sed -i "s/_user_/${DBT_USER}/g" ./profiles.yml
 sed -i "s/_password_/${DBT_PASSWORD}/g" ./profiles.yml
fi
$1