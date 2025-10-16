# ===== Stage 1: Build the Vite app =====
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy all source files and build
COPY . .
RUN npm run build

# ===== Stage 2: Serve with Nginx =====
FROM nginx:alpine

# Copy build output from previous stage to Nginx web root
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
