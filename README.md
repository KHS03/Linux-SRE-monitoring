# Linux Server Health Monitoring — SRE Portfolio Project

A beginner-friendly Linux monitoring script for an Ubuntu VM (VirtualBox or WSL). It reports CPU, memory, and root-disk utilization and exits with a nonzero code when a configured threshold is reached.

## Quick start
```bash
chmod +x scripts/health_check.sh
./scripts/health_check.sh
```

Override thresholds to test alerts:
```bash
CPU_THRESHOLD=1 MEM_THRESHOLD=1 DISK_THRESHOLD=1 ./scripts/health_check.sh
```

## Schedule every five minutes (optional)
Run `crontab -e` and add (replace `/home/ubuntu/linux-sre-monitoring` with the real absolute folder path):
```cron
*/5 * * * * /home/ubuntu/linux-sre-monitoring/scripts/health_check.sh >> /home/ubuntu/health-check.log 2>&1
```

## Interview demonstration
1. Explain why CPU, RAM and disk utilization matter to uptime.
2. Run the script on Ubuntu and explain the thresholds and exit status.
3. Set thresholds low to trigger warnings and show how to investigate with `top`, `free -h`, and `df -h`.
4. Describe how cron runs checks and logs the output.

## Limitations and next improvements
This is a learning lab, not production-grade monitoring. CPU sampling is approximate, no network checks or alert notifications are implemented, and cron paths must be customized. Next steps: systemd service, structured logs, and Prometheus metrics.

## GitHub upload
Create a new repository on GitHub named `linux-sre-monitoring`. From inside the extracted project folder:
```bash
git init
git add .
git commit -m "Add Linux server health monitoring lab"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/linux-sre-monitoring.git
git push -u origin main
```
Replace `YOUR_USERNAME` with your actual GitHub username. GitHub authentication may be required.
