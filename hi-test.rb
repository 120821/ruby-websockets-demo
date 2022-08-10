require 'net/http'
require 'uri'

req_headers= {
  'Content-Type' => 'text/xml; charset=utf-8',
  'SOAPAction' => '"http://localhost:2000/add#add"',
}

req_body = <<EOF
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <add xmlns="namespace">
      <i>100</i>
      <j>1</j>
    </add>
  </soap:Body>
</soap:Envelope>
EOF

http = Net::HTTP.new('localhost' , 2000)
http.set_debug_output $stdout
res = http.request_post("/add" , req_body , req_headers)
puts res.body
