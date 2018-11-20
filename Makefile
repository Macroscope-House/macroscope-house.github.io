# assumes bucket exists and is configured to serve a static website
# assumes awscli is installed and configured

BUCKET := macroscope.house
DISTRIBUTION := E16X68F6EVZ4WP

deploy:
	aws s3 sync . s3://$(BUCKET) --exclude "*" --include "*.html" --include "*.jpg" --include "*.css"
	aws cloudfront create-invalidation --distribution-id $(DISTRIBUTION) --paths '/*'

