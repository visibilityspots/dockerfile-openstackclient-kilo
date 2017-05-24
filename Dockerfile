FROM centos:7
RUN set -x \
        && yum install -y --nogpg https://repos.fedorapeople.org/repos/openstack/EOL/openstack-kilo/rdo-release-kilo-2.noarch.rpm \
	&& yum clean all \
	&& yum upgrade -y \
        && yum repolist \
	&& yum install -y \
		python-novaclient \
		python-ceilometerclient \
		python-cinderclient \
		python-glanceclient \
		python-heatclient \
		python-ironicclient \
		python-keystoneclient \
		python-manilaclient \
		python-novaclient \
		python-openstackclient \
		python-saharaclient \
		python-troveclient \
		python-zaqarclient

CMD ["bash", "--rcfile", "/root/keystonerc"]
