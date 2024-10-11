FROM ubuntu

LABEL maintainer="https://github.com/kazvee"

USER root

# Copy the entrypoint script to the root directory
COPY ./entrypoint.bash /

# Update package list
RUN apt -y update

# Install curl and bash
RUN apt -y install curl bash

# Set execute permissions on the entrypoint script
RUN chmod 755 /entrypoint.bash

# Switch to a non-root user for better security
USER nobody

# Use the entrypoint script to start the container
# Could also use CMD command for this
ENTRYPOINT [ "/entrypoint.bash" ]