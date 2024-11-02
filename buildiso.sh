#!/bin/bash

MAKEFLAGS="-j$(nproc)"
sudo mkarchiso -v profile
