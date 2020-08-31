## S3 Bucket for Images

resource "aws_s3_bucket" "s3_image_store" {
        bucket = var.bucket_name
        acl = var.bucket_acl
        tags = {
                Name = "WebPage Image Source"

        }
        force_destroy = var.force_destroy_bucket
}


## Downloading the code for deployment
resource "null_resource" "download_website_code" {
        depends_on = [
                aws_s3_bucket.s3_image_store,
        ]
        
	provisioner local-exec {
                command = "rm -rf demo_website"
		on_failure = continue
        }

	provisioner local-exec {
                command = "git clone https://github.com/riteshsoni10/demo_website.git "
        }

}



# Upload all the website images to S3 bucket
resource "aws_s3_bucket_object" "website_files" {
        depends_on = [
                null_resource.download_website_code,
        ]
        for_each      = fileset("demo_website/images/", "**/*.*")
        bucket        = aws_s3_bucket.s3_image_store.bucket
        key           = replace(each.value, "demo_website/images/", "")
        source        = "demo_website/images/${each.value}"
        acl           = "public-read"
        etag          = filemd5("demo_website/images/${each.value}")
}

