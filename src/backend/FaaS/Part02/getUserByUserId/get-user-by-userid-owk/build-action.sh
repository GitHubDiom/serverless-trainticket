set -e
gradle clean
gradle shadowJar

#########################################
actionName="get-user-by-userid"
requestMethod="get" 
basePath="/user" 
APIPath="/getUserByUserId"
param="/{accountId}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 --memory 1024 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i