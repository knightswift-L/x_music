 extension UrlString on String{
  String toHttps(){
    if(startsWith("https://")){
      return this;
    }
    return replaceAll("http://", "https://");
  }
}