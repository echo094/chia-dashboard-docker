#!/usr/bin/env bash

cd /chia-dashboard-core
pm2-runtime start ecosystem.config.js.dist
