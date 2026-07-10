#!/bin/bash
set -e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$PROJECT_ROOT/api_keys" "$PROJECT_ROOT/logs" "$PROJECT_ROOT/upload_files"
echo "agent_api_key_test" > "$PROJECT_ROOT/api_keys/secret.key"
echo "agent_api_key_test" > "$PROJECT_ROOT/api_keys/t_secret.key"
chmod +x "$PROJECT_ROOT/bin/agent-leak-app-*" 2>/dev/null || true
echo "✅ 0.5초 정밀 관제 셋팅 완료!"
