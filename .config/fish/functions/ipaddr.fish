function ipaddr
  curl -s ipinfo.io | jq ".ip"
end
