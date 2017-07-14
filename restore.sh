#!/usr/bin/env bash
echo "Create database 'let_them_die', database: Postgres"
echo -n "Username: "
read username
echo -n "Password: "
read -s password
echo
psql -u $username -p $password -c "CREATE DATABASE let_them_die;"
psql let_them_die < db_backup.sql
psql -u $username -p $password -c "CREATE DATABASE let_them_die_test WITH TEMPLATE let_them_die;"