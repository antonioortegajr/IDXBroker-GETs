package main

//based on http://golang-basic.blogspot.com/2014/06/curl-in-golang-go-curl.html

import (
    "fmt"
     curlCmd "github.com/golang-basic/go-curl"
)

func main() {

 easy := curlCmd.EasyInit()
 defer easy.Cleanup()

 easy.Setopt(curlCmd.OPT_URL, "https://api.idxbroker.com/leads/lead")
 easy.Setopt(curlCmd.OPT_HTTPHEADER, []string{"Content-Type: application/x-www-form-urlencoded", "accesskey: YOURAPIKEYHERE"})
 easy.Setopt(curlCmd.OPT_CUSTOMREQUEST, "GET")
  fooTest := func (buf []byte, userdata interface{}) bool {
      println("DEBUG: size=>", len(buf))
      println("DEBUG: content=>", string(buf))

      return true
  }

  easy.Setopt(curlCmd.OPT_WRITEFUNCTION, fooTest)
  if err := easy.Perform(); err != nil {
      fmt.Printf("ERROR: %v\n", err)
  }

}
