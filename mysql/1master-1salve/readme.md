## 主从搭建操作步骤

运行容器：在根目录下执行 docker-compose up -d 启动容器。

获取主从库ip地址：

```
docker inspect 容器id |grep IPAddress
```

在主库上，创建允许从服务器同步数据的账户:

```
grant replication slave on *.* to 'account'@'从库ip' identified by '123456';
flush privileges;
```

查看主服务器状态 :show master status;记录下当前的 File，Position。



在从库中执行同步命令，设置主服务器ip，同步账号密码，同步位置

```
change master to master_host='主库ip',master_user='account',master_password='123456',master_log_file='File',master_log_pos=Position;
```

开启同步：start slave;

查看从服务器状态 show slave status;

Slave_IO_Running及Slave_SQL_Running进程必须正常运行，即Yes状态。否则说明同步失败,若失败查看mysql错误日志中具体报错详情来进行问题定位，最后可以去主服务器上的数据库中创建表或者更新表数据来测试同步。

 

 

同步过程查看日志相关命令：

```
show slave hosts；查看从库
show binary logs；查看binlog日志
show binlog events in 'mysql-bin.000003'；查看日志中的事件
start slave；启动同步
stop  slave；停止同步
set global sql_slave_skip_counter=N;跳过执行事务
```

