#!/usr/bin/env bash

uninstall(){
while true; do
  read -r -p "Do you wish to uninstall [${RELEASE_NAME}] from namespace [${NAMESPACE}] - [y/n]? " yn
  case $yn in
    [Yy]* )
      helm uninstall "${RELEASE_NAME}" --namespace "${NAMESPACE}"
      break
      ;;
    [Nn]* )
      return 0
      ;;
    * )
       echo "Please answer yes or no."
       ;;
    esac
done

}