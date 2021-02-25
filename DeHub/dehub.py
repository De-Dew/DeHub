import os
import subprocess
import getpass
from datetime import date

user = getpass.getuser()
day = date.today()

'''
What you need to do:

home base function - Working, Incomplete
backup function - Not done
journals function - Working, Done
Operations function - Not Done
'''

def create_journal():
    os.system("clear")
    j = os.listdir()

    crtinput = input("| Enter Desired Name: ")

    if crtinput in j:
        print("Name already exists, enter a new name")
        input()
        create_journal()

    else:
        os.system("nano " + crtinput)
        journals()

def journals():
    os.chdir("/home/" + user + "/Dehub/Journals")
    os.system("clear")
    jo = os.listdir()
    print("---------------Journals--------------------")
    os.system("ls *.txt")
    print("-------------------------------------------")
    print("| Commands:")
    print("| Type the file name in full modify it")
    print("| Press [x] to create new Journal")
    print("| Press [h] to return to Home Base")
    print("")
    jrnimp = input("| Enter Input: ")

    if (jrnimp == str("h")):
        home_base()

    if (jrnimp == str("x")):
        create_journal()

    if jrnimp in jo:
        os.system("nano " + jrnimp)
        journals()
    else:
        print("*Input error try again*")
        input()
        journals()




def home_base():
    os.chdir("/home/" + user + "/Dehub")
    os.system("clear")
    print("---------------Home Base-------------------")
    os.system("cat rmks.txt")
    print("-------------------------------------------")
    print("| Author: GurbBerd")
    print("| Welcome: " + str(user))
    print("| Today is: " + str(day))
    print("-------------------------------------------")
    print("* What would you like to do?")
    print("| Press [x] to change Remarks ")
    print("| Press [1] to View Journals")
    print("| Press [2] to open Atom Text Editor")
    print("| Press [3] to Inizialize backup Script")
    homeimp = input("Select an option: ")

    if (homeimp == str("x")):
        os.system("nano rmks.txt")
        home_base()

    if (homeimp == str("1")):
        journals()

    if (homeimp == str("2")):
        os.system("atom")
        home_base()

    if (homeimp == str("3")):
        subprocess.call("./backup.sh")
        home_base()

if __name__ == '__main__':
    home_base()
