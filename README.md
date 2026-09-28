# Dockerized Portainer

## Why?

This is a dockerized version of Portainer with custom templates that can be trivially run. 

Author(s) have no interest in maintaining custom docker images for anything, everything is just done in docker compose for simplicity. No registries, no hosting, no DOCKERFILES, just run the compose file and it builds.

Portainer app templates include forms to facilitate managing deployment parameters (unlike Portainer custom app templates).

Reverse proxy versions of some public services are provided to facilitate domain mapping and SSL certificate management.

This is a fairly new repo and will be updated frequently. The goal is to establish a set of core templates for rapid containerized development or production deployments. 

#### Running Portianer

Prerequisites: You will need docker installed and either curl/wget or git.

1. Run directly

    To run portianer directly without cloning this repository, navigate to the folder where you want to base your container mounts and run:
    ```
    # Download the Docker Compose file from the specified URL
    curl -o docker-compose.yml https://raw.githubusercontent.com/Mugane/Portainer/main/docker-compose.yml
    
    # Run Docker Compose using the downloaded file
    docker compose up -d
    ```

2. Clone & Run
    ```
    # Clone the repository
    git clone https://github.com/Mugane/Portainer.git
    
    # Change directory to the cloned repository
    cd Portainer
    
    # Run Docker Compose
    docker compose up -d
    ```

## Portainer Stack templates

This repo contains custom portainer templates, you can install them after running Portainer by switching the App Templates URL (under [Settings](http://localhost:9000/#!/settings)) to (https://mugane.github.io/Portainer/templates.json)

Commits to the `main` branch automatically trigger the collate.sh script to generate and publish the final `templates.json` file to [GitHub Pages](https://mugane.github.io/Portainer/templates.json). `templates.json` is not present in the `main` branch to avoid confusion when making source updates.

While templates are being developed and customized, you might find additional useful templates using this URL for the templates target: `https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json`

## Modifying the templates

See [Portainer Documentation](https://docs.portainer.io/advanced/app-templates/format) for format descriptions.

Edit the json and optional docker-compose.yml files under the `templates` folder. To test locally, run the `collate.sh` script to regenerate the template.json file with the full list of templates. On windows you can set up a watch by running the `monitor.ps1` script in PowerShell:
    - Open PowerShell as Administrator, navigate to the Portainer repo folder and run:
    ```
    docker run -d -v ${PWD}:/usr/share/nginx/html -p 8080:80 --name portemp nginx:latest
    Set-ExecutionPolicy RemoteSigned -Scope Process
    .\monitor.ps1
    ```
    - Use [http://localhost:8080/templates.json](http://localhost:8080/templates.json) for the templates url in your local Portainer settings. If you can't open that in a browser, try [http://http://172.17.0.1:8080/templates.json](http://172.17.0.1:8080/templates.json) 

By convention the `./templates/name.json` file and the optional `./templates/name/docker-compose.yml` folder use the same `name` for clarity. It is dash-separated, lowercase and describes the primary nature of the template contents. 

In order to test local `./templates/name/docker-compose.yml` and `./templates/name/Dockerfile` files, you'll need to specify a Git repository url in the `./templates/name.json` file ("repository" section). It's a bit tedious - you need a local Git HTTP SERVER to do this. The [https://mugane.github.io/Portainer/templates.json](https://mugane.github.io/Portainer/templates.json) library contains a simple single-repo server exactly for this reason. The template name is `Git HTTP Server (Alpine)`. Point it at your Portainer folder and fire it up prior to starting debugging, and it will provide the endpoint for your local template tests. You should verify that the collate.sh script is updated to use whatever your local docker IP/Port is, if you do not use the defaults below:

<img width="1240" height="686" alt="image" src="https://github.com/user-attachments/assets/bec11f1c-dc7b-49c9-ae99-21fea03fd378" />


## Wish list

The following containers would be nice to have.

From Lissy: Caddy, CrateDB, Drupal, Elasticsearch, Ghost, Httpd, Jenkins, Ironfunctions, Joomla, Magento, Minio, Mongo, Plone, PostgreSQL, Redis, Registry, Scality S3, Solr, Urbackup, Blender, Boinc, Gitqlient, Ubuntu, OPC router, softing edgeConnector containers Apache Httpd, influxdb, freescout, wger, [dockge](https://www.youtube.com/watch?v=HEklvsr7q54), [Activepieces](https://www.youtube.com/watch?v=MRm75uTf_A4), [Plane PM](https://www.youtube.com/watch?v=HqKvfDZICBA), [Flowise AI](https://www.youtube.com/watch?v=03RBE72lNf8), [Ory Kratos](https://www.youtube.com/watch?v=T-UPdN1hxKA), umami.is, mamoto,

Other: Geany, Home Assistant, Jellyfin, Open-Webui, Ollama, Bolt.diy, WireGuard
