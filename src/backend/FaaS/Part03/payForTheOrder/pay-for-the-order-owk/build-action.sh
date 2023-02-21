set -e
gradle clean
gradle shadowJar

#########################################
actionName="pay-for-the-order"
requestMethod="post" 
basePath="/orders" 
APIPath="/payForTheOrder"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath $requestMethod $actionName --response-type json -i