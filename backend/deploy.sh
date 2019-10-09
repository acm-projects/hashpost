#!/usr/bin/env sh

gcloud functions deploy posts --runtime python37 --trigger-http
gcloud functions deploy auth --runtime python37 --trigger-http