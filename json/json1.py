

import json
import urllib.request,urllib.parse,urllib.error

count = 0
sum = 0
url = input("http://py4e-data.dr-chuck.net/comments_42.json")

data = urllib.request.urlopen(url).read()

print (data)

info = json.loads(str(data))

for i in info['comments']:
    count = count+1
    sum = sum + i['count']
print ("Sum : ",sum)   
print ("count : ",count)
   