FROM debian:stable-slim

# Add local node user as defined in the node:12 Dockerfile
# https://github.com/nodejs/docker-node/blob/fdd2b251827817ac7bb4f0b2b082483abff8ea77/12/buster/Dockerfile
RUN groupadd --gid 1000 node && \
     useradd --uid 1000 --gid node --shell /bin/bash --create-home node

# Install Chromium, npm, nodejs (and tidy up the image to keep it small)
RUN apt-get update --yes && \
    apt-get install --yes chromium nodejs yarnpkg jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/bin/chromium /usr/bin/chromium-browser && \
    ln -s /usr/bin/yarnpkg /usr/bin/yarn

USER node
WORKDIR /home/node

# Install the major packages globally, so not done every time we use the image
COPY set_yarn_links.sh .
RUN chmod +x ./set_yarn_links.sh && \
    ./set_yarn_links.sh && \
    rm ./set_yarn_links.sh 
