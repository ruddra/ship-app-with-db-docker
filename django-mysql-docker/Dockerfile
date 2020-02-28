FROM mysql:8
ENV MYSQL_ROOT_PASSWORD 'mypassword'

RUN echo "*** install python dependencies ***" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 python-dev python3-dev \
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


COPY my-entry-point.sh /
RUN chmod +x /my-entry-point.sh
# not necessary if you are planning to run commands without a script file
COPY project-related-commands.sh /
RUN chmod +x /project-related-commands.sh
# entrypoint
ENTRYPOINT ["/my-entry-point.sh"]
CMD ["mysqld"]
# expose port necessary for your project
EXPOSE 8000 