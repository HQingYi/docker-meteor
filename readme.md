# docker-meteor
meteor docker镜像，仅负责部署任务。

# 职责
## image解决
- node版本及运行环境的问题

## container创建
- volumn挂载：/usr/app/bundle 为bundle解压目录，/usr/app/config为bundle配置目录

## 运行时绑定
- settings.json的自动载入(/usr/app/config/settings.json -> METOER_SETTINGS)
```
[[ -f /usr/app/config/settings.json ]] && export METEOR_SETTINGS="$(cat /usr/app/config/settings.json)"
```

- 运行时环境读取/usr/app/config/*.sh

- npm install

- 启动服务器


# 不解决的问题
- 版本控制 & 自动更新
- 如何构造server tarfile

