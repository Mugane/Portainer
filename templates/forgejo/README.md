# Forgejo

Forgejo is the most-open-sourcy of the variations of Gogs/Gitea, which paywalls features in their enterprise edition.

## Setup

To install, set a host persistent data folder, and accept or adjust the port configuration. 

This is an opinionated install that uses PostgreSQL as its data store, for potential production use (scaling is limited with the default SQLite3 file-based store). A password for PostgreSQL is ****automatically generated**** into the `[persistent folder]/secrets/postgres_password` file, and this value is automaticaly populated into the Forgejo initialization form (`http://localhost:8939`).