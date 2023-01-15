### STAGE 1: Build ###
FROM node:16-alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm","run","start"]

### STAGE 2: Run ###
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html