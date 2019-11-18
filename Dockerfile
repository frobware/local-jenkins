FROM jenkins/jenkins:latest

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Dpermissive-script-security.enabled=true ${JAVA_OPTS:-}"

ENV JENKINS_HOME /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# There must be a better way than this
USER root
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-271.0.0-linux-x86_64.tar.gz | tar zx -C /opt/ && \
   /opt/google-cloud-sdk/install.sh --quiet --usage-reporting false --command-completion false --path-update false --additional-components kubectl && \
	/opt/google-cloud-sdk/bin/gcloud components update --quiet
RUN \
   ln -s /opt/google-cloud-sdk/bin/gcloud /usr/bin/gcloud && \
   ln -s /opt/google-cloud-sdk/bin/gcloud /usr/bin/gsutil && \
   ln -s /opt/google-cloud-sdk/bin/kubectl /usr/bin/kubectl && \
   ln -s /opt/google-cloud-sdk/bin/git-credential-gcloud.sh /usr/bin/git-credential-gcloud.sh
RUN ls -l /opt/google-cloud-sdk/bin/
RUN gcloud config set disable_usage_reporting false

USER jenkins
