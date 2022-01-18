FROM node:14.18.1-alpine As build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build  

FROM nginx:1.14-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/cad /usr/share/nginx/html
