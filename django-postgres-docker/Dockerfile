FROM postgres:12-alpine

ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true

ENV POSTGRES_USERNAME 'postgres'
ENV POSTGRES_PASSWORD 'postgres'
ENV POSTGRES_DB 'postgres'

RUN echo "*** install python dependencies ***" && \
    apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN apk update && apk add --no-cache \
    postgresql \
    zlib \
    jpeg 

RUN apk add --no-cache --virtual build-deps \
    gcc \  
    python3-dev \ 
    musl-dev \
    postgresql-dev\
    zlib-dev \
    jpeg-dev 


RUN echo "*** install project dependencies ***"
WORKDIR /src
ADD ./src /src
RUN pip install -r requirements.pip

RUN apk del build-deps && \
    find -type d -name __pycache__ -prune -exec rm -rf {} \; && \
    rm -rf ~/.cache/pip 

RUN echo "*** docker setup ***"
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
# not necessary if you are planning to run commands without a script file
COPY project-related-commands.sh /
RUN chmod +x /project-related-commands.sh
# entrypoint
ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]
# expose port necessary for your project
EXPOSE 8000 