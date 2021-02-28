# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm i

RUN npm run build:prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/browser /usr/share/nginx/html