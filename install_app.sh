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

mysql -h $db_ip -u $db_username -p${db_password} <<EOF
CREATE TABLE patients ( ID int, FirstName varchar(255), LastName varchar(255), Address varchar(255), Contact varchar(255), MedicalIssue  varchar(255), RegDate varchar(255) );
INSERT INTO patients (ID, FirstName, LastName, Address, Contact, MedicalIssue, RegDate) VALUES ('1', 'abc', 'zxc', 'pune','985241654','Spine','01/01/2021' );
EOF

sed -i "s|${db_ip}|my_host_ip|" index.php
sed -i "s|${db_username}|my_user_name|" index.php
sed -i "s|${db_password}|my_password|" index.php
sed -i "s|${db_name}|my_db_name|" index.php
