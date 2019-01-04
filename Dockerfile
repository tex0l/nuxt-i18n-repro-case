FROM node:latest
RUN mkdir /website/
COPY . /website/
WORKDIR /website/
RUN npm install
RUN npm run generate

FROM nginx:latest
COPY --from=0 /website/dist/ /usr/share/nginx/html/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
