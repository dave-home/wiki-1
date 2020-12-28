#!/usr/bin/env bash

for f in "$(dirname "${0}")"/fun/*.sh; do
    # shellcheck disable=SC1090
    source "${f}"
done

PS3='Choose environment: '
options=("Dev" "Prod" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Dev")
            ENV=dev
            break
            ;;
        "Prod")
            ENV=prod
            break
            ;;
        "Quit")
            exit 0
            ;;
        *) echo "invalid option $REPLY";;
    esac
done



# shellcheck disable=SC1090
source "$(dirname "${0}")"/../env/${ENV}/globals.sh

# CHART_LOCATION="$(dirname "${0}")"/../../dev/helm
CHART_LOCATION="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../dev/helm
echo CHART_LOCATION = "${CHART_LOCATION}"

VALUES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../env/${ENV}
echo VALUES_DIR = "${VALUES_DIR}"

PS3='Choose action: '
options=("install" "upgrade" "uninstall" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "install")
            install "${VALUES_DIR}"
            break
            ;;
        "upgrade")
            upgrade "${VALUES_DIR}"
            break
            ;;
        "uninstall")
            uninstall
            break
            ;;
        "Quit")
            exit 0
            ;;
        *) echo "invalid option $REPLY";;
    esac
done