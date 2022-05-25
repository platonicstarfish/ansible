server {
	# Mirror https://regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com/

	listen 80;
	listen 443;
	listen [::]:80;
	listen [::]:443;

	server_name regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com;

	root /var/www/regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com;
	index index.html;
	autoindex on;
}

