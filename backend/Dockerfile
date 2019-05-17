FROM tenna/nodejs:latest
MAINTAINER  Peter L. Berghold <pberghold@tenna.com>

RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
     apt-get -y dist-upgrade && \
     apt-get -y install git

WORKDIR /opt/tenna-crud

COPY ./backend/ /opt/tenna-crud/
COPY ./env/DOT.env /opt/tenna-crud/.env

RUN npm install --quiet

EXPOSE 3000

ENV WAITFORIT_VERSION="v2.4.1"
ENV GITHUB_REPO="https://github.com/maxcnunes"
ENV WAIT4IT="waitforit-linux_amd64"
ENV REL_PATH="/waitforit/releases/download/${WAITFORIT_VERSION}/${WAIT4IT}"
ENV WAIT4ITURL="${GITHUB_REPO}/${REL_PATH}"
RUN curl -o /usr/local/bin/waitforit -sSL  ${WAIT4ITURL} && \
    chmod +x /usr/local/bin/waitforit

COPY host_function.sh /opt/puppetlabs/facter/facts.d/host_function.sh
RUN chmod 755 /opt/puppetlabs/facter/facts.d/host_function.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
