Pull The Docker Image: 
---------------------
      docker pull infracloudio/csvserver:latest

Run Docker container: 
--------------------
     docker run -itd infracloudio/csvserver:latest

Check docker services status:
----------------------------- 
     docker ps -a
Check the Docker logs: 
---------------------- 
     docker logs -f {{ Container ID }}

Create Script to generate inputFile and execute:
-----------------------------------------------
           
            vi gencsv.sh
                  #!/bin/bash
                  RANDOM=$$
                  for i  in `seq 10`
                  do
                  echo "$i, $RANDOM" >> inputFile
                  done

             chmod +x gencsv.sh
             sh gencsv.sh

Mount the inputfile to container and check the port:
---------------------------------------------------
             docker run -itd -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
             docker ps
             docker exec -it {{containerid}} /bin/bash
             netstat -tulpn

Stop and Remove the Container:
-----------------------------
            docker stop {{containerid}}
            docker rm {{containerid}}

Run the Conatiner with 9393 port:
--------------------------------
            docker run -itd -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest
            

Run the Conatiner with 9393 port along with Env variable:
---------------------------------------------------------
            docker run -itd -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='orange' infracloudio/csvserver:latest
            
            
            
            
