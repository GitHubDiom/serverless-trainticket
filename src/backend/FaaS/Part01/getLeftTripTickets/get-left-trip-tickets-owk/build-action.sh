gradle clean
gradle shadowJar
actionName="get-left-trip-tickets"
wsk -i action update $actionName ./build/libs/function.jar --main Handler --kind java:8 --web true
echo $(wsk action get $actionName --url -i)
wsk api create /tickets  /getLeftTripTickets post $actionName --response-type json -i