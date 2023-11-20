FROM node:16-alpine as base

FROM base as builder

# Set working directory to /app
WORKDIR /app
# Copy package.json file to /app
COPY package.json .
# Install dependencies based on package.json
RUN npm install
# Copy the rest of the application 
COPY . .
# Build the applicaiton 
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html





