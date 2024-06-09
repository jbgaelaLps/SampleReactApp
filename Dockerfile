# Stage 1: Build
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Run
FROM nginx:alpine

# Create necessary directories and set correct permissions
RUN mkdir -p /var/cache/nginx/client_temp \
    && chown -R nginx:nginx /var/cache/nginx

COPY --from=build /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Use a non-root user but ensure permissions are set correctly
USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
