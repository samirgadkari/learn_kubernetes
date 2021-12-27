bucketstatus=$(aws s3api head-bucket --bucket "${BUCKET_NAME}" 2>&1)
if echo "${bucketstatus}" | grep 'Not Found';
then
  echo "bucket doesn't exist";
elif echo "${bucketstatus}" | grep 'Forbidden';
then
  echo "Bucket exists but not owned"
elif echo "${bucketstatus}" | grep 'Bad Request';
then
  echo "Bucket name specified is less than 3 or greater than 63 characters"
else
  echo "Bucket owned and exists";
fi
