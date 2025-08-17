oc project msh36345-dev

oc new-app \
  --name=mysql \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=pass123 \
  -e MYSQL_DATABASE=testdb \
  -e MYSQL_ROOT_PASSWORD=root123 \
  registry.redhat.io/rhscl/mysql-80-rhel7

oc rollout status deployment/mysql

oc get pods

oc rsh mysql-7d9c875ff5-xt8nm

mysql -u user -ppass123 testdb

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO users (name, email) VALUES
('Moshe', 'moshe@example.com'),
('Sherry', 'sherry@example.com');

SELECT * FROM users;

exit;

exit

oc new-build --name=fastapi --binary --strategy=docker
oc start-build fastapi --from-dir=. --follow

oc new-app fastapi:latest
oc rollout status deployment/fastapi

oc expose deployment/fastapi --port=8000 --target-port=8000 --name=fastapi
oc expose service/fastapi

oc get route

(ROUTE=$(oc get route fastapi -o jsonpath='{.spec.host}')
echo "🔗 FastAPI is available at: http://$ROUTE/users")

