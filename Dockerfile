FROM virt-openshift-05.lab.eng.nay.redhat.com:5000/openshift3/php-55-rhel7
USER default
EXPOSE 8080
COPY . /opt/openshift/src/
CMD ["./run.sh"]
