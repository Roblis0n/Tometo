<p align="center">
  <img src="assets/tometo-logo.png" alt="Tometo，一只扛着扳手的番茄修理工" width="180">
</p>

<h1 align="center">Tometo</h1>

<p align="center">
  <a href="README.md">English</a> · 简体中文 · <a href="README.ja.md">日本語</a> · <a href="README.es.md">Español</a>
</p>

Tometo 是一个用于写代码、调试、重构和代码审查的 Codex Skill。它引导 Codex 从实际运行入口查起，沿调用链判断改动会影响谁，再用旧数据、重复请求等具体情况检验修复是否成立。

比如，切换账号后偶尔出现上一个人的头像。只看首次加载，很容易以为问题已经修好。Tometo 会引导 Codex 查清谁保存头像数据，以及旧账号的请求晚一步返回时，谁还有权更新当前页面。十份参考指南按问题取用，一次局部修复只需读与它有关的部分。

## 安装

1. 在仓库页面选择 **Code → Download ZIP**，解压下载的文件。
2. 创建 `~/.agents/skills/tometo/`（Windows 为 `%USERPROFILE%\.agents\skills\tometo\`）。将解压后的 `SKILL.md`、`references/`、`agents/`、`assets/` 直接复制进去，确保入口位于 `tometo/SKILL.md`。
3. 新开一个 Codex 会话，在请求中输入 `$tometo`。请求与技能描述匹配时，Codex 也可以自动选择它。

普通安装无需配置 hook。自行管理 Windows hook 的用户可以选用仓库附带的[事件读取器](scripts/emit-codex-context.ps1)。[Codex 官方安装说明](https://developers.openai.com/codex/skills/)

## 使用示例

```text
$tometo 切换账号后，有时还能看到上一位用户的资料。请跟踪请求返回和页面更新的顺序，修复旧数据覆盖的问题。
```

```text
$tometo 请只读审查这次迁移，重点看已有记录和旧客户端会受到什么影响。
```

## 参考指南

核心规则和十份指南的正文均为简体中文。查看[技能入口](SKILL.md)。

| 遇到的问题 | 对应指南 |
| --- | --- |
| 找不到入口，或上下文互相矛盾 | [仓库与上下文](references/repository-context.md) |
| 如何设计行为、划分职责或重构 | [设计与变更](references/design-and-change.md) |
| 状态、并发、权限或生命周期 | [实现](references/implementation.md) |
| 引入依赖、选择工具或处理调用异常 | [依赖与工具](references/dependencies-and-tools.md) |
| 如何解释故障，或为什么修复没有生效 | [诊断](references/diagnosis.md) |
| 当前证据能支持什么结论 | [证据与完成](references/evidence-and-completion.md) |
| 审查改动或处理审查反馈 | [审查](references/review.md) |
| 变动涉及共享接口、旧数据、迁移或发布 | [兼容与交付](references/compatibility-and-delivery.md) |
| 如何拆分工作，或在任务中断后恢复 | [长任务](references/long-running.md) |
| 如何降低延迟或资源消耗 | [性能与成本](references/performance-and-cost.md) |
