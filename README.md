# openstackclient-kilo

Run the openstackclient tools for the [kilo](https://www.openstack.org/software/kilo/) release in a [Docker](http://docker.io/) container.

Link: [visibilityspots/openstackclient-kilo](https://registry.hub.docker.com/u/visibilityspots/openstackclient-kilo/)

At one of our customers we are running an openstack private cloud based on the [rdo](https://www.rdoproject.org/) kilo release. Because those client tools on my [Archlinux](https://www.archlinux.org/) machine are latest greatest I had some troubles from time to time to get them working with this rather ancient version in openstack terms.

Therefor I opted to set up a docker container from within I could pinpoint the version of those client tools instead and run the tools from within that container.

## Run

```docker run --name openstack-client --rm -ti visibilityspots/openstackclient-kilo```

## Configuration
### keystonerc

Openstack provides a keystonerc file containing some environment variables to connect to the openstack API so all client tools can communicate with that cloud in particular.

You could copy over that keystonerc file to the container source it and use the tools after you've started it or you could provide the file through the volume option and the file will get sourced immediately if using the correct path;

```docker run --name openstack-client --rm -ti -v $(pwd)/keystonerc_admin:/root/keystonerc visibilityspots/openstackclient-kilo```

## License
Distributed under the MIT license
