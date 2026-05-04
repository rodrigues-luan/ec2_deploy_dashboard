# descrição: que não serve muito pra nada a não ser essa descrição mesmo
# tipo: na variável pode denifir qualquer tipo pra ela
# default: Se não dedefnir qual valor para o padrão ele ja vai assumir esse descrito
variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t3.micro"
}
