FROM node:18 AS builder

WORKDIR /build

COPY . .

RUN npm i
RUN npm run build

FROM jawg/nginx-spa:latest

COPY --from=builder /build/dist /usr/share/nginx/html
RUN chmod -R 777 /usr/share/nginx/html