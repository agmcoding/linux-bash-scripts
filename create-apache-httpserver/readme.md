# Summary of this script

It creates an apache HTTP server by installing the `apache2`, that is the Apache HyperText Transfer Protocol (HTTP) server program.

## Some important notes

* It uses Debian and Debian-based Linux distro commands, as `apt-get` command.
* The script tries to update the system, so take caution: check if the system that will be running the script can and should be updated.
* From the `apache2` manual page:
 > In general, apache2 should not be invoked directly, but rather should be invoked via /etc/init.d/apache2 or apache2ctl. The default Debian configuration requires enviroment variables that are defined in /etc/apache2/envvars and are not available if apache2 is started directly. However, apache2ctl can be used to pass arbitrary arguments to apache2.

Therefore, this is just an example and you may change it according to your preferences.

## Explanation of the commands

### #!/bin/bash

The `#!/bin/bash` command indicates that the script should be executed by the specified shell, in this case Bash.

### printf

The `printf` command formats and prints data, in this case to give information on the terminal. The sequence `\n` adds a new line.

### apt-get

From the `apt-get` manual page:
 > **apt-get** is the command-line tool for handling packages, and may be considered the user's "back-end" to other tools using APT library.

The option `-y` is defined as:
 > Automatic yes to prompts; assume "yes" as answer to all prompts and run-interactively.

### apt-get update

From the `apt-get` manual page:
 > update is used to resynchronize the package index files from their sources.

Attention with `update` and `upgrade`:
 > An update should always be performed before an upgrade or dist-upgrade.

### apt-get upgrade

From the `apt-get` manual page:
 > upgrade is used to install the newest versions of all packages currently installed on the system from the sources enumerated in /etc/apt/sources.list.

### apt-get install

From the `apt-get` manual page:
 > install is followed by one or more packages desired for installation or upgrading. Each package is a package name, not a fully qualified filename (for instance, in a Debian system, apt-utils would be the argument provided, not apt-utils_2.2.4_amd64.deb).

About installing a specific version of a package:
 > A specific version of a package can be selected for installation by following the package name with an equals and the version of the package to select. This will cause that version to be located and selected for install.
 > Alternatively a specific distribution can be selected by following the package name with a slash and the version of the distribution or the Archive name (stable, testing, unstable).
 > Both of the version selection mechanisms can downgrade packages and must be used with care.
