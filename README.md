# 23aifeaturelab

Create a VM

1. create a build.zip: zip build -r *
2. scp build.zip opc@ip
3. ssh opc@ip
4. mkdir compose2cloud
5. mv build.zip compose2cloud/
6. unzip build.zip
7. mv inst.sh ~/.

8. ./inst.sh