FROM mysql:8

ENV MYSQL_DATABASE=mydb
ENV MYSQL_ROOT_PASSWORD=rootpw

RUN echo "*** install python dependencies ***" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 python-dev python3-dev python3-setuptools \
    build-essential libssl-dev libffi-dev \
    libxml2-dev libxslt1-dev zlib1g-dev \
    python-pip python3-pip libmysqlclient-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip

# Install your dependencies here
WORKDIR /src
ADD ./src /src
RUN echo "*** install project dependencies ***" && \
    pip install -r requirements.pip

RUN find -type d -name __pycache__ -prune -exec rm -rf {} \; && \
    rm -rf ~/.cache/pip 

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY project-related-commands.sh /
RUN chmod +x /project-related-commands.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
EXPOSE 8000 