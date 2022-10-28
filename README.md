# 幻方 VPN

## 工作原理

在容器内运行 openconnect VPN client 和 tinyproxy server，将 8888 端口暴露为 HTTP PROXY。

## 运行命令

```bash
docker run --name hfvpn --privileged -p 8888:8888 --rm -dit hfvpn
```

## 使用方式

```bash
export HTTP_PROXY=http://127.0.0.1:8888
export HTTPS_PROXY=http://127.0.0.1:8888
curl -vvv https://studio.yinghuo.high-flyer.cn
```

## 参考仓库

- https://github.com/wazum/openconnect-proxy
