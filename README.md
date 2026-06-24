# Firewall Auditor Script

This Bash script is an automated security audit designed to monitor listening ports (LISTEN) on the system and ensure that only authorized ports remain open. If it detects an unauthorized port, the script immediately intervenes by closing it via ufw and logging the event in a log file.

Features

- Automatic audit: Identifies listening ports using ss.

- Customizable whitelist: Easily define which ports should stay open.

- Automatic closure: Blocks access to unauthorized ports via ufw.

- Logging: Tracks every closure operation in /var/log/firewall_auditor.log with date and time.
