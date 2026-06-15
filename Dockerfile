FROM node:lts-alpine

WORKDIR /app

# Copier uniquement les fichiers de dépendances d'abord (cache Docker)
COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

# Copier le reste du code
COPY . .

EXPOSE 3000

CMD ["yarn", "dev"]