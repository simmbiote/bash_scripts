#!/usr/bin/env bash

# Get a date stamp
now=`date +%Y%m%d-%H%M%S`

# Get number of files in directory.
numberOfFiles=`ls -l /var/backups/project_name/mysql/ | grep -v ^d | wc -l`
filename="/var/backups/project_name/mysql/db_name.$numberOfFiles-$now.sql.gz"

# Export the database. Authentication using ~/.my.cny file.
mysqldump database_name | gzip > $filename

echo "Exported as $filename"

# Use SSH keys authentication.
rsync -e 'ssh -p 22' -avzp /var/backups/project_name/mysql user@remote_ip_address:/home/user/project_name/_backups

echo "Sent backups to backup server."

