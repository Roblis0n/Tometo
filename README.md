<p align="center">
  <img src="assets/tometo-logo.png" alt="Tometo, a little tomato mechanic carrying a wrench" width="180">
</p>

<h1 align="center">Tometo</h1>

<p align="center">
  English · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · <a href="README.es.md">Español</a>
</p>

Tometo is a Codex skill for writing, debugging, refactoring, and reviewing code. It starts where the software actually runs, follows a change through its callers, and checks whether the result holds for cases such as older data or a request that gets retried.

For example, a fix for a stale profile after an account switch may look correct on first load. Tometo guides Codex to trace who owns the profile data and what happens if a request from the previous account finishes late. The ten short guides are there for questions like this. Codex can consult the ones the task calls for.

## Install

1. Choose **Code → Download ZIP** on the repository page and extract the archive.
2. Create `~/.agents/skills/tometo/` (on Windows, `%USERPROFILE%\.agents\skills\tometo\`). Copy `SKILL.md`, `references/`, `agents/`, and `assets/` directly into it, so that `tometo/SKILL.md` exists.
3. Open a new Codex session and mention `$tometo` in a prompt. Codex can also select the skill when a request matches its description.

The standard installation works without configuring hooks. The optional [Windows hook reader](scripts/emit-codex-context.ps1) is for users who already manage their own hook configuration. [Codex skill documentation](https://developers.openai.com/codex/skills/)

## Try it

```text
$tometo Switching accounts sometimes shows the previous user's profile. Trace the request and fix the stale update.
```

```text
$tometo Review this migration for existing records and older clients. Keep the review read-only.
```

## Reference guides

The core instructions and all ten guides are written in Simplified Chinese. Start with the [skill entry point](SKILL.md).

| When you need to… | Read |
| --- | --- |
| Find the real entry point or resolve conflicting context | [Repository and context](references/repository-context.md) |
| Choose a design or a refactoring boundary | [Design and change](references/design-and-change.md) |
| Handle state, concurrency, permissions, or a lifecycle | [Implementation](references/implementation.md) |
| Add a dependency or handle a tool failure | [Dependencies and tools](references/dependencies-and-tools.md) |
| Explain a failure or an unsuccessful fix | [Diagnosis](references/diagnosis.md) |
| Decide what the available evidence establishes | [Evidence and completion](references/evidence-and-completion.md) |
| Review code or act on review feedback | [Review](references/review.md) |
| Change a shared interface, migrate data, or ship a release | [Compatibility and delivery](references/compatibility-and-delivery.md) |
| Split work or resume an interrupted task | [Long-running work](references/long-running.md) |
| Reduce latency or resource use | [Performance and cost](references/performance-and-cost.md) |
