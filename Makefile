# Deploy all YAML files
deploy:
	kubectl apply -f ./app/app-deploy.yaml
	kubectl apply -f ./app/app-ing.yaml
	kubectl apply -f ./app/app-svc.yaml
	kubectl apply -f ./db/mysql-deployment.yaml
	kubectl apply -f ./db/mysql-secrets.yaml
	kubectl apply -f ./web/nginx-front-deploy.yaml
	kubectl apply -f ./web/nginx-front-ing.yaml
	kubectl apply -f ./web/nginx-front-svc.yaml

# Delete all resources
delete:
	kubectl delete -f ./app/app-deploy.yaml
	kubectl delete -f ./app/app-ing.yaml
	kubectl delete -f ./app/app-svc.yaml
	kubectl delete -f ./db/mysql-deployment.yaml
	kubectl delete -f ./db/mysql-secrets.yaml
	kubectl delete -f ./web/nginx-front-deploy.yaml
	kubectl delete -f ./web/nginx-front-ing.yaml
	kubectl delete -f ./web/nginx-front-svc.yaml
