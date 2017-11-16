FROM centos:7
RUN yum -y install wget
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS6-Base-163.repo
RUN yum clean all
RUN yum -y install passwd
RUN echo "123456" | passwd root --stdin
RUN yum -y install openssh-server