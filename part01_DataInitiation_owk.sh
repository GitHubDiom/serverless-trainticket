set -e
echo "Part01 Data Initiation"

wsk -i action invoke -r /guest/init-security-mongo
wsk -i action invoke -r /guest/init-inside-payment-mongo
wsk -i action invoke -r /guest/init-price-mongo
wsk -i action invoke -r /guest/init-order-mongo
wsk -i action invoke -r /guest/init-station-mongo
wsk -i action invoke -r /guest/init-payment-mongo
wsk -i action invoke -r /guest/init-travel-mongo
wsk -i action invoke -r /guest/init-config-mongo
wsk -i action invoke -r /guest/init-user-mongo
wsk -i action invoke -r /guest/init-train-mongo
wsk -i action invoke -r /guest/init-auth-mongo
wsk -i action invoke -r /guest/init-route-mongo-owk
wsk -i action invoke -r /guest/init-contacts-mongo
echo "Done"
