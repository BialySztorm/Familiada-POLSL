import os
import sys
import requests

SiteName = "bialysztorm/familiada"


def version():
    f = open(os.path.join(sys.path[0], "Butler-version.txt"),"r")
    currVersion = f.read()
    print("Current version is: ",currVersion,"\n")
    print("[1] - update minor")
    print("[2] - update major")
    print("[3] - update patch")
    print("[0] - don't change\n")
    action = input("Type Option: ")
    if action == '1':
        tmp = currVersion.split('.')
        tmp[0]=str(int(tmp[0])+1)
        currVersion = tmp[0]+".0.0"
    elif action == '2':
        tmp = currVersion.split('.')
        tmp[1]=str(int(tmp[1])+1)
        currVersion = tmp[0]+"."+tmp[1]+".0"
    elif action == '3':
        tmp = currVersion.split('.')
        tmp[2]=str(int(tmp[2])+1)
        currVersion = tmp[0]+"."+tmp[1]+"."+tmp[2]
    elif action != '0':
        return -1
    f.close()
    f = open(os.path.join(sys.path[0], "Butler-version.txt"),"w")
    f.write(currVersion)
    f.close()
    return currVersion

def platform():
    print("Select platform for push build to itch\n")
    print("[1] - Windows")
    print("[2] - Linux")
    print("[3] - Mac")
    print("[0] - Exit")
    action = input("Type Option: ")
    return action

def windows(currVersion):
    os.system("butler.exe push windows "+SiteName+":win --if-changed --userversion "+currVersion)
    # payload = {"content":"Version: "+currVersion+" was pushed to itch on Windows channel"}        
    # requests.post(DiscordHook, data=payload)

def linux(currVersion):  
    os.system("butler.exe push linux "+SiteName+":linux --if-changed --userversion "+currVersion)
    # payload = {"content":"Version: "+currVersion+" was pushed to itch on Linux channel"}        
    # requests.post(DiscordHook, data=payload)

def mac(currVersion):
    os.system("butler push mac "+SiteName+":mac --if-changed --userversion "+currVersion)
    # payload = {"content":"Version: "+currVersion+" was pushed to itch on Mac channel"}        
    # requests.post(DiscordHook, data=payload)

action = platform()
if action == '1':
    windows(version())
elif action == '2':
    linux(version()) 
elif action == '3':
    mac(version())

# print(version())
# TODO and mac
# TODO Loop

wait = input("Press Enter to continue.")