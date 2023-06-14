#build stage
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json /app
RUN npm install
COPY . .
RUN npm run build


#run stage
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html


