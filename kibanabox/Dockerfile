# Docker image to run Kibana on nginx
FROM progrium/busybox
MAINTAINER Ilkka Anttonen version: 0.1
# Install nginx and create the necessary folders
RUN opkg-install nginx
RUN mkdir /usr/html
RUN mkdir /var/lib/nginx
# Install Kibana
RUN (cd /tmp && wget --no-check-certificate http://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.zip -O pkg.zip && unzip pkg.zip && cd kibana-* && cp -rf ./* /usr/html/)
RUN rm -rf /tmp/*
RUN mv /usr/html/app/dashboards/logstash.json /usr/html/app/dashboards/default.json
# Set up log redirection
RUN mkdir -p /var/log/nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
# Start kibana
CMD ["nginx", "-g", "daemon off;"]
