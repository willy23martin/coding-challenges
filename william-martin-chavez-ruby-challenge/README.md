#MooveIt - Ruby Test
**Documented by:** 
- William Martín Chávez González
- **Email**: ingmartic@gmail.com

##To run Memcached Server:
 1. [Install Vagrant 1.8.6 in your O.S.](https://releases.hashicorp.com/vagrant/1.8.6/)
 2. [Install VirtualBox 5.1.20r in your O.S.](https://download.virtualbox.org/virtualbox/5.1.20/)
 3. Go to the **memcached folder** and execute the command in your **CLI**: `vagrant up`.
 4. Then, verify that the **memcached service** is running in the console log: `==> WMC_MEMCACHED_SERVER: memcached is running`.
 5. Finally use **telnet command** to connect to the memcached service in port 11211: `telnet 192.168.1.235 11211`

##References:
 
1. [Memcached Installation.](https://memcached.org/downloads)
2. [Memcached Hardware requirements.](https://github.com/memcached/memcached/wiki/Hardware)
3. [Memcached Requirements - example use case.](https://github.com/memcached/memcached/wiki/TutorialCachingStory)
4. [Memcached scaling references.](https://www.youtube.com/watch?v=1MAgt0bFdwM)
5. [Ubuntu 14.04.6 Vagrant Box.](https://app.vagrantup.com/ubuntu/boxes/trusty64)
6. [Memcached installation in Ubuntu 14.04.6.](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-memcached-on-ubuntu-16-04)
7. [Memcached Dalli Ruby Gem.](https://redislabs.com/lp/rails-memcached/)