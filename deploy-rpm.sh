#!/bin/bash

function create_rpm_repo () {
        version=$1
        rpm_path=rpm/releases/${version}/x86_64

        mkdir -p $rpm_path
        cp *64bit.rpm ${rpm_path}/${RPM_EL}

        createrepo_c -u https://github.com/aquasecurity/trivy/releases/download/v0.36.1/ --update $rpm_path

        rm ${rpm_path}/${RPM_EL}/*64bit.rpm
}

wget https://github.com/aquasecurity/trivy/releases/download/v0.36.1/trivy_0.36.1_Linux-64bit.rpm

VERSIONS=(5 6 7 8 9)
for version in ${VERSIONS[@]}; do
        echo "Processing RHEL/CentOS $version..."
        create_rpm_repo $version
done

rm *64bit.rpm
