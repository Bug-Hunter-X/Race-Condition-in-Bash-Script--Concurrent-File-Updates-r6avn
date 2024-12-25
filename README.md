# Race Condition in Bash Script
This repository demonstrates a race condition bug in a bash script that involves concurrent file access. Multiple processes try to increment a counter stored in a file, but due to race conditions, the final counter value is often less than the expected value (10).

The `bug.sh` file contains the buggy script, while `bugSolution.sh` provides a solution using a locking mechanism to prevent data loss.