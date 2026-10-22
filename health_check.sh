#!/usr/bin/env bash
set -euo pipefail
CPU_THRESHOLD=${CPU_THRESHOLD:-85}
MEM_THRESHOLD=${MEM_THRESHOLD:-85}
DISK_THRESHOLD=${DISK_THRESHOLD:-85}
CPU_USAGE=$(LC_ALL=C top -bn2 -d 0.2 | grep 'Cpu(s)' | tail -1 | awk '{print int(100-$8)}')
MEM_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2*100}')
DISK_USAGE=$(df -P / | awk 'NR==2 {gsub(/%/,"",$5); print $5}')
printf 'Linux health check: %s\nCPU: %s%% | Memory: %s%% | Root disk: %s%%\n' "$(date -Is)" "$CPU_USAGE" "$MEM_USAGE" "$DISK_USAGE"
status=0
for metric in CPU MEM DISK; do
  usage_var="${metric}_USAGE"; threshold_var="${metric}_THRESHOLD"
  if (( ${!usage_var} >= ${!threshold_var} )); then
    printf 'WARNING: %s usage is at or above %s%%\n' "$metric" "${!threshold_var}"
    status=1
  fi
done
exit "$status"
