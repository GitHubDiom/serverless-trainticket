set -e
gradle clean
gradle shadowJar

#########################################
actionName="cancel-ticket"
requestMethod="get" 
basePath="/ticket" 
APIPath="/cancleTicket"
param="/{orderId}/{loginId}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i