#!/bin/bash

set -e

mkdir -p build/release

cd build/release

echo "Configuring CMake for Release build..."
cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=clang

echo "Building project..."
cmake --build . --config Release

echo "Build completed successfully!"

EXECUTABLE=$(find . -type f -executable -name "main" | head -1)

if [ -n "$EXECUTABLE" ]; then
    echo "OK"
else
    echo "Error: Failed to build"
    exit 1
fi
