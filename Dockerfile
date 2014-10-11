
##
# Our base container image contains:
#  * phusion/baseimage (https://github.com/phusion/baseimage-docker)
#  * heroku cedar-14 stack packages (https://github.com/heroku/stack-images)
##
FROM phusion/baseimage:0.9.15

MAINTAINER Iskandar N <iskandar@hellomatter.com>

# Set up the cedarish stack
# @see https://github.com/progrium/cedarish
# @TODO Fork heroku/stack-images for safety
RUN curl -sf -o /tmp/build.sh -L https://raw.githubusercontent.com/heroku/stack-images/master/bin/cedar-14.sh

# Run build script
# Clean up APT when done.
RUN chmod +x /tmp/build.sh && \
    sleep 1 && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive /tmp/build.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

