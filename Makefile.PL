use inc::Module::Install;

name           'App-DeviceUpgrade';
all_from       'bin/cisco_ios_up';

requires       'Expect'  => '0.0';
requires       'Getopt::Long';      # core

install_script  'bin/cisco_ios_up';

test_requires q(Test::Most) => 0.25;
bugtracker q(https://github.com/rfdrake/cisco_ios_up/issues);
homepage q(http://search.cpan.org/dist/App-Device_Upgrade);
repository q(git://github.com/rfdrake/cisco_ios_up.git);
license 'perl';

auto_install;
WriteAll;
