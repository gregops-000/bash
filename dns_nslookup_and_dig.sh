#!/bin/bash

# Specify the domain or zone to check
DOMAIN="example.com"

# Specify the IP address of the DNS server
DNS_SERVER="DNS_SERVER_IP"

# Run the nslookup command to check the DNS server
nslookup -type=ns $DOMAIN $DNS_SERVER

# Check if the exit code of the previous command indicates an error
if [[ $? -ne 0 ]]; then
  echo "There was an issue with the DNS server."
else
  echo "DNS server is responding correctly."
fi

# Run the dig command to check DNS records
dig $DOMAIN @${DNS_SERVER}

# Check if the exit code of the previous command indicates an error
if [[ $? -ne 0 ]]; then
  echo "There was an issue with DNS configuration."
else
  echo "DNS configuration is correct."
fi
