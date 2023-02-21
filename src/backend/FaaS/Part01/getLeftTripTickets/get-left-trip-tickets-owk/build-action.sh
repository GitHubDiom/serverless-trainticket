set -e
gradle clean
gradle shadowJar
#########################################
actionName="get-left-trip-tickets"
requestMethod="post" 
basePath="/tickets" 
APIPath="/getLeftTripTickets"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create /tickets  /getLeftTripTickets post $actionName --response-type json -i