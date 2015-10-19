cisco_ios_up
============

Automated Cisco IOS upgrade scripts

These were written to be used by myself and I never really had documentation
in mind when making them.  Whenever I wanted someone else to use them I've
modified the files for them and just explained how to use the script
without explaining the setup.

I'll attempt to explain the setup here.

The script is used to automate IOS upgrades across a wide variety of Cisco
hardware.  It's designed to be okay to run it in bulk, but there may be
circumstances where the error handling doesn't do a good job.

scripts
=======

cisco_ios_up
------------

This is the main script.  The tftp server and available IOS' are defined at
the top of the file.  You'll want to change most of the defaults unless you
happen to have the same hardware we do.

The file supports regex for the cisco model so if you have several different
models that use the same code you can create a general config that works for
all of them.

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

TODO
====

Except where otherwise noted, here are the faults.

cisco_ios_up needs a config file: Most of the code changes are me changing IOS
revisions or supported devices.. this could all be stored in a file.

no ability to unit test (if I rewrote the code to use modules then I could
test most individual functions.  As of right now you would need to write a
router emulator to test the entire thing rather than testing pieces of it)

