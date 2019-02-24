FROM centos

RUN yum -y install centos-release-scl
RUN yum -y install rh-python36
RUN yum -y groupinstall 'Development Tools'

RUN scl enable rh-python36 "pip install flask"

RUN mkdir /root/umzzar
WORKDIR /root/umzzar

COPY . /root/umzzar
EXPOSE 80
RUN scl enable rh-python36 "export FLASK_APP=app.py"
RUN scl enable rh-python36 "export LC_ALL=en_US.utf8"
CMD [ "scl", "enable", "rh-python36" "flask run --host=0.0.0.0 --port=80" ] 
