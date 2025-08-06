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

# Step 6: Move fileorganizer.py back to the test directory and remove the previous copy in scripts
echo "🔄 Moving fileorganizer.py back to $TEST_DIR and removing old copy from scripts..."
cp -r fileorganizer.py "$TEST_DIR"/
rm -rf "$TEST_DIR"/scripts/fileorganizer.py

# Step 7: Show directory structure after restoring the script
echo -e "\n📂 Directory after restoring fileorganizer.py:"
ls -R "$TEST_DIR"

# Step 8: Run the file organizer script again from inside the test directory
echo -e "\n🚀 Running fileorganizer.py (second run)..."
python3 "$TEST_DIR"/fileorganizer.py "$TEST_DIR"

# Step 9: Show final organized directory structure
echo -e "\n📂 After second organization:"
ls -R "$TEST_DIR"

# Step 10
# This step is testing what happens if we create duplicate files with the same names 
# in the original test directory and run the organizer again. The goal is to check whether the script 
# overwrites existing files or handles duplicates safely.
echo -e "\n🧪 Testing duplicate file handling (overwriting prevention)..."

# Creating the same set of files again in the test directory
echo "📄 Creating duplicate files in $TEST_DIR..."
touch "$TEST_DIR"/example.{py,sh,c,txt,pdf,docx,jpg,jpeg,png,mp3,wav,ogg,flac,aac,m4a,mp4,mkv,avi,webm,mov,wmv}

# Running the file organizer again to check behavior
echo "🚀 Running fileorganizer.py again to see how duplicates are handled..."
python3 "$TEST_DIR"/fileorganizer.py "$TEST_DIR"

# Showing the directory structure after the duplicate test
echo -e "\n📂 Directory structure after duplicate file test:"
ls -R "$TEST_DIR"

# Step 11
rm -rf "$TEST_DIR"
