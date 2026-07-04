#!/bin/bash

set -e

echo "🛠️ B1-2 공통 실행 환경을 준비합니다."

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

AGENT_HOME="$HOME/agent"
EVIDENCE_HOME="$HOME/b1-2-evidence"

echo "📁 agent 실행 환경 폴더 생성"
mkdir -p "$AGENT_HOME/bin"
mkdir -p "$AGENT_HOME/upload_files"
mkdir -p "$AGENT_HOME/api_keys"
mkdir -p "$AGENT_HOME/logs"

echo "📁 CASE별 증거자료 폴더 생성"
mkdir -p "$EVIDENCE_HOME/common"
mkdir -p "$EVIDENCE_HOME/oom"
mkdir -p "$EVIDENCE_HOME/cpu"
mkdir -p "$EVIDENCE_HOME/deadlock"

echo "🔑 테스트용 API Key 파일 생성"
echo "agent_api_key_test" > "$AGENT_HOME/api_keys/t_secret.key"

echo "📦 실행파일 확인 및 복사"
if [ -f "$PROJECT_ROOT/bin/agent-leak-app-x86" ]; then
  cp "$PROJECT_ROOT/bin/agent-leak-app-x86" "$AGENT_HOME/bin/"
  chmod +x "$AGENT_HOME/bin/agent-leak-app-x86"
  echo "✅ 실행파일 복사 완료: $AGENT_HOME/bin/agent-leak-app-x86"
else
  echo "⚠️ 실행파일이 없습니다: $PROJECT_ROOT/bin/agent-leak-app-x86"
  echo "제공받은 agent-leak-app-x86 파일을 프로젝트의 bin/ 폴더에 넣은 뒤 다시 실행하세요."
fi

echo "🧾 세팅 정보 기록"
{
  echo "B1-2 setup completed"
  echo "Date: $(date)"
  echo "User: $(whoami)"
  echo "Home: $HOME"
  echo "Project Root: $PROJECT_ROOT"
  echo "Agent Home: $AGENT_HOME"
  echo "Evidence Home: $EVIDENCE_HOME"
  echo "Kernel: $(uname -a)"
} > "$EVIDENCE_HOME/common/setup-info.txt"

echo
echo "✅ B1-2 공통 환경 세팅 완료"
echo
echo "생성된 주요 경로:"
echo "- $AGENT_HOME"
echo "- $EVIDENCE_HOME"
echo
echo "주의: 이 스크립트는 CASE 1, CASE 2, CASE 3을 실행하지 않습니다."
echo "CASE별 미션은 환경변수와 명령어를 직접 입력하면서 수동으로 수행하세요."
