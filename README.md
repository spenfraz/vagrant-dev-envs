# vagrant-dev-envs
----
Configuration Management via Vagrant, using Virtualbox, on
CentOS7.
----
Vagrant CheatSheet --->  https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4
----
- minimal CentOS dev environment
    (**tested on** Windows 10)
    1. Install Git: https://git-scm.com/downloads
    2. Install Chocolatey (Install with cmd.exe): https://chocolatey.org/install
    3. Open Administrator terminal (cmd) & run: $ choco install vagrant virtualbox
    4. Open new (cmd) terminal or $ refreshenv
    5. $ git clone https://github.com/spenfraz/vagrant-dev-envs.git
    6. $ cd vagrant-dev-envs\cent_minimal_dev
    7. $ vagrant up
    8. (Once previous step finishes and control of the terminal returns:) $ vagrant ssh
    9. (should get: "[vagrant@minimal ~]$" prompt) You are now logged in to the newly created CentOS instance.
    10. (to check out files shared between guest and host:) $ cd /vagrant && ls
    11. (to exit:) $ exit
    12. (will drop you back into the original terminal session)  Options:  $ vagrant (ssh, halt, suspend or destroy)
    
- aws-ansible-ctrl dev environment
    (**tested on** Windows 10 )
    1. Install Git:  https://git-scm.com/downloads
    2. Install Chocolatey (Install with cmd.exe): https://chocolatey.org/install
    3. Open Administrator terminal (cmd) & run: $ choco install vagrant virtualbox
    4. Open new (cmd) terminal or $ refreshenv
    5. $ git clone https://github.com/spenfraz/vagrant-dev-envs.git
    6. $ cd vagrant-dev-envs\cent_ansible-ctrl_dev
    7. Via AWS Console, launch an EC2 instance with 'Amazon Linux 2 AMI'.
    8. Save the .pem file in vagrant-dev-envs\cent_ansible-ctrl_dev\ directory.
    9. (In "hosts" file) Replace <public-ip\> with the public ip of the launched EC2 instance.
    10. (In "vars.yml" file) Replace <filename\> with the name of the .pem file.
    11. $ vagrant up
    12. (after previous step finishes) $ vagrant ssh
    13. (should get: "[vagrant@ansible-dev ~]$ " prompt) $ ansible test -m ping
            
            (You will get the following message:)
        
            The authenticity of host '#.#.#.# (#.#.#.#)' can't be established.
            ECDSA key fingerprint is SHA256:--------------------------------------------
            ECDSA key fingerprint is MD5:--:--:--:--:--:--:--:--:--:--:--:--:--:--:--:--.
            Are you sure you want to continue connecting (yes/no)?
        
            (After typing "yes" and pressing "Enter" key.)
        
            (Success Message:)
        
            #.#.#.# | SUCCESS => {
            "changed": false, 
            "ping": "pong"
            }
        
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
    4.  Open new (cmd) terminal or $ refreshenv
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

- schedule-scraper-soup dev environment
    ( **tested on** Windows 10 )
    1. Install Git: https://git-scm.com/downloads
    2. Install Chocolatey (Install with cmd.exe): https://chocolatey.org/install
    3. Open Administrator terminal (cmd) & run: $ choco install vagrant virtualbox
    4. Open new (cmd) terminal or $ refreshenv
    5. $ git clone https://github.com/spenfraz/vagrant-dev-envs.git
    6. $ cd vagrant-dev-envs\cent_schedule-scraper-soup_dev
    7. $ vagrant up
    8. (Once previous step finishes and control of the terminal returns:) $ vagrant ssh
    9. (should get: "[vagrant@openjdk-java8-maven ~]$" prompt) You are now logged in to the newly created CentOS instance.
    10. $ cd schedule-scraper-soup/
    11. $ mvn clean compile assembly:single
    12. $ java -jar target/schedule-scraper-soup-0.0.1-SNAPSHOT-jar-with-dependencies.jar
    12. (The sqlite db file is ignored (text files of data are included), so no data will be shown until an "erase and build table" option is executed.)
    13. (to exit:) $ exit
    14. (will drop you back into the original terminal session)  Options:  $ vagrant (ssh, halt, suspend or destroy) 
