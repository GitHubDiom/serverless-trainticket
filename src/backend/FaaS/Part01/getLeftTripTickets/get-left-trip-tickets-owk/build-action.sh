gradle clean
gradle shadowJar
#########################################
actionName="get-left-trip-tickets"
requestMethod="post" 
basePath="/tickets" 
APIPath="/getLeftTripTickets"
#########################################
echo $(wsk action get $actionName --url -i)
wsk api create /tickets  /getLeftTripTickets post $actionName --response-type json -i