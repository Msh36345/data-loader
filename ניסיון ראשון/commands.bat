oc project

❯ oc new-app \
  -e MYSQL_USER=admin \
  -e MYSQL_PASSWORD=redhat \
  -e MYSQL_DATABASE=mysqldb \
  registry.redhat.io/rhscl/mysql-57-rhel7

❯ oc expose service mysql-57-rhel7

❯ oc get routes

❯  oc get pods

❯ oc rsh mysql-57-rhel7-846469ccdc-97l9l

sh-4.2$ mysql -u admin -p

mysql> show databases;

mysql> USE mysqldb;

mysql> CREATE TABLE IF NOT EXISTS data (ID INT,first_name VARCHAR(255),last_name VARCHAR(255));

mysql> INSERT INTO data (ID, first_name, last_name) VALUES (1, 'Moshe', 'Shulman');

mysql> select * from data



