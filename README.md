# Vagrant Examples 
This project contains example vagrant projects running vex (its awesome!).

* single-centos7 - Single Virtual Machine running the application vex
* multi-centos7 - Multiple virtual machines running centos7
* docker-vm - Docker Example using a centos7 virtual machine

## Single
Single Virtual Machine controlled by vagrant running the vex application.  

http://vex

## Multi

Point your browser to http://proxy/ and refresh the browser, you should see the proxy round robin between web01 and web02.

## Docker 
Docker example using a Ubuntu 14.04 docker host

## Vagrant Installation 
1. Install virtualbox/vmware player/docker
1. Install vagrant from www.vagrantup.com
1. Install hostmanager vagrant plugin

    ```bash
    vagrant plugin install vagrant-hostmanager
    ```
1. Install the vagrant trigger plugin

    ```bash
    vagrant plugin install vagrant-trigger
    ```


## Useful Vagrant Commands

```bash
#Check the status of the virtual machines in the current directory
vagrant status
#Start the virtual machines
vagrant up
#ssh to your virtual machines
vagrant ssh
#ssh to a specific vm if you have multiple vms in the vagrant file
vagrant ssh vm_name
#Poweroff the virtual machines
vagrant halt
#Re-run the provision scripts
vagrant provision
#Check the status of all virtual machines
vagrant global-status
#Reconfigure your hosts file
vagrant hostmanager
#Reconfigure hosts file when using non default provider
$VAGRANT_DEFAULT_PROVIDER="virtualbox" vagrant hostmanager
#Delete your virtual machines
vagrant destroy
#Delete without prompting
vagrant destroy -f
#Update your plugins
vagrant plugin update
#Remove obsolete machines 
vagrant global-status --prune
#Update your vagrant boxes to the latest version
vagrant box update
```

## Notes
* When you clone your repo make sure you ignore the files inside the .vagrant directory
 
```bash
cat .gitignore 
.vagrant
```

* Vagrant hostmanager plugin (1.5.0) can't get dhcp ip addresses without the configuration found in the sample vagrant files
* Vagrant VMWare plugin does not always create new networks correctly.  So it is better to use dhcp rather than setting a static private address.  
* The order virtual machines are created may be important.  For example if your provisioning scripts depend on other vms then they should be created first.  ie database hosts, web hosts and proxies last
* In vagrant (1.7.2) there is a bug, fixed in (1.7.3) that means if you are using virtualbox and receive an error about "a host only network interface attempting to configure via DHCP" you should run the following command as yourself:

```bash
VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0
```

  * When using apache and nginx along with virtualbox, be sure to disable sendfile http://docs.vagrantup.com/v2/synced-folders/virtualbox.html
