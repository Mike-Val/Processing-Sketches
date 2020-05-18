import sys
sys.path.append("/usr/local/lib/python3.7/site-packages/")
import requests

url = sys.stdin.readline().strip()
print(url)
fileType = url.split('/')[-1].split('.')[-1]
r = requests.get(url, allow_redirects=True)
open(sys.stdin.readline().strip()+'downloadedImg.jpg', 'wb').write(r.content)