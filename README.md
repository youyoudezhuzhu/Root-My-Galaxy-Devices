# Root My Galaxy — Samsung SM-F731U（Galaxy Z Flip 5 美版）

本仓库只保留 **F731U（SM-F731U/DS）** 的 Android 临时 root 方案，基于
[Root-My-Galaxy](https://github.com/BuSung-dev/Root-My-Galaxy) 移植。

| 项目 | 内容 |
| --- | --- |
| 设备 | Samsung SM-F731U/DS（Z Flip 5 美版，T-Mobile 运营商锁） |
| 固件 | F731USQS8GZF1 |
| 内核 | 5.15.189-android13-8-33404244-abF731USQS8GZF1 |
| 状态 | **真机验证通过**：v0.2.34 首次成功（bootstrap root + KernelSU） |
| 最新 Release | `f731u-v0.2.36` — APK + SHA256SUMS |

> 临时 root：重启后失效，需要 root 时重新运行 App（约 10 秒）。

## 仓库结构

- `legacy-source/f731u/` — 导入的完整源码快照（保留原 `rmg-f731u` 历史）
  - `app-src/` — 改造后的 Root-My-Galaxy Android 工程源码（含全部 assets）
  - `artifacts/f731u-F731USQS8GZF1/` — 同款 exploit payload（与 assets 同步）
  - `kernelsu/`、`support/`、`docs/`、`tools/` — 模块、设备清单与移植文档
- `.github/workflows/build-f731u-apk.yml` — 手动触发的云端 APK 编译

## 构建 APK

仓库 → **Actions** → **Build F731U APK** → **Run workflow**。

产物为 `root-my-galaxy-f731u-debug` artifact，保留 14 天。

## 说明

原多设备迁移仓库中的 T870 分支、迁移脚本和引用已删除源仓库的 workflow 已清理，
本分支只保留 F731U。原 `rmg-f731u` / `rmg-t870` 源仓库已不可用，历史已完整导入本仓库。
