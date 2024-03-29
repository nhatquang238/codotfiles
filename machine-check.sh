#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) machine=Linux;;
    Darwin*) machine=Mac;;
    *) machine="UNKNOWN:${unameOut}"
esac

export MACHINE=$machine
