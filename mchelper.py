# script to setup minecraft server using paper
from sys import argv
from json import loads
import pycurl
from io import BytesIO

project = argv[1]
version = argv[2]
baseurl = f"https://papermc.io/api/v2/projects/{project}/versions/{version}"

def curl(url):
    data = BytesIO()
    c = pycurl.Curl()
    c.setopt(c.URL, url)
    c.setopt(c.WRITEDATA, data)
    c.perform()
    c.close()

    data = data.getvalue().decode("utf8")
    return data


vinfo = curl(baseurl)
vjson = loads(vinfo)
build = vjson["builds"][-1]
dwnld = f"{project}-{version}-{build}.jar"

f = open("url.txt", "x")
f.write(f"{baseurl}/builds/{build}/downloads/{dwnld}")
f.close()