#!/bin/bash

MAKEFLAGS="-j$(nproc)"
sudo rm -rf work
sudo mkarchiso -v profile
