resource "aws_key_pair" "nuskusa_default_key" {
  key_name   = local.keyname
  public_key = local.public_key
}
