# Troubleshooting runbook

## High CPU
Run `top` or `ps aux --sort=-%cpu | head` to identify heavy processes. Check service logs before making changes.

## High memory
Run `free -h` and `ps aux --sort=-%mem | head`. Check for unexpected growth and application errors.

## High disk usage
Run `df -h` and `sudo du -xh /var/log | sort -h | tail`. Review old logs safely; do not delete files without understanding their purpose.

## Incident notes template
- Symptom and time observed:
- Business impact:
- Evidence and commands:
- Root cause (if known):
- Resolution:
- Preventive action:
