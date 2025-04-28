load-wordlist ()
{
  local wordlist_file="$1"
  local wordlist_name="$2"
  local wordlist_path="$3"

  if [ -z "$wordlist_file" ] || [ -z "$wordlist_name" ] || [ -z "$wordlist_path" ]; then
    echo "Usage: load-wordlist <wordlist_file> <wordlist_name> <wordlist_path>"
    return 1
  fi

  if [ ! -f "$wordlist_file" ]; then
    echo "Error: Wordlist file '$wordlist_file' not found."
    return 1
  fi

  # Load the wordlist into the specified path
  cp "$wordlist_file" "$wordlist_path/$wordlist_name"
}

load-wordlist
