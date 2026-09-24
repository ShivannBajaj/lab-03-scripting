#!/bin/bash
set -euo pipefail

curl -L "https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz" -o lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz

awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv

tr '\t' ',' < cleaned.tsv > cleaned.csv

DATA_ROWS=$(wc -l < cleaned.csv)
DATA_ROWS=$((DATA_ROWS - 1))

echo "$DATA_ROWS"

tar -czf converted-archive.tar.gz cleaned.csv
