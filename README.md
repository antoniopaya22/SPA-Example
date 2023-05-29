# SPA-Example
Single Packet Authorization with fwknop example environment in Docker-Compose.

---

![SPA-Example](docs/rsz_spa.png)

---

## Usage

### 1. Clone this repository

```bash
$ git clone https://github.com/antonioalfa22/SPA-Example
$ cd SPA-Example
```

### 2. Build the Docker images

```bash
$ docker-compose up -d --build
```

### 3. Configuration

#### 3.1. Generate the SPA keys

First, generate the Base64 keys on the client:

```bash
$ docker exec -it spa-client /bin/bash
$ fwknop -A [SERVICES (tcp/80, tcp/22)] --use-hmac -R -D [SERVER_IP] --key-gen --save-rc-stanza --verbose
```

Then, copy the `KEY_BASE64` and the `HMAC_KEY_BASE64` to the server `access.conf` file.

#### 3.2. Start the SPA server

```bash
$ docker exec -it spa-server /bin/bash
$ fwknopd -f
```

#### 3.3. Start the client access request

First, replace the `[Gateway IP]` on the `/root/.fwknoprc` file with the gateway IP.

Then, run the following command to request access to the server:

```bash
$ docker exec -it spa-client /bin/bash
$ fwknop -n [SERVER_IP] --wget-cmd /usr/bin/wget -a [CLIENT_IP]
```