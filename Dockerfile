
FROM node:alpine


WORKDIR /usr/app


RUN apk add --no-cache openssh-client git

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts


RUN --mount=type=ssh git clone git@github.com:PaulinaSulek/Spr1.git 

WORKDIR /usr/app/Spr1

RUN npm install

CMD ["npm", "start"]