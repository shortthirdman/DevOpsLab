docker volume create grafana-storage

docker run -d --name grafana -p 3000:3000 -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource,grafana-image-renderer" -e "GF_LOG_MODE=console file" -e GF_PLUGIN_GRAFANA_IMAGE_RENDERER_RENDERING_IGNORE_HTTPS_ERRORS=true --restart on-failure --log-opt max-size=1g grafana/grafana-enterprise:8.2.6


docker run -d --name grafana -p 3000:3000 -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource,grafana-image-renderer" -e "GF_LOG_MODE=console file" -e GF_PLUGIN_GRAFANA_IMAGE_RENDERER_RENDERING_IGNORE_HTTPS_ERRORS=true -v grafana-storage:/var/lib/grafana --restart on-failure --log-opt max-size=1g grafana/grafana-enterprise:8.2.6