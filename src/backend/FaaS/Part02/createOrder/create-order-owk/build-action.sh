set -e
gradle clean
gradle shadowJar

#########################################
actionName="create-order"
requestMethod="post" 
basePath="/order" 
APIPath="/createOrder"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 --memory 1024 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath $requestMethod $actionName --response-type json -i