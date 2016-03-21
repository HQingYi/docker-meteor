FROM debian:wheezy

RUN apt-get update --force-yes
RUN apt-get install -y curl bzip2 build-essential python 

# Install Node
NODE_VERSION=0.10.43
NODE_ARCH=x64
NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}
cd /tmp
curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
tar xvzf ${NODE_DIST}.tar.gz
rm -rf /opt/nodejs
mv ${NODE_DIST} /opt/nodejs
ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm
rm -rf /tmp/*

# Install Meteor
RUN curl https://install.meteor.com/ | sh

# Install entrypoint
RUN mkdir -p /usr/app/{bundle,config}
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD []