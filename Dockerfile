FROM node:12

# Install requirements for chromium in the node:10 distribution (Debian 9 Stretch)
RUN set -ex \
	&& apt-get update \
	&& apt-get -q install -y -V \
		libx11-xcb1 libxtst6 libnss3 libxss1 libasound2 libgtk-3-0 \
	&& rm -rf /var/lib/apt/lists/*

# Expose necessary ports:
# dashboard:
EXPOSE 4000
# webservice:
EXPOSE 3000

# Run as "node" to avoid security complaints from node and co
USER node
WORKDIR /home/node

# Clone current pa11y-dashboard and install all depenencies (which include pa11y itself and pa11y-webservice)
RUN git clone https://github.com/pa11y/pa11y-dashboard.git pa11y-dashboard \
	&& cd pa11y-dashboard \
	&& npm install

# Configure for our docker environment with "production" settings
ADD patty-dashboard.production.json pa11y-dashboard/config/production.json
ENV NODE_ENV production

#COPY docker-entrypoint.sh entrypoint.sh

WORKDIR pa11y-dashboard
CMD ["start"]
ENTRYPOINT ["npm"]
