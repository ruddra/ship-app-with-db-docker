FROM mysql:8
ENV MYSQL_ROOT_PASSWORD 'mypassword'

RUN echo "*** install python dependencies ***" && \
    apt-get update \
    && apt-get install -y python3-pip python3-dev libmysqlclient-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip

# Install your dependencies here
WORKDIR /src
ADD ./src /src
RUN pip install -r requirements.pip

RUN find -type d -name __pycache__ -prune -exec rm -rf {} \; && \
    rm -rf ~/.cache/pip 


COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
# entrypoint
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
# expose port necessary for your project
EXPOSE 5000