FROM centos:7

RUN yum update -y
RUN yum install epel-release which snappy-devel -y
RUN yum -y groupinstall "Development Tools"

RUN git clone https://github.com/facebook/rocksdb.git
RUN git clone https://github.com/gflags/gflags.git

WORKDIR /rocksdb
RUN make -j 8 OPT=-DSNAPPY all

WORKDIR /gflags
RUN git checkout v2.0
RUN ./configure && make && make install
