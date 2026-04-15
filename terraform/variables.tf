variable "aws_region" {
	description = "Region AWS de deploiement"
	type        = string
	default     = "eu-west-3"
}

variable "ami_id" {
	description = "AMI Ubuntu a utiliser pour l'instance"
	type        = string
	default     = "ami-0d6b5d3f6f4c5f6aa"
}

variable "instance_type" {
	description = "Type d'instance EC2"
	type        = string
	default     = "t3.micro"
}

variable "key_name" {
	description = "Nom de la cle SSH AWS existante"
	type        = string
}

variable "environment" {
	description = "Nom de l'environnement (ex: dev, staging, prod)"
	type        = string
	default     = "prod"
}
