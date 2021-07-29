#!/bin/bash
###################
# install_app.sh ##
###################
# Script to create test database for PHP app
# Script required DB paramters as input arguments.
#
db_ip="$1"
db_username="$2"
db_password="$3"
db_name="$4"

echo "CREATE TABLE mds.patients ( ID int, FirstName varchar(255), LastName varchar(255), Address varchar(255), Contact varchar(255), MedicalIssue  varchar(255), RegDate varchar(255) );" | mysql -h $db_ip -u $db_username -p${db_password} $db_name
echo "INSERT INTO mds.patients (ID, FirstName, LastName, Address, Contact, MedicalIssue, RegDate) VALUES ('1', 'abc', 'zxc', 'pune', '985241654', 'Spine', '01/01/2021' );" | mysql -h $db_ip -u $db_username -p${db_password} $db_name

sed -i "s|my_host_ip|${db_ip}|" index.php
sed -i "s|my_user_name|${db_username}|" index.php
sed -i "s|my_password|${db_password}|" index.php
sed -i "s|my_db_name|${db_name}|" index.php
