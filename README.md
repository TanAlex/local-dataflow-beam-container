# README

This shows how to build a docker that can run openjdk-8 and maven with GCP SDK tools

We can use it to develop Dataflow pipeline code and all other Java related projects

```
export BUCKET="kafka-stream-to-bq-dev"
gsutil mb gs://$BUCKET


export PROJECT="$(gcloud config get-value project)"
export DATASET="beam_samples"
export TABLE="kafka_to_bigquery"

bq mk --dataset "$PROJECT:$DATASET"
```

Setup REGION and ZONE

```
# Select your default compute/region, or default to "us-central1".
export REGION=${"$(gcloud config get-value compute/region)":-"us-central1"}

# Select your default compute/zone, or default to "$REGION-a".
# Note that the zone *must* be in $REGION.
export ZONE=${"$(gcloud config get-value compute/zone)":-"$REGION-a"}
```

