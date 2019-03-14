# vagrant-dev-envs
----
Configuration Management via Vagrant, using Virtualbox, on
CentOS7.
----
- flask-note-api dev environment
    ( **tested on** Linux Mint 19.1 Tessa Ubuntu Bionic )
    1.  $ sudo apt-get install virtualbox vagrant git
    2.  $ git clone https://github.com/spenfraz/vagrant-dev-envs.git
    3.  $ cd ./vagrant-dev-envs/cent_flask-note-api_dev
    4.  $ vagrant up
    5.  Check out:  http://localhost:3000/notes/api/v1/notes
    5.  Ctrl-C twice to exit. (should continue running)
    6.  $ vagrant (ssh, suspend, halt or destroy)
    
 - flask-note-api dev environment
    ( **tested on** Windows 10 )
    1.  Install Git:   https://git-scm.com/downloads
    2.  Install Chocolatey (Install with cmd.exe):   https://chocolatey.org/install
    3.  Open Administrator terminal (cmd) & run:  $ choco install vagrant virtualbox
    4.  Open new terminal or $ refreshenv
    5.  $ git clone https://github.com/spenfraz/vagrant-dev-envs.git
    6.  $ cd vagrant-dev-envs\cent_flask-note-api_dev
    7.  $ vagrant up
    8.  Check out:  http://localhost:3000/notes/api/v1/notes
    9.  Ctrl-C twice to exit. (should continue running)
    10.  $ vagrant (ssh, suspend, halt or destroy)
    
- meteor-inventory-system dev environment
    ( **tested on** Linux Mint 19.1 Tessa Ubuntu Bionic )
    1.  $ sudo apt-get install virtualbox vagrant git
    2.  $ git clone https://github.com/spenfraz/vagrant-dev-envs.git
    3.  $ cd ./vagrant-dev-envs/cent_meteor-inventory-system_dev
    4.  $ vagrant up
    5.  Check out:  http://localhost:3000
    5.  Ctrl-C twice to exit. (should continue running)
    6.  $ vagrant (ssh, suspend, halt or destroy)
