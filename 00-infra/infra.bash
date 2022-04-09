#!/bin/bash

if [ $# -ne "1" ]; then
    echo "Arguments <init|plan|apply|destroy> are required!!!"
    exit 1
fi

OPERATION=$1
terragrunt run-all ${OPERATION}
