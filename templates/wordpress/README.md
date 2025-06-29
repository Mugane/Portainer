# Naked WordPress

This is wordpress without MySQL or MariaDB - you'll need to set up a database server separately. This seems like an obvious choice since there is almost never any point running multiple database containers when a single container can adequately support multiple databases, and since this mutli-tenant capability is often desirable for development environments (and even certain production systems where a single hosting provider/developer is solely responsible for managing multiple installations). 

## Notes
- ImageMagick is being difficult (normal install is causing a lot of issues), so has been removed pending local (off-repo) troubleshooting.

## Compatibility
- This template has been tested with PHP 8.4. It has not been tested with any other PHP version (yet).
