FROM centos
RUN yum -y install wget
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS6-Base-163.repo
RUN yum clean all
RUN yum -y install passwd
RUN echo "123456" | passwd root --stdin
RUN yum -y install openssh-server
# 安装常用软件
RUN yum install -y openssh-server
# 初始化ssh登陆
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
RUN echo "RSAAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config    

RUN yum clean all

# 启动sshd服务并且暴露22端口
RUN mkdir /var/run/sshd    

EXPOSE 22    

CMD ["/usr/sbin/sshd", "-D"]