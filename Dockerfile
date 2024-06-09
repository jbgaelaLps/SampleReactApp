# Stage 1: Build
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Run
FROM nginxinc/nginx-unprivileged:bookworm-perl

# Copy the built files from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

# No need to change ownership as we are using unprivileged Nginx which already handles permissions properly
# USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
