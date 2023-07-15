FROM node:18.13

ARG OUTER_GROUP
WORKDIR /workspace

COPY . .
RUN npm ci
#RUN npm run build

RUN groupadd --force -g $OUTER_GROUP developer
RUN useradd -ms /bin/bash --no-user-group -g $OUTER_GROUP -u 1713 developer

#EXPOSE 3000
COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
