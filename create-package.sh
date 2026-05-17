#!/bin/bash

# Display script usage
usage() {
    echo "Usage: $0 [options] <package-name>"
    echo ""
    echo "Create an installation package for the current Neovim configuration."
    echo ""
    echo "Options:"
    echo " [-h, --help]    Print usage"
}

# Create installation package
package_nvim() {
    local package_name="$1"

    # Get the home directory path
    HOME_DIR="${HOME}"

    # Define the source directories relative to home
    CONFIG_DIR=".config/nvim"
    DATA_DIR=".local/share/nvim"

    # Create a temporary directory for the backup
    TEMP_DIR=$(mktemp -d)

    # Create the directory structure in the temp directory
    mkdir -p "${TEMP_DIR}/${CONFIG_DIR%/*}"
    mkdir -p "${TEMP_DIR}/${DATA_DIR%/*}"

    # Copy the directories to the temp location
    cp -r "${HOME_DIR}/${CONFIG_DIR}" "${TEMP_DIR}/${CONFIG_DIR%/*}/"
    cp -r "${HOME_DIR}/${DATA_DIR}" "${TEMP_DIR}/${DATA_DIR%/*}/"

    # Create the tar file
    tar -czvf "${package_name}.tgz" -C "${TEMP_DIR}" .config .local

    # Clean up
    rm -rf "${TEMP_DIR}"

    echo "Created '${package_name}'."
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
package_nvim "$PACKAGE_NAME"

