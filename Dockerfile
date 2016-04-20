FROM ruby:2.2.4-slim
MAINTAINER Micheal Waltz <ecliptik@gmail.com>

#Set environment vars
ENV APP_DIR=/app \
    AWS_REGION=us-east-1 \
    DOCKER_ENV=true \
    LANG=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    RAILS_ENV=production \
    DEBIAN_FRONTEND=noninteractive

#Rails port
EXPOSE 3000

# Copy Gemfile for gem install
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
COPY Gemfile ${APP_DIR}

# Install packages
RUN set -ex && \
        buildDeps=' \
                build-essential \
                libpq-dev \
        ' && \
        runDeps=' \
                postgresql-client \
                libpq5 \
        ' && \
        apt-get update && \
        apt-get install -y --no-install-recommends $buildDeps $runDeps && \
        getent hosts rubygems.org && \
        bundle package --all && \
        bundle install --jobs 5 --without test development --local --system --binstubs && \
        apt-get purge -y --auto-remove $buildDeps && \
        rm -rf /var/lib/apt/lists/*

# Copy the app after building gems
COPY . ${APP_DIR}

# App command
ENTRYPOINT [ "bundle" ]
CMD [ "exec", "rails", "server" ]
