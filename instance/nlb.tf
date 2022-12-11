module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "nuskusa-nlb"

  load_balancer_type = "network"

  vpc_id             = local.vpc_id
  subnets            = local.subnet_ids

  target_groups = [
    {
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        nuskusa_main = {
          target_id = module.ec2-single-instance.id
          port = 80
        }  
      }
    },
    {
      backend_protocol = "TCP"
      backend_port     = 8000
      target_type      = "instance"
      targets = {
        nuskusa_main = {
          target_id = module.ec2-single-instance.id
          port = 8000
        }  
      }
    },
    {
      backend_protocol = "TCP"
      backend_port     = 8080
      target_type      = "instance"
      targets = {
        nuskusa_main = {
          target_id = module.ec2-single-instance.id
          port = 8080
        }  
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 0
    },
    {
      port               = 8000
      protocol           = "TLS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 1
    },
    {
      port               = 8080
      protocol           = "TLS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 2
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Prod"
  }
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "nuskoreasociety.org"
  zone_id      = module.zones.route53_zone_zone_id["nuskoreasociety.org"]

  subject_alternative_names = [#"*.my-domain.com"
    ]

#  create_route53_records = false
#  validation_record_fqdns = [   
#    "nuskoreasociety.org"
#  ]

  wait_for_validation = true

  tags = {
    Name = "nuskoreasociety.org"
  }
}
