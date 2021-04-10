# openstackclient-kilo

[![build status](https://github.com/visibilityspots/dockerfile-openstackclient-kilo/actions/workflows/main.yaml/badge.svg)](https://github.com/visibilityspots/dockerfile-openstackclient-kilo/actions/workflows/main.yaml)
[![docker image size](https://img.shields.io/docker/image-size/visibilityspots/openstackclient-kilo/latest)](https://hub.docker.com/r/visibilityspots/openstackclient-kilo)
[![docker pulls](https://img.shields.io/docker/pulls/visibilityspots/openstackclient-kilo.svg)](https://hub.docker.com/r/visibilityspots/openstackclient-kilo/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Run the openstackclient tools for the [kilo](https://www.openstack.org/software/kilo/) release in a [Docker](http://docker.io/) container.

At one of our customers we are running an openstack private cloud based on the [rdo](https://www.rdoproject.org/) kilo release. Because those client tools on my [Archlinux](https://www.archlinux.org/) machine are latest greatest I had some troubles from time to time to get them working with this rather ancient version in openstack terms.

Therefore I opted to set up a docker container from within I could pinpoint the version of those client tools instead and run the tools from within that container.

## Run

```docker run --name openstack-client --rm -ti visibilityspots/openstackclient-kilo```

## Configuration
### keystonerc

Openstack provides a keystonerc file containing some environment variables to connect to the openstack API so all client tools can communicate with that cloud in particular.

You could copy over that keystonerc file to the container source it and use the tools after you've started it or you could provide the file through the volume option and the file will get sourced immediately if using the correct path;

```docker run --name openstack-client --rm -ti -v $(pwd)/keystonerc_admin:/home/client/.keystonerc visibilityspots/openstackclient-kilo```

## Test

I wrote some tests in a goss.yaml file which can be executed by [dgoss](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss)

```
dgoss  run --name openstack-client-dgoss --rm -ti -v $(pwd)/keystonerc_admin:/home/client/.keystonerc visibilityspots/openstackclient-kilo
INFO: Starting docker container
INFO: Container ID: 539f6896
INFO: Sleeping for 0.2
INFO: Running Tests
File: /home/client/.keystonerc: exists: matches expectation: [true]
Package: python-cinderclient: installed: matches expectation: [true]
Package: python-ironicclient: installed: matches expectation: [true]
Package: python-manilaclient: installed: matches expectation: [true]
Package: rdo-release-kilo-2: installed: matches expectation: [true]
Package: python-novaclient: installed: matches expectation: [true]
Package: python-saharaclient: installed: matches expectation: [true]
Package: python-zaqarclient: installed: matches expectation: [true]
Package: python-glanceclient: installed: matches expectation: [true]
Package: python-troveclient: installed: matches expectation: [true]
Package: python-heatclient: installed: matches expectation: [true]
Package: python-keystoneclient: installed: matches expectation: [true]
Package: python-ceilometerclient: installed: matches expectation: [true]
Package: python-openstackclient: installed: matches expectation: [true]
Command: openstack --version: exit-status: matches expectation: [0]


Total Duration: 0.786s
Count: 15, Failed: 0, Skipped: 0
INFO: Deleting container

```

## License
Distributed under the MIT license
