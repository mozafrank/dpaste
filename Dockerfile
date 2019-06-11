FROM debian:buster

RUN apt update && apt install -y python3-django python3-pip npm libmariadb-dev-compat libmariadb-dev && apt clean
#RUN apt update && apt install -y python3-django python3-pip npm libmysqlclient-dev && apt clean

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build && \
    pip3 install dpaste django-sslserver mysqlclient && \
    pip3 install .

CMD [ "/app/entrypoint.sh" ]