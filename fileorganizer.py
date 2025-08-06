#!/usr/bin/env python3
from sys import argv
from os import scandir, mkdir, rename

def check_overwrite(directory, file_type, f):
    try:
        a = open(directory + "/" + file_type + "/" + f, 'r')
    except FileNotFoundError:
        return True
    return False

def move_file(directory,file_type,f):
    overwrite = check_overwrite(directory, file_type,f)
    if overwrite:
        rename(directory + "/" + f, directory + "/" + file_type + "/" + f)
    else:
        print("{0} already exists - not overwriting.".format(f))
#main

if len(argv) != 2:
    directory = input("Enter the name of the directory to organize: ")
else:
    directory = argv[1]

files = []

scandir_result = scandir(directory)

for direntry in scandir_result:
    if direntry.is_file():
        name = direntry.name
        if not ( ( argv[0][2:] == directory + "/" + name)  or ( argv[0] == directory + "/" + name ) ): # This line filters out the script that initiated the execuction.
            files.append(name)

extensions = {'scripts': ['.py', '.sh', '.c'], 'docs': ['.txt', '.pdf', '.docx'], 'images' : ['.jpg', '.jpeg', '.png'], 'others': []}

for file_type in extensions:
    try:
        mkdir(directory + "/" + file_type)
    except FileExistsError:
        print("Directory '{0}' already exists - skipping creation".format(file_type))

for f in files:
    achou = False
    for file_type in extensions:
        for extension in extensions[file_type]:
            if f.endswith(extension):
                move_file(directory, file_type,f)
                achou = True
                break
        if achou:
            break
    if not achou:
        move_file(directory, "others", f)

print("The directory has been successfuly organized")
