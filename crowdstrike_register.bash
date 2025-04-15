#!/bin/bash

# Install the Falcon sensor using falconctl with the provided CID
#/Applications/Falcon.app/Contents/Resources/falconctl license '$4' -v
#/Applications/Falcon.app/Contents/Resources/falconctl enable-module EndpointSecurity

 License the sensor
if /Applications/Falcon.app/Contents/Resources/falconctl license '<add license number here>'; then
  echo "Falcon sensor licensed successfully"

  # Enable Endpoint Security extension

else
  echo "Falcon sensor licensing failed!"
  exit 1
fi
