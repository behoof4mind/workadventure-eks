output "cluster_id" {
  value       = module.webserver_cluster.cluster_id
}

output "cluster_endpoint" {
  value       = module.webserver_cluster.cluster_endpoint
}

output "cluster_security_group_id" {
  value       = module.webserver_cluster.cluster_security_group_id
}

output "kubectl_config" {
  value       = module.webserver_cluster.kubectl_config
}

output "config_map_aws_auth" {
  value       = module.webserver_cluster.config_map_aws_auth
}

output "region" {
  value       = module.webserver_cluster.region
}

output "cluster_name" {
  value       = module.webserver_cluster.cluster_name
}