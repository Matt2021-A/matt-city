#!/usr/bin/env bash
set -euo pipefail

fail() {
  printf '%s\n' "$*" >&2
  exit 1
}

command -v jq >/dev/null 2>&1 || fail "jq not found"

CONFIG_ERR="$(mktemp)"
trap 'rm -f "$CONFIG_ERR"' EXIT

gc config show >/dev/null 2>"$CONFIG_ERR" || {
  cat "$CONFIG_ERR" >&2
  fail "resolved configuration failed to load"
}

if grep -q 'assignee=.*requires a concrete session target' "$CONFIG_ERR"; then
  cat "$CONFIG_ERR" >&2
  fail "configured-agent assignee warnings remain"
fi

AGENTS="$(gc agent list)"
for target in \
  'gc.run-operator' \
  'matt-city/matt.researcher' \
  'matt-city/matt.technical-analyst' \
  'matt-city/matt.identity-security-analyst' \
  'matt-city/matt.skeptic'; do
  grep -Fq "$target" <<<"$AGENTS" || fail "required target not discovered: $target"
done

FORMULA_JSON="$(gc formula show research-topic --json)"
jq -e '[.. | objects | .contract? | select(. == "graph.v2")] | length > 0' \
  <<<"$FORMULA_JSON" >/dev/null || fail "research-topic is not graph.v2"

jq -e '[.. | objects | select(has("metadata")) | .metadata["gc.run_target"]? | select(. != null)] | length >= 5' \
  <<<"$FORMULA_JSON" >/dev/null || fail "compiled gc.run_target metadata is incomplete"

for agent in \
  'matt-city/matt.researcher' \
  'matt-city/matt.technical-analyst' \
  'matt-city/matt.identity-security-analyst' \
  'matt-city/matt.skeptic'; do
  PRIME="$(gc prime "$agent")"
  grep -Fq 'gc hook --claim --json' <<<"$PRIME" || fail "claim protocol missing from $agent"
  grep -Fq 'gc.outcome=pass' <<<"$PRIME" || fail "outcome protocol missing from $agent"
done

printf 'required operator, workers, graph.v2 routes, and claim lifecycle are present\n'
