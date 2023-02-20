gradle clean
gradle shadowJar

#########################################
actionName="get-route-by-routeid"
requestMethod="get" 
basePath="/route" 
APIPath="/getRouteByRouteId"
param="/{routeId}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i