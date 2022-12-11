module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "nuskoreasociety.org" = {
      comment = "terraform-aws-modules-nuskoreasociety.org (production)"
      }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = module.zones.route53_zone_name["nuskoreasociety.org"] # aws_route53domains_registered_domain.nuskoreasociety.id

  records = [
    {
      name    = ""
      type    = "A"
      alias = {
        name = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name = "" 
      type = "AAAA" 
      alias = {
        name = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name    = "www"
      type    = "A"
      alias = {
        name = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    },
    {
      name    = "www"
      type    = "AAAA"
      alias = {
        name = module.alb.lb_dns_name
        zone_id = module.alb.lb_zone_id
      }
    }
  ]
}

# resource "aws_route53domains_registered_domain" "nuskoreasociety" {
#  domain_name = "nuskoreasociety.org"
#
#  name_server {
#    name = "ns-195.awsdns-24.com"
#  }
#
#  name_server {
#    name = "ns-874.awsdns-45.net"
#  }
# }
