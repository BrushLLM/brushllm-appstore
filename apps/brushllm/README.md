# BrushLLM

## 产品介绍

BrushLLM 是企业级 AI 网关：一个密钥调用所有模型。OpenAI、Anthropic、Gemini、DeepSeek、通义千问等主流模型服务统一接口、统一计费、统一审计。

- **多协议兼容**：OpenAI Chat / Responses、Anthropic Messages、Gemini 原生协议互转
- **渠道路由**：模型映射、优先级权重、失败重试、渠道亲和
- **用量与成本**：额度管理、订阅、用量日志、表达式计价
- **访问控制**：用户分组、细粒度权限、OAuth/OIDC、双因子认证
- **控制台**：11 种语言、亮暗双主题、操练场在线调试

默认内置 SQLite 单容器运行；通过安装表单可切换外部 MySQL / PostgreSQL 与 Redis（多节点部署）。

## 安装说明

在 1Panel 应用商店安装后，访问 `http://服务器IP:端口` 完成初始化向导（创建管理员账户）。API 基地址为 `http://服务器IP:端口/v1`。

## 开源声明

本项目基于 [New API](https://github.com/QuantumNous/new-api)（AGPLv3）定制。前端设计与开发由 New API 贡献者完成。
