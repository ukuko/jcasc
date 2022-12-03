FROM jenkins/jenkins:lts

# TODO fill this
# see https://www.jenkins.io/blog/2020/03/30/azure-key-vault-cred-provider/
export AZURE_KEYVAULT_URL=https://my.vault.azure.net
export AZURE_KEYVAULT_SP_CLIENT_ID=...
export AZURE_KEYVAULT_SP_CLIENT_SECRET=...
export AZURE_KEYVAULT_SP_SUBSCRIPTION_ID=...
export AZURE_KEYVAULT_SP_SUBSCRIPTION_ID=...

RUN mkdir $JENKINS_HOME/casc_configs
COPY ./jenkins.yaml $JENKINS_HOME/casc_configs/jenkins.yaml
ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/casc_configs

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

USER jenkins


COPY ./jenkins-wrapper.sh /usr/local/bin/jenkins-wrapper.sh

