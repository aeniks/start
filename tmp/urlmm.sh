url="https://www.example.com/path?query=value#fragment"

if [[ "$url" =~ ^(https?|ftp)://([^/:]+)(:[0-9]+)?(.*)$ ]]; then
  protocol="${BASH_REMATCH[1]}"
  domain="${BASH_REMATCH[2]}"
  port="${BASH_REMATCH[3]}"
  path="${BASH_REMATCH[4]}"

  echo "Protocol: $protocol"
  echo "Domain: $domain"
  echo "Port: $port"
  echo "Path: $path"
else
  echo "Invalid URL"
fi
