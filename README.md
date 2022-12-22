```

           :~77777!!!^:.
        .~7J7^^::^^^~!77!~::::
      ^7JJ~7~        .^7?JY?^:
    ^7J5?. ^?:    .~7!~:..~?7.
   !?!J?.   !7. ^7?!^      ^J!.
  !?^JJ:    .JJ??~.         7Yx   NotForSale: Sustainable art for a sustainable future
 ^J^^Y7     ~J5?.           7Yx                                          notforsale.cc
.?J:^Y7.  :??^^J?:          7Yx
 !Y7^JJ^ ^J7.  :?Y~.       ^J7
  !YJJYJ7?^     .~J?~.    ~Y?.
   :!?Y55J!^:::...:!J?!~^7Y?:
      ^?77??JJJJJJJJJ?JYJ?^.
           ..:::^^^^^^::.

```
# Not For Sale

Our stack enables communication with the `notforsale_client` application, which was designed to work with Raspberry Pi and e-ink displays. This allows you to select and display images remotely.

## How to use it?

To spin-up the services run the `docker-compose up` command.

| Container     | Port          |
| ------------- | ------------- |
| nfs-frame     | **3000 (private)** |
| nfs-mosquitto | **1883:1883** |
| nfs-phoenix   | **4000:4000** |
| nfs-postgres  | **5432:5432** |
| nfs-server    | **8888:8888** |

After when containers are running, you can reach the webserver by http://localhost:8888

## Architecture design

![Architecture](https://i.ibb.co/RbxqCtT/Screenshot-from-2022-05-26-10-44-55.png)

## Updates

To follow the updates please check out project [GoodNotes notebook](https://share.goodnotes.com/s/qMLEXACQiGloHT46CnPFvb)
