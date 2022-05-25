server {
	# Mirror http://archive.ubuntu.com/ubuntu/pool/

	listen 80;
	listen [::]:80;

	server_name archive.ubuntu.com ~.*.archive.ubuntu.com$ security.ubuntu.com;

	root /var/www/archive.ubuntu.com;
	index index.html;
	autoindex on;
}

