from subprocess import Popen, PIPE, check_call
import string
from random import *
import re

characters = string.ascii_letters + string.digits
with open("users.txt", "r") as f:
    user_list = f.read()
    formatusers = re.findall("\S+", user_list)
    print(formatusers)

for user in formatusers:
    password =  "".join(choice(characters) for x in range(10))
    proc=Popen(['passwd', user],stdin=PIPE,stdout=PIPE,stderr=PIPE)
    proc.stdin.write(password)
    proc.stdin.write('\n')
    proc.stdin.write(password)
    proc.stdin.flush()
    stdout,stderr = proc.communicate()
    print stdout
    print stderr
    print ("{user} , {password}".format(user=user,password=password))
    with open("newpass.txt", "a+") as newPass:
        newPass.write("{user} , {password}\n".format(user=user,password=password))