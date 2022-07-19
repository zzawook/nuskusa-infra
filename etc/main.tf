module "ecr_repos" {
    count  = length(local.repo_name)
    source = "terraform-aws-modules/ecr/aws"
    region = local.region

  repository_name = local.repo_name[count.index]
  repository_type = "private"

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 5 images"
        selection = {
          tagStatus     = "any"
          countType     = "imageCountMoreThan"
          countNumber   = 5
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}
