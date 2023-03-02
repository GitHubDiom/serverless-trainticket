set -e
gradle clean
gradle shadowJar

#########################################
actionName="query-for-travel"
requestMethod="post" 
basePath="/travel" 
APIPath="/queryForTravel"
runtime="java:8-io"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind $runtime --web true --timeout 300000 --memory 1024 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath $requestMethod $actionName --response-type json -i