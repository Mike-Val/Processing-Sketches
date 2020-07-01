import random
import sys
sys.path.append("/usr/local/lib/python3.7/site-packages/")
import requests
import nekos

categories = ['feet', 'yuri', 'futanari', 'hololewd', 'lewdkemo', 'solog', 
              'feetg', 'cum', 'erokemo', 'les', 'lewdk', 'ngif', 'tickle', 
              'lewd', 'feed', 'gecg', 'eroyuri', 'eron', 'cum_jpg', 'bj', 
              'solo', 'kemonomimi', 'gasm', 'poke', 'anal', 'slap', 'hentai', 
              'avatar', 'erofeet', 'holo', 'keta', 'blowjob', 'pussy', 'tits', 'holoero', 
              'pussy_jpg', 'pwankg', 'classic', 'kuni', 'waifu', 
              'femdom', 'neko', 'erok', 'fox_girl', 'boobs', 
              'smallboobs', 'ero', 'smug', 'woof']

url = ''
while url.split('.')[-1] not in ['jpg', 'jpeg']:
    url = nekos.img(random.choice(categories))

print(url)
r = requests.get(url, allow_redirects=True)
open(sys.argv[1].strip()+'downloadedImg.jpg', 'wb').write(r.content)