import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup
import ssl

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

#url = "http://py4e-data.dr-chuck.net/known_by_Talise.html"
url = input('Enter URL: ')
html = urllib.request.urlopen(url, context=ctx).read()
soup = BeautifulSoup(html, 'html.parser')

count= int(input("Enter Count: "))
position = int(input("Enter Position: "))

tags = soup('a')

x=0
while x < count :
    print("Process round", count)
    htmlTag = tags[position - 1]
    print("htmlTag:", htmlTag)
    url = htmlTag.get('href', None)
    print("Current url", url)
    html = urllib.request.urlopen(url).read()
    soup = BeautifulSoup(html, 'html.parser')
    tags = soup('a')
    x = x + 1