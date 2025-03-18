CREATE DATABASE nodered;

CREATE USER "node-red-user" WITH ENCRYPTED PASSWORD 'node-red-pass';

GRANT ALL PRIVILEGES ON DATABASE nodered TO "node-red-user";

ALTER DATABASE nodered OWNER TO "node-red-user";

\connect nodered;

GRANT CREATE, CONNECT ON DATABASE nodered TO "node-red-user";