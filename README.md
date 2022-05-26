# Not For Sale

The stack that allows to communicate with `notforsale_client` application built for Raspberry Pi & E-Ink display that allows to pick and render the image remotely.

## How to use it?

Execute `docker-compose up` to start containers.

| Container     | Port          |
| ------------- | ------------- |
| nfs-frame     | **3000:3000** |
| nfs-mosquitto | **1883:1883** |
| nfs-phoenix   | **4000:4000** |
| nfs-postgres  | **5432:5432** |
| nfs-server    | **8888:8888** |

After when containers are running, you can reach the webserver by http://localhost:8888

## Architecture design

![Architecture](https://i.ibb.co/RbxqCtT/Screenshot-from-2022-05-26-10-44-55.png)

## Updates

To follow the updates please check out project [GoodNotes notebook](https://share.goodnotes.com/s/qMLEXACQiGloHT46CnPFvb)