# Enterprise Upgrade Runbook

## Step 1
基线采集：导出依赖树，确认 Java / Maven / Docker / Jenkins 版本。

## Step 2
跑 assessment：生成 upgrade-report，并组织技术评审。

## Step 3
按 PR slicing 拆分：
- PR-1 Java + plugin
- PR-2 Spring family + Swagger
- PR-3 Middleware / SDK
- PR-4 Source refactor
- PR-5 Rollout

## Step 4
在 sandbox 环境做 middleware smoke checks。

## Step 5
准备 canary 和 rollback。
