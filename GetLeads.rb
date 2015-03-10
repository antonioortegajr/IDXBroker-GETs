require "net/https"
require "uri"

#force lowercase as the IDX Broker API is sensitve to case in the request headers.
class Net::HTTP::ImmutableHeaderKey
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def downcase
    self
  end

  def capitalize
    self
  end

  def split(*)
    [self]
  end

  def hash
    key.hash
  end

  def eql?(other)
    key.eql? other.key.eql?
  end
  
  def to_s
    key
  end
end

# make API call

url = 'https://api.idxbroker.com/leads/lead'
api_key = 'YOUR API KEY HERE'

uri = URI.parse(url)
req = Net::HTTP::Get.new(uri.path)
accesskey = Net::HTTP::ImmutableHeaderKey.new("accesskey")
req[accesskey] = api_key
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
resp = http.request(req)

#print out return
puts resp.body
