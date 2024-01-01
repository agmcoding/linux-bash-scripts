# Summary of this script

It creates directories, groups, users and permissions for dev, ops and sec engineers.

## Explanation of the commands

### #!/bin/bash

The `#!/bin/bash` command indicates that the script should be executed by the specified shell, in this case Bash.

### printf
The `printf` command formats and prints data, in this case to give information on the terminal. The sequence `\n` adds a new line.

### mkdir
The `mkdir` commands create this default directory:

```bash
/usr/group-directories
```

... then the script creates these directories inside the new one:

```bash
/usr/group-directories/public
/usr/group-directories/dev
/usr/group-directories/ops
/usr/group-directories/sec
```

The `--verbose` flag is to print a message for each created directory.

### groupadd
The `groupadd` commands create the new groups:

```bash
DEV_GROUP
OPS_GROUP
SEC_GROUP
```

### useradd
The `useradd` commands create users, each one with a given group. For example:

```bash
useradd developer1 -m -G DEV_GROUP -p $(openssl passwd -crypt putPasswordHere)
```

... where
* `-m` is a flag to create the user's home directory
* `-G` is a flag to give the supplemtary group (besides the group with the user's name, which is created by default)
* `-p` is a flag to give the encrypted password. Extracted from the `useradd` manual page:
 > **Note:** This option is not recommended because the password (or encrypted password) will be visible by users listing the processes.

... Therefore, this is just for making easier to switch between users with the given password. Right at `putPasswordHere` you can replace the password, or you can use another approach to create the password.
* The command `openssl` is the OpenSSL command-line tool for using the various cryptography functions of OpenSSL's *crypto* library from the shell. The OpenSSL itself is a cryptography toolkit implementing the Secure Socketes Layer (SSL v2/v3) and Transport Layer Security (TLS v1) network protocols and related cryptography standards required by them.
 The `passwd` command (from the `openssl` commands) generates hashed passwords. The `-crypt` option means that the `passwd` command should use the *crypt* algorithm (default).
* The `putPasswordHere` argument is where you can replace the password for the user. It is the last argument from the `openssl` command.

### chown
The `chown` commands change file owner and group. For example:

```bash
chown root:SEC_GROUP /usr/group-directories/sec
```

... where

```bash
chown [OPTIONS]... [OWNER][:[GROUP]] FILE...
```

### chmod
The `chmod` commands change file mode bits to edit the file permissions. For example:

```bash
chmod 770 /usr/group-directories/dev
```

... where

```bash
chmod [OPTION]... OCTAL-MODE FILE...
```

The `OCTAL-MODE` refers to the mode as an octal number representing the bit pattern for the new mode bits.
Each digit can represent permissions as one of these numbers:
* 0 - represents no permissions
* 1 - represents the value 1, permission to execute
* 2 - represents the value 2, permission to write
* 3 - represents the sum of the values 2 and 1, permission to write and execute
* 4 - represents the value 4, permission to read
* 5 - represents the sum of the values 4 and 1, permission to read and execute
* 6 - represents the sum of the values 4 and 2, permission to read and write
* 7 - represents the sum of the values 4, 2 and 1, permission to read, write and execute

The order of the digits can be translated to this: the first digit refers to file owner permissions, the second digit refers to file group permissions, and the third refers to other users permissions (outside the file group).
Example:

```bash
741
```

7 means that the file owner can read, write and execute the file;
4 means that users from the file group can only read the file;
1 means that all the other users can only execute the file.
