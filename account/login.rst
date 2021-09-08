.. _login:

=============================
Logging in for the first time
=============================


Log in with SSH
===============

An *SSH* client (Secure SHell) is the required tool to connect to sciscluster.
An *SSH* client provides secure encrypted communications between two hosts over an insecure network.

If you already have *ssh* installed on your UNIX-like system, login may be as easy as typing

::

 ssh <username>@sci.local

or

::

 ssh <username>@172.21.127.53

into a terminal window.


Log in with an ssh key
----------------------

To avoid entering your password every time you login and to increase security, you can log in with an ssh keypair. This keypair consists of a private key that you have to store on your computer and a public key that you can store on sciscluster. On Linux or OSX simply type:

::

 ssh-keygen

and follow the instructions on the screen. Please use a good passphrase. You will have to enter this passphrase the first time you log in after a reboot of the computer, but not anymore afterwards. To copy the public key to sciscluster, type:

::

 ssh-copy-id <username>@sci.local

To learn more about ssh keys, have a look at `this <https://wiki.archlinux.org/index.php/SSH_keys>`_ page.

On Windows, you can use PuTTYgen that comes with PuTTY. More information on `ssh.com <https://www.ssh.com/ssh/putty/windows/puttygen>`_.


SSH clients for Windows and Mac
-------------------------------

At the `OpenSSH page <https://www.openssh.com>`_ you will find several *SSH* alternatives for both Windows and Mac.

Please note that Mac OS X comes with its own implementation of *OpenSSH*, so you don't need to install any third-party software to take advantage of the extra security *SSH* offers. Just open a terminal window and jump in.


Learning more about SSH
-----------------------

To learn more about using SSH, please also consult the `OpenSSH page <https://www.openssh.com>`_ page and take a look at the manual page on your system (*man ssh*).



Logging on the compute nodes
============================

Information on how to log in on a compute node.

Some times you may want to log on a compute node (for instance to check
out output files on the local work area on the node), and this is also
done by using SSH. From ``sci.local`` you can log in to
compute-x-y the following way:

::

    ssh compute-x-y     (for instance: ssh compute-0-1)
    
X-forwarding for graphical softwares
====================================

If you need X-forwarding (for instance, if you like to run Emacs or Mathematica in it's own window) you must log in like this:

::

    ssh -X -Y <username>@172.21.127.53
 
Then you must submit an :ref:`interactive` to get a terminal (this will give you access to the compute nodes such as ``compute-0-0``). Then you nedd to login to the frontend exactly as above and then use ``ssh`` command in another terminal to login to to the node that is allocated for you, ``compute-0-0`` for example.

::

    ssh -Y compute-0-0
    
You should be able to run your program in this terminal and after a few seconds (depending to your network connection) the program window should be appeared. To test it you can test xclock. In this terminal type

::

    xclock
    
You will see a small clock in your local screen.

