FROM ruby:alpine3.12
RUN gem install jwt && \
    apk add jq && \
    apk add curl
COPY generate-jwt.rb get-installation-token.sh /
ENTRYPOINT ["/get-installation-token.sh"]
