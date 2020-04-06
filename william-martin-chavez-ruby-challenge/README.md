#MooveIt - Ruby Test
**Documented by:** 
- William Martín Chávez González
- **Email**: ingmartic@gmail.com

##To run Memcached Server:
 1. [Install Vagrant 2.2.6 in your O.S.](https://releases.hashicorp.com/vagrant/2.2.6/)
 2. [Install VirtualBox  6.0.16 r135674 (Qt5.6.2) in your O.S.](https://download.virtualbox.org/virtualbox/5.1.20/)
 3. Go to the **memcached folder** and do the following:
 
    3.1. Open the **Vagrantfile** and modify the following network global variables:
     
         - IP_ADDRESS: "the IP address of your local network, that you want to assign to the bridge NIC of the server."
         - NETWORK_MASK: "the networks mask related to your private network" 
    
    3.2. Execute the command in your **CLI**: `vagrant up --provision`.
    3.3. Select the Hoist´s bridge network interface once the console displays the options: `==> WMC_MEMCACHED_SERVER: Available bridged network interfaces:`
    
 4. Then, verify that the **memcached service** is running by executing telnet command: `telnet 192.168.1.235 11211`.
 5. Then, verify that the **memcached service** is running by checking the console log: `==> WMC_MEMCACHED_SERVER: memcached is running`.
 6. Then, use the command `vagrant ssh` or the [PuTTY](https://www.putty.org/) or another ssh client in order to connect to the Memcached Server to the 192.168.1.235 IP Address
  and with the following credentials:
    * **user**: vagrant
    * **password**: vagrant
 7. Then, in order to set the username and password of the Memcached SASL2 authentication mechanism,
    execute the following command in the vagrant console: `sudo saslpasswd2 -a memcached -c -f /etc/sasl2/memcached-sasldb2 mooveit`.
    * Set the **password** and confirm it - the **username(mooveit)** and **password** would be the same that you have to use in all
    **Memcached Clients (RubyOnRails web servers)**.
 8. In order to test the memcached, set the password in the *testMemcached.rb* file and execute the `ruby testMemcached.rb` command in your CLI.
    * Finally, check the **result**: "The key elementKey has a value: 99856."
     
##Ruby on rails web server (MemcachedClient):

##References:
1. [Memcached Installation.](https://memcached.org/downloads)
2. [Memcached Hardware requirements.](https://github.com/memcached/memcached/wiki/Hardware)
3. [Memcached Requirements - example use case.](https://github.com/memcached/memcached/wiki/TutorialCachingStory)
4. [Memcached scaling references.](https://www.youtube.com/watch?v=1MAgt0bFdwM)
5. [Ubuntu 14.04.6 Vagrant Box.](https://app.vagrantup.com/ubuntu/boxes/trusty64)
6. [Memcached installation in Ubuntu 14.04.6.](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-memcached-on-ubuntu-16-04)
7. [Memcached Dalli Ruby Gem.](https://redislabs.com/lp/rails-memcached/)
8. [Heroku Ruby on Rails](https://devcenter.heroku.com/articles/getting-started-with-rails5).
9. [Memcached in a Heroku Project](https://devcenter.heroku.com/articles/memcachedcloud#using-memcached-from-ruby).
10. [Simple Authentication and Security Layer](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-memcached-on-ubuntu-16-04).
11. [SASLHowto](https://github.com/memcached/memcached/wiki/SASLHowto).