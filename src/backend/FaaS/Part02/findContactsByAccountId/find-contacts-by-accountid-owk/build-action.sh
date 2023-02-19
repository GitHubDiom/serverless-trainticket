gradle clean
gradle shadowJar

#########################################
actionName="find-contacts-by-accountid"
requestMethod="get" 
basePath="/contacts" 
APIPath="/findContactsByAccountId"
param="/{accountId}"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create $basePath $APIPath$param $requestMethod $actionName --response-type http -i