set -e
gradle clean
gradle shadowJar
#########################################
actionName="get-left-trip-tickets"
requestMethod="post" 
basePath="/tickets" 
APIPath="/getLeftTripTickets"
runtime="java:8-io"
#########################################

wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind $runtime --web true
echo $(wsk action get $actionName --url -i)
wsk api create /tickets  /getLeftTripTickets post $actionName --response-type json -i