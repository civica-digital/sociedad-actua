FROM phusion/passenger-ruby22
MAINTAINER "Miguel Angel Gordian"

ENV HOME /root

CMD ["/sbin/my_init"]
RUN ruby-switch --set ruby2.2

USER app

WORKDIR /home/app/sociedad_actua

ADD . /home/app/sociedad_actua
ADD docker/database.yml /home/app/sociedad_actua/config/database.yml

USER root

ADD docker/actua.conf /etc/nginx/sites-enabled/
ADD docker/00_app_env.conf /etc/nginx/conf.d/
ADD docker/actua-env.conf /etc/nginx/main.d/

RUN bundle install
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
RUN chown -R app:app /home/app/sociedad_actua
RUN ln -sf /proc/self/fd /dev/

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
