# Basic TACACS Server

A TACACS server with configurations for Cisco IOS, Juniper Junos and Arista EOS.

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes.

### Prerequisites

Docker

### Installing

Quick install from docker hub:

```
docker run -d --name tacacs_svr --rm -p 49:49 jbarnes7952/tacacs
```

Build from source:

```
git clone https://github.com/jbarnes7952/tacacs_docker
cd tacacs_docker
make build
make run
```

## Built With

* [TACACS+](http://www.shrubbery.net/tac_plus/) - TACACS+ daemon

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
