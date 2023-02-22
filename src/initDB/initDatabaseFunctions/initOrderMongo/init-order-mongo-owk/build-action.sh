set -e
gradle clean
gradle shadowJar

#########################################
actionName="init-order-mongo"
requestMethod="post" 
basePath="/initDB" 
APIPath="/initOrderMongo"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath $requestMethod $actionName --response-type json -i