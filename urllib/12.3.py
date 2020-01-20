import urllib.request
#import re
from bs4 import BeautifulSoup
html=urllib.request.urlopen('http://py4e-data.dr-chuck.net/comments_330430.html')
soup=BeautifulSoup(html,'html.parser')
tag=soup("span")


sum=0
for i in tag:
	x=int(i.text)
	
	sum = sum + x


		
 
    	

print(sum)

