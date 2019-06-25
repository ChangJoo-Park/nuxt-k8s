FROM node:10
WORKDIR /app
ADD . /app/

# Browserslist 문제가 있음
RUN rm package-lock.json

RUN npm install
RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "npm", "start" ]
