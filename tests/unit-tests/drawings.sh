load-drawings()
{
    local drawings_file="$1"
    local drawings_name="$2"
    local drawings_path="$3"
    
    if [ -z "$drawings_file" ] || [ -z "$drawings_name" ] || [ -z "$drawings_path" ]; then
        echo "Usage: load-drawings <drawings_file> <drawings_name> <drawings_path>"
        return 1
    fi
    
    if [ ! -f "$drawings_file" ]; then
        echo "Error: Drawings file '$drawings_file' not found."
        return 1
    fi
    
    # Load the drawings into the specified path
    cp "$drawings_file" "$drawings_path/$drawings_name"
}