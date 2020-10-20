

# this is the maven-openjdk8, if you don't need gcloud and any other stuff
# docker run -it --rm --name maven_jdk --entrypoint /bin/bash \
# -v /Users/tinglitan/_Code/_GCP:/GCP \
# -e PROJECT=warm-actor-291222 -e GOOGLE_APPLICATION_CREDENTIALS=/GCP/credentials.json \
# adoptopenjdk/maven-openjdk8:latest

# if you want to include those, you can run docker build first
# it will use the Dockerfile to build the dataflow-beam-sdk
# docker build -t dataflow-beam-sdk .

# this is to start the image
docker run -it --name dataflow-beam-sdk --entrypoint /bin/bash \
-v /Users/tinglitan/_Code/_GCP:/GCP \
-e PROJECT=warm-actor-291222 -e GOOGLE_APPLICATION_CREDENTIALS=/GCP/credentials.json \
dataflow-beam-sdk:latest

# When you are in the container, 
# Use these to setup gcloud auth
# echo $PROJECT $GOOGLE_APPLICATION_CREDENTIALS
# gcloud config set project $PROJECT
# gcloud auth activate-service-account terraform-automation@warm-actor-291222.iam.gserviceaccount.com \
#   --key-file="$GOOGLE_APPLICATION_CREDENTIALS" --project="$PROJECT"