FROM registry.access.redhat.com/ubi8/ruby-27
RUN addgroup -S appusr && adduser -S appusr -G appusr 
USER appusr
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
ENV GEM_HOME ~/.gem
RUN bundle install
CMD ["./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER appusr
