# Elastic Kibana (EK) on Docker
### 基于 es7.1.1 版本的 docker 实现

准备工作: 需要设置linux系统参数,```sudo sysctl -w vm.max_map_count=262144 ```。
启动容器之前，还需要给 elasticsearch 目录下的 data 和 logs 赋予写入权限

启动容器后，需要进入到 es 容器中执行 ``` ./bin/elasticsearch-setup-passwords auto ``` 要配置自定义的密码，将 auto 改成 interactive。（kibana 用户的密码需要和  kibana/config/kibana.yml 中的一致）

### 关于api请求：
如果使用 Postman 请求本实例中的 es 的接口，需要在 Authorization 栏下选择 Basic Auth，然后输入账户名和密码就能正常请求了。