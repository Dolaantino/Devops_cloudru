# Задача для выполнения Ansible playbook
playbook:
	 ansible-playbook ./playbook/playbook.yaml -i ./playbook/inventory.ini

# Задача для запуска Python приложения
run:
	python3 app/app.py

# Задача для сборки Docker-образа
docker:
	cd app
	docker build -t ubuntu_python3

# Задача для запуска Docker контейнера
docker_run:
	cd app
	docker run --rm -p 8000:8000 ubuntu_python3

# Задача для старта Minikube
minikube:
	minikube start --driver=docker --alsologtostderr
	eval $$(minikube docker-env)
	minikube dashboard --url

# Задача для установки Helm чарта
helm:
	helm install my-python-app-release ./helm
