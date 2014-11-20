#!/bin/bash
# First the basefilebox
docker rm basefilebox
docker rmi sirile/basefilebox
docker run --name=basefilebox sirile/basefilebox
# Then nodefilebox
docker rm nodejsfilebox
docker rmi sirile/nodejsfilebox
docker run --name=nodejsfilebox sirile/nodejsfilebox
# Javafilebox
docker rm java8filebox
docker rmi sirile/java8filebox
docker run --name=java8filebox sirile/java8filebox
# Jettyfilebox
docker rm jettyfilebox
docker rmi sirile/jettyfilebox
docker run --name=jettyfilebox sirile/jettyfilebox
