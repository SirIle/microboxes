# Create a docker image to run core services Consul, Elasticsearch, Logstash and Kibana
FROM progrium/busybox
MAINTAINER Ilkka Anttonen version: 0.1
RUN opkg-install nginx
RUN mkdir /usr/html
RUN (cd /tmp && wget --no-check-certificate http://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.zip -O pkg.zip && unzip pkg.zip && cd kibana-* && cp -rf ./* /usr/html/)
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm -rf /tmp/*
