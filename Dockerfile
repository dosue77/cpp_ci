#############################################################
# Dockerfile .
# ubuntu Image
#############################################################
FROM ubuntu

# Maintainer of the file
MAINTAINER Josué Vidal

# Install the requered packages.
RUN apt-get update
RUN apt-get install -y build-essential libgtest-dev cmake zip wget

WORKDIR /usr/src/gtest

RUN cmake .
RUN make
RUN mv libg* /usr/lib/

WORKDIR /tmp

RUN wget https://github.com/google/googletest/archive/release-1.7.0.zip
RUN unzip release-1.7.0.zip
RUN rm release-1.7.0.zip
RUN wget https://github.com/google/googlemock/archive/release-1.7.0.zip
RUN unzip release-1.7.0.zip
RUN rm release-1.7.0.zip
RUN mv googletest-release-1.7.0 gtest

WORKDIR /tmp/googlemock-release-1.7.0

RUN cmake .	
RUN make
RUN mv libg* /usr/lib/
RUN cp -r ./include/gmock /usr/include/gmock

# Define volume

VOLUME /workspace

# Work directory
WORKDIR /workspace

COPY entrypoint.sh /entrypoint.sh

ENV PROJ=
ENV TARGET=

ENTRYPOINT "/entrypoint.sh" ${PROJ} ${TARGET}
#CMD [$PROJ, $TARGET]
