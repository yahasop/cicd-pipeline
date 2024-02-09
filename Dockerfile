FROM node:21.6.1
WORKDIR /opt
ADD . /opt
RUN apt update -y
RUN npm install
ENTRYPOINT npm run start
