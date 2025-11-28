#!/usr/bin/env bash

# Exit on error
set -e

echo "=== Building and testing Bitcoin ==="

# Clean and build main project
echo "Step 1: Building main project..."
sudo rm -rf build
clear
cmake -B build
cmake --build build -j "$(nproc)"

# Run unit tests
echo "Step 2: Running unit tests..."
build/bin/test_bitcoin

# Run functional tests
echo "Step 3: Running functional tests..."
build/test/functional/test_runner.py -j "$(nproc)"

# Build fuzzer
echo "Step 4: Building fuzzer..."
sudo rm -rf build_fuzz
cmake --preset=libfuzzer
cmake --build build_fuzz

# Run lint tests
echo "Step 5: Running lint tests..."
cd test/lint/test_runner/
COMMIT_RANGE='HEAD~1..HEAD' RUST_BACKTRACE=1 cargo run
cd ../../..

# Format code
echo "Step 6: Formatting code..."
git diff -U0 HEAD~1.. | ./contrib/devtools/clang-format-diff.py -p1 -i -v

echo "=== All steps completed successfully ==="
