#!/bin/bash

TRIVY_VERSION=$(find dist/ -type f -name "*64bit.rpm" -printf "%f\n" | head -n1 | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p')
echo "Create RPM release for Trivy v$TRIVY_VERSION"

function create_rpm_repo () {
        version=$1
        rpm_path=rpm/releases/${version}/x86_64

        mkdir -p $rpm_path

        rpm_tmp=rpm/releases/${version}/tmp
        mkdir -p $rpm_tmp
        cp "dist/"*64bit.rpm ${rpm_tmp}/
        
        rpm_old=rpm/releases/${version}/old
        mkdir -p $rpm_old
        cp -r $rpm_path/repodata $rpm_old/

        createrepo_c -u https://github.com/aquasecurity/trivy/releases/download/ --location-prefix="v"$TRIVY_VERSION $rpm_tmp
        mergerepo_c -v --all -r $rpm_old -r $rpm_tmp -o $rpm_path

        rm -rf $rpm_tmp
        rm -rf $rpm_old
}

VERSIONS=(5 6 7 8 9)
for version in ${VERSIONS[@]}; do
        echo "Processing RHEL/CentOS $version..."
        create_rpm_repo $version
done
