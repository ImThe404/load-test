FROM python:2.7

# Met à jour pip compatible Python 2
RUN pip install --upgrade pip==19.3.1

# Installe Locust et dépendances
RUN pip install pyzmq locustio faker

ADD locustfile.py /config/locustfile.py
ADD runLocust.sh /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py

EXPOSE 8089

ENTRYPOINT ["/usr/local/bin/runLocust.sh"]
