#!/bin/bash

cd $1 || exit
distrobox assemble create --replace
