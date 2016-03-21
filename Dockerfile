FROM debian:wheezy

RUN apt-get update --force-yes
RUN apt-get install -y curl bzip2 build-essential python 

# Install Node
ADD install_node.sh /opt/install_node.sh
RUN chmod +x /opt/install_node.sh
RUN bash /opt/install_node.sh

# Install Meteor
RUN curl https://install.meteor.com/ | sh

# Install entrypoint
RUN mkdir -p /usr/app/{bundle,config}
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD []