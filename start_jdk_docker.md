# README

This script is just help you start the container that has JDK, maven and gcloud tools


## Build image
If you want to include those, you can run docker build first
It will use the Dockerfile to build the dataflow-beam-sdk
```
docker build -t dataflow-beam-sdk .
```

## Start the container using that image
```
docker run -it --name dataflow-beam-sdk --entrypoint /bin/bash \
-v /Users/tinglitan/_Code/_GCP:/GCP \
-e PROJECT=warm-actor-291222 -e GOOGLE_APPLICATION_CREDENTIALS=/GCP/credentials.json \
dataflow-beam-sdk:latest
```

When you are in the container, use these to setup gcloud auth  

```
echo $PROJECT 
echo $GOOGLE_APPLICATION_CREDENTIALS
gcloud config set project $PROJECT
# the service account name is in the credential Json file too
gcloud auth activate-service-account terraform-automation@warm-actor-291222.iam.gserviceaccount.com \
  --key-file="$GOOGLE_APPLICATION_CREDENTIALS" --project="$PROJECT"
```