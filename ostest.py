import os
import shutil
path = "C://Users//jrkan//Downloads"
dir_list= os.listdir(path)
file_list = [x for x in dir_list if "." in x]
directories = [x for x in dir_list if "." not in x]
print(file_list)
print(directories)

## python sort

source = r"C:/Users/jrkan/Downloads"
destination = source + "/python"
for i in file_list:
    if '.py' in i:
        newer = shutil.move("C:/Users/jrkan/Downloads","C:/Users/Public")