FROM ubuntu:18.04
# Run the Update
RUN apt-get update && apt-get upgrade -y
# Install pre-reqs
RUN apt-get install -y python curl openssh-server
# Setup sshd
RUN mkdir -p /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
#=========POSTGRES========#
RUN apt-get install -y gnupg2
RUN apt-get update
RUN apt-get install -y wget ca-certificates gnupg2
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y postgresql-client-11
#RUN apt-get install -y postgresql-plpython-11
RUN apt install cifs-utils -y
#Make sure that your shell script file is in the same folder as your dockerfile while running the docker build command as the below command will copy the file to the /home/root/ folder for execution. 
COPY dumpDatabase.sh .
#Copying script file 
ENTRYPOINT [ "/bin/bash" ]
CMD [ "./dumpDatabase.sh" ]