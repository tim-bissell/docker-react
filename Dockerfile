FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

EXPOSE 80
# used by travis to expose port
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default runs nginx
