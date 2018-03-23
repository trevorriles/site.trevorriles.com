deploy:
ifdef AWS_ACCESS_KEY_ID
	aws --version

	aws s3 sync ./public/ s3://$(S3_BUCKET)/ \
	--acl public-read --delete --content-type text/html --exclude 'assets'

	aws s3 sync ./public/assets/ s3://$(S3_BUCKET)/assets/ \
	--acl public-read --delete --follow-symlinks
else
	# No aws
endif
