set -e
gradle clean
gradle shadowJar

#########################################
actionName="get-traintype-by-traintypeid"
requestMethod="get" 
basePath="/traintype" 
APIPath="/getTrainTypeByTrainTypeId"
param="/{trainTypeId}"
runtime="java:8-io"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind $runtime --web true --timeout 300000 --memory 1024 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i