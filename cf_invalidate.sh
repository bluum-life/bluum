export TIMESTAMP=$(date +%s)
sed -e 's/\[\[TIMESTAMP\]\]/'${TIMESTAMP}'/g' aws_invbatch.json.tpl > aws_invbatch.json
aws configure set preview.cloudfront true
aws cloudfront create-invalidation --invalidation-batch file://aws_invbatch.json --distribution-id $CLOUDFRONT_DISTRIBUTION_ID

