# Deploy all YAML files 
deploy:
	microk8s kubectl apply -f ./app/app-deploy.yaml -n famly
	microk8s kubectl apply -f ./app/app-ing.yaml -n famly
	microk8s kubectl apply -f ./app/app-svc.yaml -n famly
	microk8s kubectl apply -f ./db/mysql-deployment.yaml -n famly
	microk8s kubectl apply -f ./db/mysql-secrets.yaml -n famly
	microk8s kubectl apply -f ./web/nginx-front-deploy.yaml -n famly
	microk8s kubectl apply -f ./web/nginx-front-ing.yaml -n famly
	microk8s kubectl apply -f ./web/nginx-front-svc.yaml -n famly
# Delete all resources 
delete:
	microk8s kubectl delete -f ./app/app-deploy.yaml -n famly
	microk8s kubectl delete -f ./app/app-ing.yaml -n famly
	microk8s kubectl delete -f ./app/app-svc.yaml -n famly
	microk8s kubectl delete -f ./db/mysql-deployment.yaml -n famly
	microk8s kubectl delete -f ./db/mysql-secrets.yaml -n famly
	microk8s kubectl delete -f ./web/nginx-front-deploy.yaml -n famly
	microk8s kubectl delete -f ./web/nginx-front-ing.yaml -n famly
	microk8s kubectl delete -f ./web/nginx-front-svc.yaml -n famly
