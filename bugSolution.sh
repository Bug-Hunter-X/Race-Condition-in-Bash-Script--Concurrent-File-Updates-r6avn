#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

# Create a file with initial value 0
echo 0 > counter.txt

# Function to increment the counter
increment_counter() {
  # Acquire lock
  flock -n 200 || exit 1

  # Read current value
  current_value=$(cat counter.txt)
  
  # Increment the value
  new_value=$((current_value + 1))
  
  # Write the new value
  echo $new_value > counter.txt

  # Release lock
  flock -u 200
}

# Run the increment function concurrently
for i in {1..10}; do
  increment_counter &
done

wait # Wait for all background processes to finish

# The final value should now be 10
final_value=$(cat counter.txt)
echo "Final counter value: $final_value"