#Using the more smaller and size image from node 18
FROM node:18-alpine

#Specifying our work directory
WORKDIR /usr/src/app

#Copying dependencies files
COPY package*.json ./

#Installing dependencies
RUN npm ci

#Copying source code to our work directory
COPY . .

#Exposing listening port of the app
EXPOSE 8000

#Initialize app
CMD ["node", "index.js"]

#Healthchecks for the app
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8000/api/users || exit 1