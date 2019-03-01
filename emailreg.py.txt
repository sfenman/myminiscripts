import re

def main():
    with open("emails.txt", "r") as sampleEmails:
        contents = sampleEmails.read()
        formatEmails = re.findall("\S+", contents)
    for i in range(0, len(formatEmails)-1, 2):
        with open("da_email.txt", "a") as emailConf:
            emailConf.write('Copy "{email}" "{password}" "{email}" "{password}"\n'.format(email = formatEmails[i], password = formatEmails[i+1]))

  
if __name__ == "__main__":
    main()