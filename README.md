# 知乎环境迁移包

这是给新 Agent 的知乎能力包，只包含知乎运行环境，不包含旧 Demo、旧故事稿、人物设定或前端代码。

## 包含

- `skills/zhihu/`：知乎 Skill 0.7.2-beta.20260911131715，含搜索、直答、知识库、额度、OAuth、黑客松故事与知识 API 文档。
- `cli/darwin-arm64/zhihu-cli`：已验证的 macOS ARM64 CLI 0.6.0-beta.20260908125143。
- `install-macos-arm64.sh`：复制 CLI 到用户本地 bin 的脚本。
- `.env.example`：环境变量模板。
- `SHA256SUMS`：文件校验值。

## 新 Agent 接手步骤

1. 解压后先阅读 `skills/zhihu/SKILL.md`。
2. macOS ARM64 运行 `bash install-macos-arm64.sh`；其他系统不要使用包内二进制，按 Skill 的 setup 脚本下载当前平台官方 CLI。
3. 运行：

   `~/.local/bin/zhihu-cli capabilities`

4. 需要知乎业务能力时，按 Skill 流程配置接收方自己的 `ZHIHU_ACCESS_SECRET`。密钥不要写入代码、前端或 Git。
5. 只做黑客松故事/知识接口时，可以按 `skills/zhihu/references/hackathon-content-api.md` 使用无需鉴权的活动接口；先列表，再用返回的 `work_id` 获取详情。
6. 新 Demo 的知乎接入建议由服务端代理，缓存和去重，保留作者、标题、摘要、来源链接。不要在浏览器暴露 Access Secret。
7. 查询额度使用 CLI 的 `quota`，不要高频轮询。

## 环境事实

- 打包来源设备：macOS ARM64。
- Node.js 与具体 Demo 无关；新 Agent 按新 Demo 自己选择运行时。
- CLI Skill 包不等于账号授权。Access Secret、OAuth 登录态、系统钥匙串、知乎账号权益和 Sites 部署权限不会随包迁移。
- 本包不携带任何旧仓库、旧站点配置、数据库、故事内容或产品代码。

## 知乎能力范围

可用：知乎站内/全网搜索、热榜、知乎直答、回答摘要、知识库、额度查询、黑客松专属故事和知识接口、OAuth 接入文档。

限制：没有通用的“批量读取全部盐选全文”能力；受会员权限保护的内容不能绕过权限抓取。展示时必须遵守来源归属、版权和社区规范。
