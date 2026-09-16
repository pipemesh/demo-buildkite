#!/usr/bin/env bash
# Builds the demo site: a page that says which revision it is and which
# Buildkite build produced it. Deliberately tiny — the point is the path
# Buildkite → PipeMesh → S3, not the build.
set -euo pipefail
sha="${PIPEMESH_SHA:-${BUILDKITE_COMMIT:-unknown}}"
run="${PIPEMESH_RUN:-none}"
number="${BUILDKITE_BUILD_NUMBER:-0}"
built_at="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "--- :package: Rendering dist/"
rm -rf dist && mkdir -p dist
sed -e "s/@SHA@/${sha}/g" -e "s/@SHORT@/${sha:0:7}/g" -e "s/@BUILD@/${number}/g" \
    -e "s/@RUN@/${run}/g" -e "s/@AT@/${built_at}/g" site/index.html > dist/index.html
cat > dist/build.json <<JSON
{ "sha": "${sha}", "buildkiteBuild": ${number}, "pipemeshRun": "${run}", "builtAt": "${built_at}" }
JSON
echo "+++ :white_check_mark: Built"
ls -la dist
