#!/bin/bash
mkdir -p dump
docker network create app-network 2>/dev/null || true
docker-compose up -d