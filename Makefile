playbook:
    ansible-playbook ./playbook/playbook.yaml ./playbook/inventory.ini
run:
    python3 app.py
docker:
    docker build -t ubuntu_python3 -f /app/Dockerfile 
# docker run --rm -p 8000:8000 ubuntu_python3
