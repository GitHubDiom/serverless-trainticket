set -e
gradle clean
gradle shadowJar

#########################################
actionName="drawback"
requestMethod="get" 
basePath="/order" 
APIPath="/drawback"
param="/{userId}/{money}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i