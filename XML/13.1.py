import urllib

import xml.etree.ElementTree as ET


data = urllib.urlopen("http://py4e-data.dr-chuck.net/known_by_Talise.html").read()



tree = ET.fromstring(data)
results=tree.findall('comments/comment')
count=0
sum=0
for item in results:
    x = int(item.find('count').text)
    count =count+1
    sum = sum+x

print ("Count : ",count)
print ("Sum : ",sum)





