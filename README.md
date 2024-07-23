# Dockerized Portainer

### Why?

This is a dockerized version of Portainer that can be trivially run. App templates include forms to facilitate managing deployment parameters (unlike custom app templates)

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

### Portainer Stack templates

This repo also contains custom portainer templates, you can install them after running Portainer by switching the App Templates URL (under [Settings](http://localhost:9000/#!/settings)) to `https://raw.githubusercontent.com/Mugane/Portainer/main/templates.json`

Additional templates may be found by using this URL for the templates target: `https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json`

### Modifying the templates

See [Portainer Documentation](https://docs.portainer.io/advanced/app-templates/format) for format descriptions.

If present, DO NOT modify `templates.json` directly, it will be overwritten. Edit the json and optional docker-compose.yml files under the `templates` folder, then run the `collate.sh` script to regenerate the template.json file with the full list of templates. 

By convention the `./templates/name.json` file and the optional `./templates/name/docker-compose.yml` folder use the same `name` for clarity. It is dash-separated, lowercase and describes the primary nature of the template contents. 