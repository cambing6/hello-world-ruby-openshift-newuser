FROM registry.access.redhat.com/ubi8/ruby-27

USER root
RUN groupadd -g 1000720000 appgrp && useradd -l -r -d /home/appuser -u 1000720000 -g appgrp appuser && chown -R appuser:appgrp /opt/ibm && chown -R appuser:appgrp /logs
USER appuser

EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
ENV GEM_HOME ~/.gem
RUN bundle install
CMD ["./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER appuser
