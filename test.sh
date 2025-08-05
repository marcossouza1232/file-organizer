#!/bin/bash

# Step 1: Create the test directory
TEST_DIR="test_files"
mkdir -p "$TEST_DIR"

# Step 2: Create multiple files with various extensions
touch "$TEST_DIR"/example.{py,sh,c,txt,pdf,docx,jpg,jpeg,png,mp3,wav,ogg,flac,aac,m4a,mp4,mkv,avi,webm,mov,wmv}
touch "$TEST_DIR"/fileorganizer.py

# Step 3: Show initial directory contents
echo "🔍 Before organization:"
ls -1 "$TEST_DIR"

# Step 4: Run the file organizer script
echo -e "\n🚀 Running fileorganizer.py..."
python3 fileorganizer.py "$TEST_DIR"

# Step 5: Show organized directory structure
echo -e "\n📂 After organization:"
ls -R "$TEST_DIR"

# Step 6: Remove the test directory
rm -rf "$TEST_DIR"
