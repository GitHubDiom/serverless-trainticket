gradle clean
gradle shadowJar

#########################################
actionName="get-traintype-by-traintypeid"
requestMethod="get" 
basePath="/traintype" 
APIPath="/getTrainTypeByTrainTypeId"
param="/{trainTypeId}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i