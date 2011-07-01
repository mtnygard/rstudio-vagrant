Purpose
==========
To try out RStudio without installing it on your own machine or a
server somewhere.

Prerequisites
-------------
You will need to be running RVM in order to use this.

1. bundle install
1. vagrant up
1. vagrant ssh 
1. sudo passwd rstudio
(set whatever password you like)

Use
----------
Vagrant is configured to forward localhost:8787 to the virtual
machine. Point your browser at [http://localhost:8787/](http://localhost:8787).

RStudio uses the system login for authentication. Vagrant creates a
user named 'vagrant', but with a randomized password, so that won't
help. 

The rstudio recipe creates a new user called 'rstudio', but without a
password. That's why steps 3 and 4 are needed, above. That password is
how you log in to rstudio.

If you want extra users in the virtual machine, you can just use the
Linux 'useradd' command.
