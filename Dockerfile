FROM openshift/php-55-rhel7
USER default
EXPOSE 8080
COPY . /opt/openshift/src/
CMD ["./run.sh"]
