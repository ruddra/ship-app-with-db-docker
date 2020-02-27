FROM postgres:12-alpine

ENV POSTGRES_USER "solrwrapper"
ENV POSTGRES_DB "solrwrapper"
ENV POSTGRES_PASSWORD "solrwrapper"
ENV POSTGRES_PORT "5432"
ENV POSTGRES_HOST "localhost"

ENV LANG C.UTF-8
RUN { \
    echo '#!/bin/sh'; \
    echo 'set -e'; \
    echo; \
    echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home \
    && chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u131
ENV JAVA_ALPINE_VERSION 8.242.08-r0

RUN set -x \
    && apk add --no-cache \
    openjdk8="$JAVA_ALPINE_VERSION" \
    && [ "$JAVA_HOME" = "$(docker-java-home)" ]

WORKDIR /src
ADD your-project-jar.jar /src/runable.jar
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["postgres"]
EXPOSE 8989