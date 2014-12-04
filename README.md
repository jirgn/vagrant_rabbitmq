# Environment for Centos 6.5 with PHP Phalcon Framwork




## Installation Notes

### Plugins

The following Plugins are needed for the script to run properly

* [Guesttools Management](https://github.com/dotless-de/vagrant-vbguest)
* [Proxyconfiguration](https://github.com/tmatilai/vagrant-proxyconf)
* [Librarian](https://github.com/mhahn/vagrant-librarian-puppet)

Install this plugins on Terminal with:

    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-proxyconf
    vagrant plugin install vagrant-librarian-puppet

### Start your Machine

Run Virtualmachine with: 

    vagrant up --provider="virtualbox"
     
### Configure your local Machine
