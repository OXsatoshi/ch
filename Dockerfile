FROM node:18

WORKDIR /app

COPY . .

# ✅ Install the correct netcat package
RUN apt-get update && apt-get install -y netcat-openbsd

RUN npm install

COPY wait-for.sh /wait-for.sh
RUN chmod +x /wait-for.sh

CMD ["/wait-for.sh", "db", "5432", "npm", "start"]
