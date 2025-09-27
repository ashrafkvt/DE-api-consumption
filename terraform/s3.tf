resource "aws_s3_bucket" "data_lake_bucket" {
  bucket = "api-de-bucket"
}

resource "aws_s3_object" "raw_folder" {
  bucket = aws_s3_bucket.data_lake_bucket.id
  key    = "raw/"
}

resource "aws_s3_object" "raw_movies_folder" {
  bucket = aws_s3_bucket.data_lake_bucket.id
  key    = "raw/movies/"
}

resource "aws_s3_object" "raw_genres_folder" {
  bucket = aws_s3_bucket.data_lake_bucket.id
  key    = "raw/genres/"
}

resource "aws_s3_object" "raw_languages_folder" {
  bucket = aws_s3_bucket.data_lake_bucket.id
  key    = "raw/languages/"
}

resource "aws_s3_object" "processed_folder" {
  bucket = aws_s3_bucket.data_lake_bucket.id
  key    = "processed/"
}