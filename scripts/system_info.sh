#!/bin/bash

echo "================================"
echo "       SYSTEM INFORMATION"
echo "================================"

echo "Hostname: $(hostname)"
echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME

echo "CPU Information:"
lscpu | grep "Model name"

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -h

echo "Current Date:"
date

echo "================================"
echo "System Information Completed"
echo "================================"