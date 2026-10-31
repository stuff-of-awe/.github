#!/usr/bin/env bash
# SPDX-License-Identifier: MPL-2.0
set -euo pipefail
cd "$(dirname "$0")/.."
for file in profile/README.md profile/assets/hero.png profile/assets/avatar.png profile/assets/social.png CONTRIBUTING.md SUPPORT.md github_chora.deed; do
  test -s "$file" || { echo "Missing: $file" >&2; exit 1; }
done
grep -q 'https://raw.githubusercontent.com/stuff-of-awe/.github/main/profile/assets/' profile/README.md
! grep -Eq 'UNASSIGNED|\{\{[A-Z_]+\}\}' profile/README.md README.adoc CONTRIBUTING.md SUPPORT.md
echo 'Profile files and organisation asset URLs: PASS'
