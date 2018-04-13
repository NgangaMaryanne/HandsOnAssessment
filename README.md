## HandsOnAssessment
This repository contains privioning files for 2 webservers running behind a loadbalancer. Both the webservers and the load balancer run on nginx.
## Dependencies
- vagrant
## Setup
- Install vagrant.
 Go to (vagrant docs)[https://www.vagrantup.com/docs/] and follow instructions to install vagrant.
- Clone this repository.

    `git clone git@github.com:NgangaMaryanne/HandsOnAssessment.git`
    
- Provision the infrastructure
    - Run ` vagrant up` for initial setup.
    - If process is disrupted before its complete or any changes made to code, `vagrant up` will not re-provision the machines and in this case run:
    
  	  ` vagrant up --provision`
    
- test loadbalancer
    - ssh into load balancer box
    
       	 `vagrant ssh load_balancer`
         
    - Make requests to the loadbalancer
    
       `curl localhost`
    
    Alternatively go to `http://localhost:8080` on your browser.
