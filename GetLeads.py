import httplib
import urlparse

url = "https://api.idxbroker.com/leads/lead"
headers = {"Content-Type":"application/x-www-form-urlencoded", "accesskey":"YourAPIKeyHere"}

domain = urlparse.urlparse(url).netloc
connection = httplib.HTTPSConnection(domain)
connection.request("GET", url, headers=headers)
response = connection.getresponse()

print "status: " + str(response.status), response.reason
print response.getheaders()
print response.read()
