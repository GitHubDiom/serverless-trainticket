set -e
echo "Part01 DataBase Deployment"

mkdir /var/nfs/data/station -p
mkdir /var/nfs/data/auth -p
mkdir /var/nfs/data/config -p
mkdir /var/nfs/data/contacts -p
mkdir /var/nfs/data/insidePayment -p
mkdir /var/nfs/data/order -p
mkdir /var/nfs/data/payment -p
mkdir /var/nfs/data/price -p
mkdir /var/nfs/data/route -p
mkdir /var/nfs/data/security -p
mkdir /var/nfs/data/train -p
mkdir /var/nfs/data/travel -p
mkdir /var/nfs/data/user -p
 
PROJECT_DIR=$(cd $(dirname $0); pwd)

cd deployment/Part01-database/
# kubectl delete -f ts-serverless-database-deployment.yml
kubectl apply -f ts-serverless-database-deployment.yml

# kubectl delete -f ts-serverless-persistent-deployment.yml
kubectl apply -f ts-serverless-persistent-deployment.yml
cd ../..


cd src/initDB/initDatabaseFunctions/

buildFunction(){
    func_dir=$1
    echo "BUILDING $func_dir..."
    cd $func_dir
    owk_function_dir=$(find ./ -name "*owk")
    cd $owk_function_dir
    rm -rf .gradle
    bash build-action.sh 2>&1 > /dev/null
    cd ../..
    echo "FINISHED $func_dir"
}


#### Parallel build
function_dirs=$(ls)
for func_dir in ${function_dirs[@]}
do   
    buildFunction $func_dir $owk_function_dir &
done  
wait
echo "Part1 function build finish"

# cd initAuthMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-auth-mongo.yml
# cd ..
# echo "FINISHED 1/13"

# cd initConfigMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-config-mongo.yml
# cd ..
# echo "FINISHED 2/13"

# cd initContactsMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-contacts-mongo.yml
# cd ..
# echo "FINISHED 3/13"

# cd initInsidePaymentMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-inside-payment-mongo.yml
# cd ..
# echo "FINISHED 4/13"

# cd initOrderMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-order-mongo.yml
# cd ..
# echo "FINISHED 5/13"

# cd initPaymentMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-payment-mongo.yml
# cd ..
# echo "FINISHED 6/13"

# cd initPriceMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-price-mongo.yml
# cd ..
# echo "FINISHED 7/13"

# cd initRouteMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-route-mongo.yml
# cd ..
# echo "FINISHED 8/13"

# cd initSecurityMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-security-mongo.yml
# cd ..
# echo "FINISHED 9/13"

# cd initStationMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-station-mongo.yml
# cd ..
# echo "FINISHED 10/13"

# cd initTrainMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-train-mongo.yml
# cd ..
# echo "FINISHED 11/13"

# cd initTravelMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-travel-mongo.yml
# cd ..
# echo "FINISHED 12/13"

# cd initUserMongo/
# cp -r $PROJECT_DIR/template ./
# faas-cli up -f init-user-mongo.yml
# cd ..
# echo "FINISHED 13/13"


# echo "DONE"



