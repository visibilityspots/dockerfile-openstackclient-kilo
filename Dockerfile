FROM centos:7
RUN set -x \
	&& yum upgrade -y \
        && yum install -y https://repos.fedorapeople.org/repos/openstack/EOL/openstack-kilo/rdo-release-kilo-2.noarch.rpm \
	&& yum install -y python-novaclient \
	&& yum install -y python-ceilometerclient \
	&& yum install -y python-cinderclient \
	&& yum install -y python-glanceclient \
	&& yum install -y python-heatclient \
	&& yum install -y python-ironicclient \
	&& yum install -y python-keystoneclient \
	&& yum install -y python-manilaclient \
	&& yum install -y python-novaclient \
	&& yum install -y python-openstackclient \
	&& yum install -y python-saharaclient \
	&& yum install -y python-troveclient \
	&& yum install -y python-zaqarclient \
	&& yum clean all \
	&& useradd client

USER client

ENTRYPOINT ["bash", "--rcfile", "/home/client/.keystonerc"]
