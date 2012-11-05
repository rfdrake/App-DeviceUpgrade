cisco_ios_up
============

Automated Cisco IOS upgrade scripts

These were written to be used by myself and I never really had documentation
in mind when making them.  Whenever I wanted someone else to use them I've
modified the XML file for them and just explained how to use the script
without explaining the setup.

I'll attempt to explain the setup here.

scripts
=======

mktelrc
-------

Makes an example .telrc file that is used by 'tel' to connect to devices


tel
---

This script attempts to connect to almost anything that has a CLI.  That
includes UNIX boxes, Dlink switches, allied telesis, cisco, trango,
etc.

Although it can be used with command line arguments similar to rancid's
clogin, it's primarly designed to perform the initial connection and then
handoff to the user via "interact()".  In other words, this is the program the
Expect authors told me not to write, but generic enough that I hope they won't
fault me for it.

Ideally, I may convert this to a module so I can handoff the handle instead of
execing a new perl process, but I generally prefer self-contained perl
programs and separate modules.  It may be that if I modularized it there
wouldn't be much reusable code, and it would become even more confusing to
use.

cisco_ios_up
------------

This is the main script.  The tftp server and available IOS' are defined at
the top of the file.  You'll want to change most of the defaults unless you
happen to have the same hardware we do.

The file supports regex for the cisco model so if you have several different
models that use the same code you can create a general config that works for
all of them.



TODO
====

Except where otherwise noted, here are the faults.

cisco_ios_up needs a config file: Most of the code changes are me changing IOS
revisions or supported devices.. this could all be stored in a file.

no ability to unit test (if I rewrote the code to use modules then I could
test most individual functions.  As of right now you would need to write a
router emulator to test the entire thing rather than testing peices of it)

I'd like to add an <include> directive in telrc so when you have a shared
config between a bunch of users and the only change most of them make is for
their TACACS username, they can pull a default config.

I don't think cisco_ios_up works for hosts that don't have a username yet, so
people without tacacs will not work.  I need to fix that.
