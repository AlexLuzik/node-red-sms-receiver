FROM nodered/node-red

# Устанавливаем дополнительные модули
RUN npm install --unsafe-perm --no-progress --no-fund \
    node-red-contrib-postgresql \
    node-red-contrib-telegrambot