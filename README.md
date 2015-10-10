# Bind SDB with rails
Sample of name server using rails with bind-sdb.

# Set up docker containers and rails server
* PostgreSQL
    * docker build -t pg94 docker/postgres
    * docker run -itd --name postgres-server -p 5432:5432 -e POSTGRES_PASSWORD=hogehoge pg94
    * See Details (https://hub.docker.com/_/postgres/)

* Rails
    * rake db:create db:migrate
    * rake db:seed
        * insert SOA and NS
        * insert sample IP information (aaa.hoge.com, 10.100.200.1)
    * rails server
        * Please Add your IP Information

* Bind SDB
    * modify IP in docker/bind-sdb/named.conf
        * Please set your postgres-server IP or docker host IP
    * $ docker build -t bind_sdb_with_rails/bind-sdb docker/bind-sdb
    * $ docker run -itd --name name-server -p 53:53 -p 53:53/udp bind_sdb_with_rails/bind-sdb

# Look up name
* dig @<your-container-ip> aaa.hoge.com
    * => 10.100.200.1
* dig @<your-container-ip> -x 10.100.200.1
    * => aaa.hoge.com
