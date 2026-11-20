<p align="center">
  <img src="assets/tometo-logo.png" alt="スパナを担いだ小さなトマトの整備士、Tometo" width="180">
</p>

<h1 align="center">Tometo</h1>

<p align="center">
  <a href="README.md">English</a> · <a href="README.zh-CN.md">简体中文</a> · 日本語 · <a href="README.es.md">Español</a>
</p>

Tometo は、実装、デバッグ、リファクタリング、コードレビューに使う Codex スキルです。実際に呼び出される箇所から処理をたどり、変更が呼び出し元や既存データにどう影響するかを確かめます。

たとえば、アカウントを切り替えると、まれに前のユーザーのプロフィールが表示されることがあります。初回表示が正しくても、切り替え前のリクエストが遅れて返ってきた場合はどうでしょうか。誰がデータを保持し、どの応答が画面を更新できるかを調べるのが、Tometo の使いどころです。十のガイドから、その作業に関係するものを参照できます。

## インストール

1. リポジトリのページで **Code → Download ZIP** を選び、ダウンロードしたファイルを展開します。
2. `~/.agents/skills/tometo/`（Windows では `%USERPROFILE%\.agents\skills\tometo\`）を作成します。その直下に `SKILL.md`、`references/`、`agents/`、`assets/` をコピーし、`tometo/SKILL.md` があることを確認します。
3. 新しい Codex セッションで、依頼文に `$tometo` を含めてください。依頼がスキルの説明に合う場合は、Codex が自動で選ぶこともあります。

通常の利用にはフックの設定は不要です。Windows でフックを自分で管理する場合は、同梱の[イベント読み取りスクリプト](scripts/emit-codex-context.ps1)も利用できます。[Codex のスキルガイド](https://developers.openai.com/codex/skills/)

## 使用例

```text
$tometo アカウントを切り替えると、ときどき前のユーザーのプロフィールが表示されます。リクエストと画面更新の順序を追い、古いデータで上書きされる問題を修正してください。
```

```text
$tometo この移行が既存レコードと旧クライアントに与える影響をレビューしてください。コードは変更しないでください。
```

## 参照ガイド

スキルの指示と十のガイドの本文は簡体字中国語で書かれています。各ガイドを参照する条件は[スキルの入口](SKILL.md)にあります。

| 状況 | ガイド |
| --- | --- |
| 未知のリポジトリや処理の入口を把握する | [リポジトリと文脈](references/repository-context.md) |
| 振る舞いの設計やリファクタリングの範囲を決める | [設計と変更](references/design-and-change.md) |
| 状態、並行処理、権限、ライフサイクルを扱う | [実装](references/implementation.md) |
| 依存関係を追加する、ツールの失敗に対処する | [依存関係とツール](references/dependencies-and-tools.md) |
| 障害の原因や、修正が効かない理由を調べる | [診断](references/diagnosis.md) |
| 何が確認できたかを判断する | [根拠と完了](references/evidence-and-completion.md) |
| コードをレビューする、指摘に対応する | [レビュー](references/review.md) |
| 共有インターフェースの変更、移行、リリースを行う | [互換性とリリース](references/compatibility-and-delivery.md) |
| 作業を分担する、中断したタスクを再開する | [長時間タスク](references/long-running.md) |
| 遅延やリソース消費を減らす | [パフォーマンスとコスト](references/performance-and-cost.md) |
