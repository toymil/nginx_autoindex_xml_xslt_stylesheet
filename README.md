## Improvements over the default nginx autoindex html

- no stupid datetime format
- better mobile experience (thanks to the `viewport` meta tag)

## How to use

- Download file `autoindex.xslt` to your server (you may rename it how you want).
- Put the content of file `location.conf` in your nginx config, **read the file and make necessary modifications first**.

## File/Directory permissions

Nginx is probably running as `www-data:www-data` (you can find the exact user in nginx config, on debian it is `/etc/nginx/nginx.conf`).  Let's assume the files and directories you want to expose is owned by `you:youg`, then the recommended practice is:

- add user `www-data` to group `youg`: `usermod -aG youg www-data`
- for the files you want to expose, make sure the group permission has read: `.___r--___`
- for directories it is `d___r-x___`
- if you want to prevent the _listing_ of a directory but still want to be able to access its content when providing the exact path, set it to `d___--x___` (remove the read bit, keep the execute bit)
