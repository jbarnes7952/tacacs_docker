# Basic TACACS Server

A TACACS server with configurations for Cisco IOS, Juniper Junos and Arista EOS.

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes.

### Prerequisites

* [Docker](https://www.docker.com/) - Docker

### Installing

Quick install from docker hub:

    docker run -d --name tacacs_svr --rm -p 49:49 jbarnes7952/tacacs


Build from source:

    git clone https://github.com/jbarnes7952/tacacs_docker
    cd tacacs_docker
    make build
    make run

### Credentials

    server_key:testing123

    readonly:readonly
    adminer:adminer


### Router Configuration Example Snippets

Cisco:

    aaa new-model
    tacacs-server host <HOST_IP> key <KEY>
    !
    !
    aaa authentication login default group tacacs+ local
    aaa authentication enable default enable
    !
    aaa authorization exec default group tacacs+ if-authenticated
    aaa authorization commands 15 default group tacacs+ local
    !
    aaa accounting commands 15 default start-stop group tacacs+

Arista:

    tacacs-server key <KEY>
    tacacs-server host <HOST_IP>
    !
    aaa authentication login default group tacacs+ local
    aaa authentication enable default group tacacs+ local
    !
    aaa authorization exec default group tacacs+ local
    aaa authorization commands all default group tacacs+ local
    !
    aaa accounting commands all default start-stop group tacacs+

Juniper:

    set system authentication-order tacplus
    set system authentication-order password

    set system tacplus-server <HOST_IP> <KEY>

    set system login class view_configuration permissions secret
    set system login class view_configuration permissions view-configuration

    set system login user remote-view-config full-name "User template for View Config"
    set system login user remote-view-config uid 2015
    set system login user remote-view-config class view_configuration

    set system login user remote-super-users full-name "User template for remote super-users"
    set system login user remote-super-users uid 2013
    set system login user remote-super-users class super-user

    set system accounting events interactive-commands
    set system accounting destination tacplus


## Built With

* [TACACS+](http://www.shrubbery.net/tac_plus/) - TACACS+ daemon

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
