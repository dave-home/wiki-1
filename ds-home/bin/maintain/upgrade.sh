#!/usr/bin/env bash

upgrade(){
  local -r values_dir=$1
  helm upgrade \
    "${RELEASE_NAME}" \
    "${CHART_LOCATION}" \
    -f "${values_dir}"/values.yaml \
    -f <(sops -d "${values_dir}"/secrets.yaml) \
    --namespace "${NAMESPACE}" \
    --dry-run
}
