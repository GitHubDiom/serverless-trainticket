set -e
gradle clean
gradle shadowJar

#########################################
actionName="query-config-entity-by-config-name"
requestMethod="get" 
basePath="/configEntity" 
APIPath="/queryConfigEntityByConfigName"
param="/{configName}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i