FROM ruby:alpine3.12
WORKDIR /action
RUN gem install jwt && \
    apk add jq && \
    apk add curl
COPY generate-jwt.rb get-installation-token.sh ./
ENTRYPOINT ["/action/get-installation-token.sh"]