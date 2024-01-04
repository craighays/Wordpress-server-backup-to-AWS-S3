# Wordpress-server-backup-to-AWS-S3
This script backups up all relevant files on a webserver and copies them to AWS S3 using the AWS CLI

# Installation

## Create an S3 bucket

A standard S3 bucket will work fine. No public access is needed as we'll do everything through the API with API keys locked down to file upload only

## AWS IAM Policy
This policy should be applied to your AWS IAM user. It permits file upload only so anything already backed up cannot be read if your key is compromised.

Replace XXXXXXXXXXXXXXXXXXXXXX with your S3 bucket name

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"s3:PutObject"
			],
			"Resource": "arn:aws:s3:::XXXXXXXXXXXXXXXXXXXXXX/*"
		}
	]
}
```

## AWS CLI

```
apt install awscli
aws configure
```


## Crontab

Assuming you've put this in /backup.sh:
```
crontab -e:

0 1 * * * /bin/bash /backup.sh
```

