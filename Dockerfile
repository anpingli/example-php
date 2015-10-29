FROM openshift3/php-55-rhel7:latest
USER default
EXPOSE 8080
COPY . /opt/openshift/src/
CMD ["./run.sh"]
