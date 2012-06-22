#!/bin/bash 

# some code copied from http://www.lowendbox.com/blog/wordpress-cheap-vps-lowendscript/
    
    if [ -z "$1" ]
    then
        echo "Usage: setup-vhost <hostname> (without the www. prefix)"
exit    
fi

    # Checking Permissions and making directorys
    mkdir "/var/www/$1"
    chown root:root -R "/var/www/$1"

      # Setting up Nginx mapping
    cat > "/etc/nginx/conf.d/$1.conf" <<END
server {
    server_name $1 www.$1;
    root /var/www/$1;
    include php;
    access_log  /var/www/$1-access.log;
    error_log  /var/www/$1-error.log;   
   
      
    
}
END
    service nginx reload

echo vhost created successfully, upload files to /var/www/$1


