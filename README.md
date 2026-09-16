# demo-buildkite

A PipeMesh dogfood repository (DESIGN-V47): the **build** stage runs on
Buildkite (`trigger: buildkite:`), the **staging** and **production**
stages are PipeMesh script jobs that sync the built site into an S3
website bucket. PipeMesh creates every Buildkite build for the revision
it is promoting, imports `dist/**`, and holds the revision per
environment; Buildkite holds the build.

- Board: https://pipemesh.dev/github.com/pipemesh/demo-buildkite
- Staging: http://pipemesh-demo-buildkite.s3-website-us-east-1.amazonaws.com/staging/
- Production: http://pipemesh-demo-buildkite.s3-website-us-east-1.amazonaws.com/production/
