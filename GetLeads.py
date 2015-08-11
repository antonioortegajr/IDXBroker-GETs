import httplib
import urlparse

#this is a sample call to base your API calls off of.
def main(url, headers):
  domain = urlparse.urlparse(url).netloc
  connection = httplib.HTTPSConnection(domain)
  connection.request("GET", url, headers=headers)
  response = connection.getresponse()
  # print the http status code returned. Expecting 200
  print "status: " + str(response.status), response.reason
  #print the response headers
  print response.getheaders()
  #print the response body
  print response.read()

#set endpoint and add your API key
url = "https://api.idxbroker.com/leads/lead"
headers = {"Content-Type":"application/x-www-form-urlencoded", "accesskey":"YourAPIKeyHere"}
#run function
main(url, headers)
