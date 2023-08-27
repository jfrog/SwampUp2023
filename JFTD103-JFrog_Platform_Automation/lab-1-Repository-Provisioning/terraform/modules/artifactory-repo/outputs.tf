output "remote_docker" {
  value = try(artifactory_remote_docker_repository.this[0].key, "")
}

output "remote_npm" {
  value = try(artifactory_remote_npm_repository.this[0].key, "")
}

output "remote_maven" {
  value = try(artifactory_remote_maven_repository.this[0].key, "")
}

output "finapp-docker-dev-local" {
  value = try(artifactory_local_docker_v2_repository.this[0].key, "")
}

output "auth-npm-dev-local" {
  value = try(artifactory_local_npm_repository.this[0].key, "")
}

output "payment-maven-dev-local" {
  value = try(artifactory_local_maven_repository.this[0].key, "")
}