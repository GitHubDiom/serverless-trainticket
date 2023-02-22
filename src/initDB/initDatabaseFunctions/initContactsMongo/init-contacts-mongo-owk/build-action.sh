set -e
gradle clean
gradle shadowJar

#########################################
actionName="init-contacts-mongo"
requestMethod="post" 
basePath="/initDB" 
APIPath="/initContactsMongo"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath $requestMethod $actionName --response-type json -i