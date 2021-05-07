[root@ip-172-31-60-126 solution]# docker pull infracloudio/csvserver:latest
latest: Pulling from infracloudio/csvserver
ae43b40a9945: Pull complete
7bb33bb2db38: Pull complete
c82d72e1bb76: Pull complete
Digest: sha256:20bc5a93fac217270fe5c88d639d82c6ecb18fc908283e046d9a3917a840ec1f
Status: Downloaded newer image for infracloudio/csvserver:latest
docker.io/infracloudio/csvserver:latest
[root@ip-172-31-60-126 solution]# docker images
REPOSITORY               TAG       IMAGE ID       CREATED       SIZE
infracloudio/csvserver   latest    8cb989ef80b5   8 weeks ago   237MB
[root@ip-172-31-60-126 solution]# docker run -itd infracloudio/csvserver:latest
4fdfe04205cf9860485d7d9c533f0a7f1df4f7290c0ad77e33a440d52e7a1902
[root@ip-172-31-60-126 solution]# docker ps -a
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS                     PORTS     NAMES
4fdfe04205cf   infracloudio/csvserver:latest   "/csvserver/csvserver"   5 seconds ago   Exited (1) 5 seconds ago             stoic_driscoll
[root@ip-172-31-60-126 solution]# docker logs -f 4fdfe04205cf
2021/05/07 02:56:54 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
[root@ip-172-31-60-126 solution]#

[root@ip-172-31-60-126 solution]# vi gencsv.sh
[root@ip-172-31-60-126 solution]# chmod +x gencsv.sh
[root@ip-172-31-60-126 solution]# ./gencsv.sh
[root@ip-172-31-60-126 solution]# ls -ltr
total 8
-rwxr-xr-x. 1 root root 86 May  7 02:59 gencsv.sh
-rw-r--r--. 1 root root 87 May  7 03:01 inputFile
[root@ip-172-31-60-126 solution]# cat inputFile
1, 29307
2, 27851
3, 15989
4, 6282
5, 5635
6, 14868
7, 2621
8, 24131
9, 2503
10, 28721
[root@ip-172-31-60-126 solution]#

[root@ip-172-31-60-126 solution]# docker run -itd -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
c48b1b36422c629c83670f4228896a7834f1c6b51dbe97c6d9bd30ca7d6c9b9b
[root@ip-172-31-60-126 solution]# docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS      NAMES
c48b1b36422c   infracloudio/csvserver:latest   "/csvserver/csvserver"   19 seconds ago   Up 17 seconds   9300/tcp   crazy_sanderson
[root@ip-172-31-60-126 solution]# docker logs -f c48b1b36422c
2021/05/07 03:17:29 listening on ****
^C
[root@ip-172-31-60-126 solution]# docker exec -it c48b1b36422c /bin/bash
[root@c48b1b36422c csvserver]# ls -ltr
total 8100
-rwxrwxr-x. 1 root root 8290304 Mar 10 14:35 csvserver
-rw-r--r--. 1 root root      87 May  7 03:01 inputdata
[root@c48b1b36422c csvserver]# netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver
[root@c48b1b36422c csvserver]#

[root@ip-172-31-60-126 solution]# docker run -itd -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest
ce07de86b54c75a07a4964cb3e2cd382fc908285ba9bade76c89056864aec9b9
