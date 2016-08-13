Device Upgrader
===============

Automated firmware upgrade scripts

These were written to be used by myself and I never really had documentation
in mind when making them.  Whenever I wanted someone else to use them I've
modified the files for them and just explained how to use the script
without explaining the setup.

I'll attempt to explain the setup here.

Setup
=====

First you need to put configuration files in the proper places.  Example
configuration files are in the "examples" directory.

You can either put them in $HOME/.config/deviceupgrader or if multiple users
will use the script, you can put them in /etc/deviceupgrader.

Hopefully the yaml syntax is self-explanatory and you can figure it out from
the examples.  Basically you supply a regex that will match the device model,
then supply the configuration parameters and what firmware to use.

You will need to edit defaults.yaml and put your FTP/TFTP server information.

scripts
=======

cisco_ios_up
------------

The script is used to automate IOS upgrades across a wide variety of Cisco
hardware.  It's designed to be okay to run it in bulk, but there may be
circumstances where the error handling doesn't do a good job.

Getting Started
===============

First you'll need to get a copy of rancid, specifically clogin or any other
script that allows you to automatically connect to a router.

http://www.shrubbery.net/rancid/

Once that is setup, edit cisco_ios_up and point it to the IP of your
tftp or ftp server.  If you're lost from this point then this is probably not
a program suited to your needs.

You can use "par" which comes with rancid to parallelize the upgrade process.
I advise you to read the output logs carefully before reloading all your
devices, since an error while copying may leave the device without a
functioning OS.

As an alternative, you can grab my "tel" program which can do the same
functions as clogin, but has a few more capabilities.

    https://github.com/rfdrake/tel

TODO
====

Except where otherwise noted, here are the faults:

no ability to unit test (if I rewrote the code to use modules then I could
test most individual functions.  As of right now you would need to write a
router emulator to test the entire thing rather than testing pieces of it)

protected_files is not a configuration option yet.  I need to fix this.
