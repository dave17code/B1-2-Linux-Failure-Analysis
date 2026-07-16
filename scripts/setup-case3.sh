#!/bin/bash
set -e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$PROJECT_ROOT/agent_home/upload_files" "$PROJECT_ROOT/agent_home/api_keys" "$PROJECT_ROOT/logs"

if [ -f "$PROJECT_ROOT/api_keys/secret.key" ]; then
    cp -f "$PROJECT_ROOT/api_keys/secret.key" "$PROJECT_ROOT/agent_home/api_keys/secret.key"
else
    echo "agent_api_key_test" > "$PROJECT_ROOT/agent_home/api_keys/secret.key"
fi
chmod +x "$PROJECT_ROOT/bin/agent-leak-app-*" 2>/dev/null || true
echo "✅ 유령 프로세스 청소 및 무결성 환경 세팅 완료!"
