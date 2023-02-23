kubectl patch pvc ts-station-mongo-pvc  -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-config-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-order-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-price-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-route-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-security-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-train-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-travel-mongo-pvc -p '{"metadata":{"finalizers":null}}'
kubectl patch pvc ts-contacts-mongo-pvc -p '{"metadata":{"finalizers":null}}'

cd ../deployment/Part01-database
kubectl delete -f ts-serverless-database-deployment.yml

# kubectl delete pvc ts-station-mongo-pvc  
# kubectl delete pvc ts-config-mongo-pvc 
# kubectl delete pvc ts-order-mongo-pvc 
# kubectl delete pvc ts-price-mongo-pvc 
# kubectl delete pvc ts-route-mongo-pvc 
# kubectl delete pvc ts-security-mongo-pvc 
# kubectl delete pvc ts-train-mongo-pvc 
# kubectl delete pvc ts-travel-mongo-pvc 




# kubectl delete pvc pv001 --grace-period=0 --force
# kubectl delete pvc pv002 --grace-period=0 --force
# kubectl delete pvc pv004 --grace-period=0 --force
# kubectl delete pvc pv005 --grace-period=0 --force
# kubectl delete pvc pv009 --grace-period=0 --force
# kubectl delete pvc pv010 --grace-period=0 --force
# kubectl delete pvc pv011 --grace-period=0 --force
# kubectl delete pvc pv013--grace-period=0 --force
