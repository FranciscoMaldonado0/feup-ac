#!/bin/sh

rm database/final.db

cat database/final.sql | sqlite3 database/final.db