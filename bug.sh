#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file with initial value 0
echo 0 > counter.txt

# Function to increment the counter
increment_counter() {
  # Read current value
  current_value=$(cat counter.txt)
  
  # Increment the value
  new_value=$((current_value + 1))
  
  # Write the new value
  echo $new_value > counter.txt
}

# Run the increment function concurrently
for i in {1..10}; do
  increment_counter &
  sleep 0.1 # Simulate some work
done

wait # Wait for all background processes to finish

# The final value should be 10 but it might be less due to race condition
final_value=$(cat counter.txt)
echo "Final counter value: $final_value"