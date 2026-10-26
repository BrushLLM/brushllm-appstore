# BrushLLM 1Panel 应用商店

BrushLLM（企业级 AI 网关）的 [1Panel v2](https://1panel.pro) 第三方应用源。基于 Docker Compose 应用包格式（data.yml 体系），通过"本地应用"机制接入 1Panel 社区版应用商店。

## 安装（三步）

**1. 在安装了 1Panel 的服务器上执行一键导入：**

```bash
bash <(curl -sL https://github.com/<owner>/brushllm-appstore/raw/main/install.sh)
```

> 1Panel 安装在非 `/opt` 目录时：`PANEL_BASE_DIR=/your/path bash <(curl -sL ...)`

**2. 打开 1Panel → 应用商店 → 点击右上角【同步本地应用】**

**3. 在应用列表找到 BrushLLM（Local 标签）→ 安装**

安装表单默认值开箱即用（内置 SQLite、单容器）；可选配置外部数据库 / Redis：

| 参数 | 默认 | 说明 |
|---|---|---|
| Web 端口 | 3000 | 面板自动检测端口冲突 |
| 时区 | Asia/Shanghai | |
| 会话密钥 | 自动生成 | 多节点部署时各节点须一致 |
| 外部数据库连接串 | 空 | 留空使用内置 SQLite；支持 MySQL / PostgreSQL DSN |
| Redis 连接串 | 空 | 多节点部署建议启用 |

## 升级

1. 等应用源发布新版本（本仓库 `apps/brushllm/` 下出现新版本目录）
2. 重新执行一键导入脚本
3. 面板【同步本地应用】→ 已安装应用出现【可升级】→ 点击升级

升级过程自动保留 `data/`（SQLite 数据库）与 `logs/` 目录，可在应用商店设置中开启升级前自动备份。

安装 `latest` 版本的用户也可在应用详情页点【重建】直接拉取最新镜像。

## 目录结构

```
apps/brushllm/
├── data.yml              # 应用元数据
├── logo.png
├── README.md / README_en.md
├── 1.0.0-rc.47/          # 固定版本（镜像 pin v1.0.0-rc.47）
│   ├── data.yml          # 安装表单
│   ├── docker-compose.yml
│   ├── data/             # SQLite 持久化目录
│   └── logs/
└── latest/               # 浮动 tag 版本
```

## 版本与上游

BrushLLM 基于 [QuantumNous/new-api](https://github.com/QuantumNous/new-api)（AGPLv3）定制，版本号与上游发布保持一致（当前 `v1.0.0-rc.47`），便于跟踪上游升级。镜像发布于 `ghcr.io/<owner>/brushllm`，对应源码见 [BrushLLM 源码仓库](https://github.com/<owner>/brushllm)。

## 许可与署名

本应用包含 AGPLv3 许可的上游代码。前端设计与开发由 New API 贡献者完成，原项目地址：https://github.com/QuantumNous/new-api
