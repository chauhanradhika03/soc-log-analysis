#!/bin/bash

echo "Failed SSH login attempts"
sudo journalctl -u ssh | grep "Failed"

echo "Total failed attempts"
sudo journalctl -u ssh | grep "Failed" | wc -l

echo "Attacker IPs"
sudo journalctl -u ssh | grep "Failed" | awk '{print $(NF-3)}'

echo "Top attacking IPs"
sudo journalctl -u ssh | grep "Failed" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr
