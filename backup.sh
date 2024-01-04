#!/bin/bash

NOW=$(date '+%Y-%m-%d-%H-%M-%S')
BACKUP="/tmp/backup-$NOW"
BACKUPZIP="/tmp/backup-$NOW.zip"
echo $BACKUP
mkdir $BACKUP
cp -R /etc/apache2 $BACKUP/
cp -R /etc/letsencrypt $BACKUP/
cp -R /var/www $BACKUP/
mkdir $BACKUP/databases
mysqldump --all-databases > $BACKUP/databases/all-databases.sql
zip -r $BACKUPZIP $BACKUP
aws s3 cp $BACKUPZIP s3://<REPLACE_WITH_YOUR_S3_BUCKET_NAME/
rm -rf $BACKUP
rm -rf $BACKUPZIP
