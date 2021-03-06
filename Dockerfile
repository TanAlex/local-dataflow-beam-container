FROM adoptopenjdk/maven-openjdk8

RUN apt-get -y update && \
    apt-get -y install gcc python2.7 python-dev python-setuptools wget ca-certificates \
       # These are necessary for add-apt-respository
       software-properties-common && \

    # Install Git >2.0.1
    add-apt-repository ppa:git-core/ppa && \
    apt-get -y update && \
    apt-get -y install git && \

    # Setup Google Cloud SDK (latest)
    mkdir -p /builder && \
    wget -qO- https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz | tar zxv -C /builder && \
    CLOUDSDK_PYTHON="python2.7" /builder/google-cloud-sdk/install.sh --usage-reporting=false \
        --bash-completion=false \
        --disable-installation-options && \
    # install crcmod: https://cloud.google.com/storage/docs/gsutil/addlhelp/CRC32CandInstallingcrcmod
    python /usr/lib/python2.7/dist-packages/easy_install.py  -U pip && \
    pip install -U crcmod && \
    apt-get install python3-pip -y -q && \
    pip3 install -U crcmod && \
    pip3 install --upgrade setuptools && \
    pip3 install apache-beam 

    # Clean up
    # apt-get -y remove gcc python-dev python-setuptools wget python3-pip && \
    # rm -rf /var/lib/apt/lists/* && \
    # rm -rf ~/.config/gcloud

ENV PATH=/builder/google-cloud-sdk/bin/:$PATH
# keep it running
CMD tail -f /dev/null