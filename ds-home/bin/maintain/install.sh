#!/usr/bin/env bash

install(){
  local -r values_dir=$1
  helm install \
    "${RELEASE_NAME}" \
    "${CHART_LOCATION}" \
    -f "${values_dir}"/values.yaml \
    -f <(sops -d "${values_dir}"/secrets.yaml) \
    --namespace "${NAMESPACE}" \
    --create-namespace
}
