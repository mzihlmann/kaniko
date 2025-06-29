variable "REGISTRY" {
  default = "localhost"
}

variable "TAG" {
  default = "latest"
}

group "default" {
  targets = ["executor"]
}

target "executor" {
  target = "kaniko-executor"
  context = "."
  dockerfile = "deploy/Dockerfile"
  tags = ["${REGISTRY}:${TAG}"]
  no-cache-filter = ["certs"]
  cache-from = ["type=gha"]
  cache-to   = ["type=gha,mode=max"]
}

target "debug" {
  target = "kaniko-debug"
  context = "."
  dockerfile = "deploy/Dockerfile"
  tags = ["${REGISTRY}:${TAG}-debug"]
  no-cache-filter = ["certs"]
  cache-from = ["type=gha"]
  cache-to   = ["type=gha,mode=max"]
}

target "slim" {
  target = "kaniko-slim"
  context = "."
  dockerfile = "deploy/Dockerfile"
  tags = ["${REGISTRY}:${TAG}-slim"]
  no-cache-filter = ["certs"]
  cache-from = ["type=gha"]
  cache-to   = ["type=gha,mode=max"]
}

target "warmer" {
  target = "kaniko-warmer"
  context = "."
  dockerfile = "deploy/Dockerfile"
  tags = ["${REGISTRY}:${TAG}-warmer"]
  no-cache-filter = ["certs"]
  cache-from = ["type=gha"]
  cache-to   = ["type=gha,mode=max"]
}

target "bootstrap" {
  target = "kaniko-debug-2"
  context = "."
  dockerfile = "deploy/Dockerfile"
  tags = ["${REGISTRY}:${TAG}-bootstrap"]
  no-cache-filter = ["certs"]
  cache-from = ["type=gha"]
  cache-to   = ["type=gha,mode=max"]
}
