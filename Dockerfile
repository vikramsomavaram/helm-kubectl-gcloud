FROM google/cloud-sdk:228.0.0-alpine

LABEL Maintainer = "Vikram Somavaram"

ENV HELM_VERSION v3.0.2

RUN gcloud components install kubectl

# install helm
RUN apk update && apk add ca-certificates gnupg openssl \
    && rm -rf /var/cache/apk/* \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh \
    && rm get_helm.sh

# add stable helm repo
RUN helm repo add stable https://kubernetes-charts.storage.googleapis.com