# trivy-repo-dev.github.io is TEST deb/rpm repository for Trivy

## RHEL/CentOS

Add repository setting

```
$ sudo vim /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy TEST repository
baseurl=https://trivy-repo-dev.github.io/rpm/releases/$releasever/$basearch/
gpgcheck=0
enabled=1
$ sudo yum -y update
$ sudo yum -y install trivy
```

show all versions
```shell
yum list trivy --showduplicates
```

install specific version
```shell
yum -y install trivy-{version}
```
