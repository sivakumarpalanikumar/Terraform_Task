resource "aws_s3_bucket" "siva" {
    bucket = "${var.bucket_name}" 
    
}

resource "aws_s3_bucket_acl" "sivakumar" {
 bucket = aws_s3_bucket.siva.id    
acl = "private" 
}
