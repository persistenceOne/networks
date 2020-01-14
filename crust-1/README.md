
Crust-1 : Setup of the Persistence Blockchain
===



## Golang : Installation

<div class="header"> Minumum Configuration Requirement</div>

- Cores : 4
- RAM : 8-16GB
- Storage Space : 50GB
- Storage Type : SSD or HDD

<br>
<div class="header">Install Golang</div>
<br>

Add the Golang PPA repository to get the latest version of Golang.

`sudo add-apt-repository ppa:longsleep/golang-backports`

![](https://i.imgur.com/uedkD6X.png)


After adding the PPA, update packages list using the below command.   

`sudo apt-get update`


Install the latest version of Golang and other required packages

`sudo apt-get install -y git golang-go make`

![](https://i.imgur.com/WRCcJos.png)

<br>
<div class="header">Setup Environment Variables</div>
<br>

`export GOROOT=/usr/lib/go`

`export GOPATH=$HOME/go`

`export GOBIN=$GOPATH/bin`

`export PATH=$PATH:$GOROOT/bin:$GOBIN`



You can also append the above lines to $HOME/.bashrc file and run the following command to reflect in current Terminal session

`source $HOME/.bashrc`

`go env`

![](https://i.imgur.com/L7FzFBL.png)



## Persitence Blockchain : Installation

1. Install Persistence Blockchain from the official [persistenceSDK](https://github.com/persistenceOne/persistenceSDK) repository

    `go get -u github.com/persistenceOne/persistenceSDK
    
2. Navigate to the `Persistence Blockchain` folder

    `cd $GOPATH/src/github.com/persistenceOne/persistenceSDK`
![](https://i.imgur.com/NibWpv4.png)


3. Run following command to install the `Persistence Blockchain`
4. 
    `git checkout version0`
    
    `make all`


4. Check the version 

    `maind version & maincli version`
    



Persistence Blockchain : Validator at Genesis
---

1. After the installation of [persistence Blockchain](https://github.com/persistenceOne/persistenceSDK)

    `maind init --name [moniker]`


2. you get `genesis.json` intialized in `$HOME/.maind/config/`
 
![](https://i.imgur.com/0gv5rmi.png)

<br>
<div class="header">Finding peer Id and IP address</div>
<br>

1. To know the peer Id run the following command

    `maind tendermint show-node-id`
    
![](https://i.imgur.com/t20suNO.png)


2. To know IP address 

    `ifconfig`



<br>
<div class="header">Pull request to Persistence Alpha-net repo</div>
<br>

1. Fork the official [persistenceOne genesisTransactions](https://github.com/persistenceOne/persistenceSDK) repository.

2. Clone the the repo form your github repository

    `git clone https://github.com/<your_git_user_name>/genesisTransactions.git`
    
3. Navigate to the  folder by using the below command

    `cd genesisTransactions`
    
4. Checkout to `crust-1`

    `git checkout crust-1`
    
    ![](https://i.imgur.com/WZIkdVC.png)


    
5. Copy the `genesis.json` file from `$HOME/.maind/config`

    `cp $HOME/.maind/config/genesis.json genesis.json`
    
    ![](https://i.imgur.com/Ky4Qrzo.png)

   
6. Create a file name `peers.json` and add the peerId and ip address from 
     above > Finding peerId and IP address section
    
    `touch peers.json`
    
    `nano peers.json`
    
![](https://i.imgur.com/Ex4PJzq.png) 
    copy the node-id and ip address in following format
    
`node-id@ip-address:26656`
     
> Example
    ![](https://i.imgur.com/p6DORTS.png)




>**Note**: Node-id and ip-address are need to mentioned given format in peers.json file

7. pull request to repo
    `git status` contains two files genesis.json, peers.json  
    
    `git add .`
    
    `git commit  -m {moniker} as validator`
    
    `git push origin crust-1`
    
     ![](https://i.imgur.com/uBkNTr2.png)
     
    
   Create the pull request to [persistenceOne genesisTransactions](https://github.com/persistenceOne/persistenceSDK) repository repo
    
  After submitting the PR, the repository maintainers will merge in case of no issues. If not, issues will be commented upon.  
    
    

Persistence Blockchain : Validator post genesis
---
1. before testnet  start `master` will have `genesis.json` and `peers.json` file

    `wget          https://raw.githubusercontent.com/persistenceOne/persistenceSDK/master/ \
    crust-1/genesis.json`
    
2. Copy the genesis 

    `cp genesis.json $HOME/.maind/config/genesis.json`
    
![](https://i.imgur.com/np3yqkA.png)
        
3. Add the peers in `$HOME/.maind/config/config.toml`
    
  - Open file  `$HOME/.maind/config/config.toml`
  - in persistent_peers = "" line no: 93 
  - copy the peer from `peers.json`  // located in repo 
  - save the file
>Example Image to adding peers
>
![](https://i.imgur.com/DjkZsU6.png)



4. Start the chain

    `maind start`
    
    



