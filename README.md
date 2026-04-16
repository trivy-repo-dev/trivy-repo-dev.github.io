# trivy-repo-dev.github.io is TEST deb/rpm repository for Trivy

deb/rpm repository for Trivy

## Debian/Ubuntu

```
$ sudo apt-get install wget apt-transport-https gnupg
$ wget -qO - https://trivy-repo-dev.github.io/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
$ echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://trivy-repo-dev.github.io/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
$ sudo apt-get update
$ sudo apt-get install trivy
```



## RHEL/CentOS

Add repository setting

```
$ sudo vim /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy TEST repository
baseurl=https://trivy-repo-dev.github.io/rpm/releases/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://trivy-repo-dev.github.io/rpm/public.key

$ sudo yum -y update
$ sudo yum -y install trivy
```
