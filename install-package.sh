#!/bin/bash

# Display script usage
usage() {
    echo "Usage: $0 [options] <package-name>"
    echo ""
    echo "Install the given Neovim configuration."
    echo "Note: The package is likely a '.tgz' file."
    echo ""
    echo "Options:"
    echo " [-h, --help]    Print usage"
}

# Install package
install_nvim() {
    local package_name="$1"

    # Extract the package to the home directory
    tar -xzf ${package_name} -C "${HOME}"
    echo "Installed '${package_name}'."
}

# Check if any arguments were provided
if [ $# -eq 0 ]; then
    echo "Error: No arguments provided"
    usage
    exit 1
fi

# Store package name
PACKAGE_NAME=""

# Process options
while [ $# -gt 0 ]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
        *)
            if [ -z "$PACKAGE_NAME" ]; then
                PACKAGE_NAME=$1
            else
                echo "Error: Package name already specified as '$PACKAGE_NAME'"
                usage
                exit 1
fi
            ;;
    esac
    shift
done

# Verify required arguments
if [ -z "$PACKAGE_NAME" ]; then
    echo "Error: Package name is required"
    usage
    exit 1
fi

# Completed option processing and validation
install_nvim "$PACKAGE_NAME"

