# Node-RED SMS Receiver for Netgear LM1200

![Node-RED SMS Receiver](https://img.shields.io/badge/Node--RED-SMS--Receiver-blue)

This project provides a Node-RED-based system for receiving SMS messages via Netgear LM1200 modems, storing them in a PostgreSQL database, and optionally forwarding them via Telegram.

## 🚀 Features
- 📲 Receives SMS messages using Netgear LM1200 modems
- 📂 Stores messages in a PostgreSQL database
- 📡 Can forward SMS messages to Telegram
- 🐳 Runs in Docker for easy deployment
- 🔄 New modems can be added dynamically using an **inject node** in Node-RED

## 🛠 Prerequisites
- Docker and Docker Compose installed on the host machine
- Netgear LM1200 modem connected and accessible
- A Telegram bot created for notifications
- The chat ID of the Telegram user who will receive SMS messages

## 📥 Installation

1. **Clone this repository:**
   ```sh
   git clone https://github.com/AlexLuzik/node-red-sms-receiver.git
   cd node-red-sms-receiver
   ```

2. **Modify the `docker-compose.yml` file** (if needed) to configure database credentials and timezone.

3. **Start the services using Docker Compose:**
   ```sh
   docker-compose up -d
   ```

4. **Access Node-RED via:**
   ```
   http://localhost:1880
   ```

5. **Configure your Netgear LM1200 modem** to allow SMS reception.

## ⚙ Configuration

### 📌 PostgreSQL Database
A database named `nodered` is created with the user `node-red-user`.
To access the database manually:
```sh
psql -h localhost -U node-red-user -d nodered
```

###📡 Modem Network Configuration
Before adding a modem, ensure it is configured with a static IP address and DHCP is disabled. Follow these steps:
1. Switch the modem to router mode in its web interface.
2. Assign a static IP address to the modem.
3. Switch the modem back to bridge mode after setting the IP.
4. Connect the modem to your home network using the LAN port.

### 🔄 Adding New Modems
New modems can be added dynamically using an **inject node** in Node-RED.
To manually add a modem, insert it into the database using the following SQL command:
```sql
INSERT INTO modems (modem_ip, modem_password, modem_name, modem_phone_number, tg_chatid, enabled)
VALUES ('netgear_lm1200_ip', 'lm1200_pass', 'Modem NickName', '+1 111 111 1111', 111111111, TRUE);
```

### 🤖 Telegram Integration (Optional)
To enable Telegram notifications:
1. **Create a Telegram bot** and obtain its token.
2. **Add the token** in the Node-RED `telegram sender` node.
3. **Find your chat ID** to ensure messages are sent to the correct user.

## 📌 Usage
- 📥 Incoming SMS messages are processed and stored in the database.
- 📲 SMS messages are forwarded to Telegram.

## 🔧 Troubleshooting
- Ensure the modem is properly connected and configured.
- Check logs with:
  ```sh
  docker-compose logs -f
  ```
- Restart the services if needed:
  ```sh
  docker-compose restart
  ```

## 📜 License
This project is licensed under the **MIT License**.
