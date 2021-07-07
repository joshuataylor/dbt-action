ARG DBT_VERSION=0.20.0rc2
FROM fishtownanalytics/dbt:${DBT_VERSION}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
