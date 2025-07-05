#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#get Staged files
staged_Files=$(git diff --cached  --name-only --diff-filter=ACM)
echo -e "scan against:$staged_Files"

#cheks do we have staged files or not
if [ -z "$staged_Files" ]; then
  echo "staged_Files is null or empty. Exiting with status 0."
  exit 0
fi

#cheks do we have staged files or not
echo "🔍 Running Semgrep scan (warn-only)..."
semgrep login 1>/dev/null
semgrep ci --code --secrets --include $staged_Files --dry-run 2>/dev/null
echo -e "\n${GREEN}✔️Semgrep security code scan completed.\n\r${NC} ${RED}📄 For any questions or concerns, please contact the Security Team.${NC}"
exit 0



