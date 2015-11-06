FROM openshift3/php-55-rhel7:v3.0.1.0
USER default
EXPOSE 8080
COPY . /opt/openshift/src/
CMD ["./run.sh"]
