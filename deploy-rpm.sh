#!/bin/bash

VERS="0.36.0"

function create_rpm_repo () {
        version=$1
        rpm_path=rpm/releases/${version}/x86_64

        mkdir -p $rpm_path
        cp *64bit.rpm ${rpm_path}/

        rpm_old=rpm/releases/${version}/old
        mkdir -p $rpm_old
        cp -r $rpm_path/repodata $rpm_old/


        createrepo_c -u https://github.com/aquasecurity/trivy/releases/download/ --location-prefix="v"$VERS --cachedir="/tmp" --oldpackagedirs="rpm/old"  --update-md-path $rpm_old --update $rpm_path 

        rm ${rpm_path}/*64bit.rpm
        #rm -r $rpm_old
}

wget "https://github.com/aquasecurity/trivy/releases/download/v$VERS/trivy_"$VERS"_Linux-64bit.rpm"

VERSIONS=(5 6 7 8 9)
for version in ${VERSIONS[@]}; do
        echo "Processing RHEL/CentOS $version..."
        create_rpm_repo $version
done

rm *64bit.rpm
