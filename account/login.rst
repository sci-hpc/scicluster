.. _login:

=============================
Logging in for the first time
=============================


Log in with SSH
===============

An *SSH* client (Secure SHell) is the required tool to connect to sci-cluster-testing. An *SSH* client provides secure encrypted communications between two hosts over an insecure network.

If you already have *ssh* installed on your UNIX-like system, have a user account and password on a Notur system, login may be as easy as typing

::

 ssh <machine name>         (for instance: ssh scihpc.local)

into a terminal window.

If your user name on the machine differs from your user name on the local machine, use the -l option to specify the user name on the machine to which you connect. For example:

::

 ssh <machine name> -l [username]

And if you need X-forwarding (for instance, if you like to run Emacs in it's own window) you must log in like this:

::

 ssh -X -Y <machine name>

No matter how you login, you will need to confirm that the connection shall be trusted. The SHA256 key fingerprint of ``scihpc.local`` is:

::

 SHA256:ndvR8mK1QngNu9L9V6exoO9SJJ2dFzjNqamhMKlRodY

So you should get precisely this message the first time you login via ssh:

::

 The authenticity of host 'scihpc.local (172.21.99.202)' can't be established.
 ECDSA key fingerprint is SHA256:ndvR8mK1QngNu9L9V6exoO9SJJ2dFzjNqamhMKlRodY.
 Are you sure you want to continue connecting (yes/no)?

If you see this message with precisely this code, you can continue by typing ``yes`` and pressing *Enter*. If you connect to sci-cluster-testing for the first time and ssh does *not* show you this key, please contact us immediately.


Log in with an ssh key
----------------------

To avoid entering your password every time you login and to increase security, you can log in with an ssh keypair. This keypair consists of a private key that you have to store on your computer and a public key that you can store on sci-cluster-testing. On Linux or OSX simply type:

::

 ssh-keygen

and follow the instructions on the screen. Please use a good passphrase. You will have to enter this passphrase the first time you log in after a reboot of the computer, but not anymore afterwards. To copy the public key to sci-cluster-testing, type:

::

 ssh-copy-id <username>@scihpc.local

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
done by using SSH. From scihpc.local you can log in to
compute-x-y the following way:

::

    ssh compute-x-y     (for instance: ssh compute-0-1)
