# to create random string for s3 bucket

resource "random_id" "rng" {
  keepers = {
    first = "${timestamp()}"
  }     
  byte_length = 8
}
resource "aws_s3_bucket_public_access_block" "s3" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls   = false
  block_public_policy = false
}
resource "aws_s3_bucket" "s3" {
  bucket = "sudhamsh${random_id.rng.hex}"
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
output "S3_Bucket"{
    value = aws_s3_bucket.s3.bucket
}