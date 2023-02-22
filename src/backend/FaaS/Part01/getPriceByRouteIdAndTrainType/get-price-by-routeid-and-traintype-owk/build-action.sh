set -e
gradle clean
gradle shadowJar

#########################################
actionName="get-price-by-routeid-and-traintype"
requestMethod="get" 
basePath="/price" 
APIPath="/getPriceByRouteIdAndTrainType"
params="/{routeId}/{trainType}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$params $requestMethod $actionName --response-type http -i