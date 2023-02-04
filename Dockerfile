# FROM node:alpine AS builder
# WORKDIR /ang
# COPY . .
# RUN npm i
# RUN npm run build


# FROM nginx:alpine
# WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
# COPY --from=builder /ang/dist/angular-app .
# # RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# # ENTRYPOINT sudo nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
# ENTRYPOINT [ "nginx", "-g","daemon-off;" ]

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
EXPOSE 4200
CMD npm run start