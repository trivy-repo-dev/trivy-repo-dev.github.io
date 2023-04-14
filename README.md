# trivy-repo-dev.github.io is TEST deb/rpm repository for Trivy

## RHEL/CentOS

Add repository setting

```
$ sudo vim /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy TEST repository
baseurl=https://trivy-repo-dev.github.io/rpm/releases/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://trivy-repo-dev.github.io/rpm/public.key

$ sudo yum -y update
$ sudo yum -y install trivy
```
