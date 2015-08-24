Dim xmlhttp As New XMLHTTPRequest
    Dim strURL As String
    Dim strFormData As String
    
    strURL = "https://api.idxbroker.com/leads/lead"
    strFormData = ""
    xmlhttp.open "GET", strURL, False
    
    xmlhttp.setRequestHeader "Content-Type", "application/x-www-formurlencoded"
    xmlhttp.setRequestHeader "accesskey", "YOUR ACCESS KEY HERE"
    xmlhttp.send strFormData
    
    response = xmlhttp.responseText
     
    Set xmlhttp = Nothing
