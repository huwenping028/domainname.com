
library(RYoudaoTranslate)
##  有道翻译函数
##http://fanyi.youdao.com/openapi.do?keyfrom=fy1991--421fy&key=282671603&type=data&doctype=json&version=1.1&q=

youdaoUrl <- function(word){
  paste("http://fanyi.youdao.com/openapi.do?keyfrom=fy1991--421fy&key=282671603&type=data&doctype=json&version=1.1&q=", word, sep = "")
}

youdaoTranslate <- function(word){
  url = getURL(youdaoUrl(word))
  obj = fromJSON(url)
  result = paste0(obj$web[[1]]$value, collapse=";")
  return(result)
}

# 
# word <- "father"
# youdaoTranslate("father")
