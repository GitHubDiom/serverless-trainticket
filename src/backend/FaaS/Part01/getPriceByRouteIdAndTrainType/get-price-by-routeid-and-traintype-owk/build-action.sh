set -e
gradle clean
gradle shadowJar

#########################################
actionName="get-price-by-routeid-and-traintype"
requestMethod="get" 
basePath="/price" 
APIPath="/getPriceByRouteIdAndTrainType"
params="/{routeId}/{trainType}"
runtime="java:8-io"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind $runtime --web true --timeout 300000 --memory 1024 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$params $requestMethod $actionName --response-type http -i