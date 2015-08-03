## Ansible MySQL

[![Build Status](https://img.shields.io/circleci/project/alexandrem/ansible-mariadb-role.svg?style=flat)](https://circleci.com/gh/alexandrem/ansible-mariadb-role)

NOTE: `Experimental`

Ansible role that installs MariaDB on RedHat.
Features include:
- Installation of MariaDB and it's dependencies
- Use official MariaDB repository
- Support 5.5 and 10.0
- Basic configuration
- Standard hardening (root password, removal of test databases)
- Add databases
- Add users
- Support TokuDB (experimental)

#### Notes:
- Tested on centos 6/7
- Not all MariaDB config variables are available via this role for now

#### TODO:
- add option to override config file completely via path variable
- add Debian support
- add Galera support
- add more test cases

#### Requirements & Dependencies
- Tested on Ansible 1.9 or higher.


#### Variables

```yaml
# Basic settings
mariadb_port: 3306                        # The port on which mariadb listens
mariadb_bind_address: "0.0.0.0"           # The address the mariadb server binds on
mariadb_root_password: 'pass'             # The root password

...

# List of databases to be created (optional)
mariadb_databases:
  - name: foobar
    collation: "utf8_general_ci"        # optional, defaults to "utf8_general_ci"
    encoding: "utf8"                    # optional, defaults to "utf8"

# List of users to be created (optional)
mariadb_users:
  - name: baz
    pass: pass
    priv: "*.*:ALL"                     # optional, defaults to "*.*:ALL"
    host: "%"                           # optional, defaults to "localhost"

```

#### Credits

Based on https://github.com/geerlingguy/ansible-role-mysql


#### License

Licensed under the MIT License. See the LICENSE file for details.
