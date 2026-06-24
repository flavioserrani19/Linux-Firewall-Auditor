#!/bin/bash
allowed_ports=(22 80)
echo "--- Starting Firewall Auditing ---"
open_ports=$(ss -tulpn | grep LISTEN | awk '{print $5}' | cut -d':' -f2 | sort -u)
for port in $open_ports; do
  is_allowed="false"
  for allowed in "${allowed_ports[@]}"; do
    if [ "$port" == "$allowed" ]; then
      is_allowed="true"
    fi
  done
  if [ "$is_allowed" == "false" ]; then
    echo "[!] UNAUTHORIZED PORT: $port. Closing..."
    sudo ufw deny "$port"
    echo "$(date): Closed port $port" >> /var/log/firewall_auditor.log
  else
    echo "[OK] Port $port is authorized."
  fi
done
echo "--- Auditing Completed ---"