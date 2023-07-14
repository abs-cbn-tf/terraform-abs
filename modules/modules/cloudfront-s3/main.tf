provider "aws" {
   region = "us-east-1"
   profile = "abs"
}


module "site_origin_cloudfront" {
  source      = "./modules/site_origin_cloudfront"
  bucket_name = "site-origin-003"
  tags = {
    environment = "labs"
  }
}



module "site_origin_cloudfront2" {
  source      = "./modules/site_origin_cloudfront"
  bucket_name = "site-origin-004"
  tags = {
    environment = "labs"
  }
}
