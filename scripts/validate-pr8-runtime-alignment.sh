#!/usr/bin/env bash
set -euo pipefail

RIG="${1:-matt-city}"
FORMULA="${2:-research-topic}"

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

printf 'Checking Gas City configuration for rig %s\n' "$RIG"

command -v gc >/dev/null 2>&1 || fail "gc not found"
command -v jq >/dev/null 2>&1 || fail "jq not found"
command -v bd >/dev/null 2>&1 || fail "bd not found"
command -v dolt >/dev/null 2>&1 || fail "dolt not found"

gc version
bd version
dolt version

CONFIG_OUT="$(mktemp)"
CONFIG_ERR="$(mktemp)"
trap 'rm -f "$CONFIG_OUT" "$CONFIG_ERR"' EXIT

gc --rig "$RIG" config show >"$CONFIG_OUT" 2>"$CONFIG_ERR" || {
  cat "$CONFIG_ERR" >&2
  fail "resolved configuration failed to load"
}

if grep -q 'assignee=.*requires a concrete session target' "$CONFIG_ERR"; then
  cat "$CONFIG_ERR" >&2
  fail "configured-agent assignee warnings remain"
fi

AGENTS="$(gc --rig "$RIG" agent list)"
printf '%s\n' "$AGENTS"

for target in \
  'gc.run-operator' \
  'matt-city/matt.researcher' \
  'matt-city/matt.technical-analyst' \
  'matt-city/matt.identity-security-analyst' \
  'matt-city/matt.skeptic'; do
  grep -Fq "$target" <<<"$AGENTS" || fail "required target not discovered: $target"
done

FORMULA_JSON="$(gc --rig "$RIG" formula show "$FORMULA" --json)"

jq -e '
  [.. | objects | .contract? | select(. == "graph.v2")]
  | length > 0
' <<<"$FORMULA_JSON" >/dev/null || fail "formula is not graph.v2"

jq -e '
  [.. | objects | select(has("metadata")) | .metadata["gc.run_target"]? | select(. != null)]
  | length >= 5
' <<<"$FORMULA_JSON" >/dev/null || fail "expected gc.run_target metadata was not compiled"

for target in \
  'matt-city/matt.researcher' \
  'matt-city/matt.technical-analyst' \
  'matt-city/matt.identity-security-analyst' \
  'matt-city/matt.skeptic'; do
  jq -e --arg target "$target" '
    [.. | objects | select(has("metadata")) | .metadata["gc.run_target"]?]
    | index($target) != null
  ' <<<"$FORMULA_JSON" >/dev/null || fail "formula target missing: $target"
done

for agent in \
  'matt-city/matt.researcher' \
  'matt-city/matt.technical-analyst' \
  'matt-city/matt.identity-security-analyst' \
  'matt-city/matt.skeptic'; do
  PRIME="$(gc --rig "$RIG" prime "$agent")"
  grep -Fq 'gc hook --claim --json' <<<"$PRIME" || fail "claim protocol missing from $agent"
  grep -Fq 'gc.outcome=pass' <<<"$PRIME" || fail "outcome protocol missing from $agent"
done

printf '\nPASS: PR #8 runtime alignment prerequisites are present.\n'
printf 'This does not launch a workflow or modify external systems.\n'
