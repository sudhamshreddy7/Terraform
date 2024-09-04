#!/bin/bash

# Sync S3 bucket with local directory
aws s3 sync s3://sudhamsh8acb86208fa4e7fb /mnt/s3bucket/ --delete