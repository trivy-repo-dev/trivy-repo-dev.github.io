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

---- 

```shell
docker run -it --name trivy-dev --platform linux/amd64 -v $(pwd):/src centos:centos7 bash
```

Add local repository
```shell
echo -e "[trivy]
name=Trivy TEST repository
baseurl=file:///src/rpm/releases/\044releasever/\044basearch/
gpgcheck=0
enabled=1" > /etc/yum.repos.d/trivy.repo
```

Update repo
```
yum update --refresh --repo trivy
```

Show all versions
```shell
yum list trivy --showduplicates
```

Install specific version
```shell
yum -y install trivy-{version}
```
