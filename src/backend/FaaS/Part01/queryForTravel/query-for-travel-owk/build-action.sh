set -e
gradle clean
gradle shadowJar

#########################################
actionName="query-for-travel"
requestMethod="post" 
basePath="/travel" 
APIPath="/queryForTravel"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true --timeout 300000 # timeout 300s
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath $requestMethod $actionName --response-type json -i