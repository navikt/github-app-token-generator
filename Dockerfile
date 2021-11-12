FROM ruby:alpine3.12
WORKDIR /action
RUN gem install jwt && \
    apk add jq && \
    apk add curl
COPY generate_jwt.rb get-installation-access-token.sh ./
ENTRYPOINT ["/action/get-installation-access-token.sh"]
