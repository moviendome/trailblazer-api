FROM seuros/ruby:2.5.1-jemalloc-node
LABEL Description="Traiblazer API"
WORKDIR /app

CMD exec bin/start.sh
