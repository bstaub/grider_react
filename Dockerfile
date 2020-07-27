# Multistep Temp Container
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
#CMD ["npm", "run", "build"]


# Just getting source from app/build directory in new image, the rest will be skipped from alpine
# https://hub.docker.com/_/nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
