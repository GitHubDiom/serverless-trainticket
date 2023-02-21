set -e
gradle clean
gradle shadowJar

#########################################
actionName="get-sold-tickets"
requestMethod="post" 
basePath="/ticket" 
APIPath="/getSoldTickets"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type json -i