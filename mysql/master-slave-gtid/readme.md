## 基于 GITD 主从复制操作步骤

### 1.运行容器

在根目录下执行 docker-compose up -d 启动容器。 



### 2.在主数据库上，分配「主从复制」需要用到的账号

```
CREATE USER 'repl'@'%' IDENTIFIED BY 'repl';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl'@'%';
```



### 3.在从数据库上，指定链接主库的配置信息和用于复制的账号

```
CHANGE MASTER TO MASTER_HOST = 'mysql-master',MASTER_PORT = 3306,MASTER_USER = 'repl',MASTER_PASSWORD = 'repl',MASTER_AUTO_POSITION = 1;
```



### 4.启动复制

```
start slave;
```



### 5.检查主从复制状态

如果 Slave_IO_Running 和 Slave_SQL_Running 两栏都显示了 YES，代表主从配置成功。



### 同步过程查看日志相关命令

```
show slave hosts; 查看从库
show binary logs; 查看binlog日志
show binlog events in 'replicas-mysql-bin.000005'; 查看日志中的事件
start slave; 启动同步
stop  slave; 停止同步
set global sql_slave_skip_counter=N; 跳过执行事务 
show master logs; 查看主库二进制日志
purge binary logs to 'mysql-bin.000003';  清理00003 号之前的binlog 日志文件
flush logs;   关闭当前使用的binary log，然后打开一个新的binary log文件，文件的序号加1.
```
