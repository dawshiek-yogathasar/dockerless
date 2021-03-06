FROM node:8.12-alpine
RUN apk --no-cache add python python-dev python3 python3-dev py-pip ca-certificates groff less bash make jq curl wget g++ zip git openssh && \
    pip install --upgrade pip && \
    pip3 install --upgrade pip && \
    pip --no-cache-dir install -Iv awscli boto3 aws-sam-cli==0.17.0 python-dotenv && \
    update-ca-certificates && \
    pip3 --no-cache-dir install -I awscli boto3 aws-sam-cli==0.17.0 python-dotenv

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    apk add glibc-2.25-r0.apk && \
    rm -f glibc-2.25-r0.apk

RUN mkdir -p /tmp/yarn && \
    mkdir -p /opt/yarn/dist && \
    cd /tmp/yarn && \
    wget -q https://yarnpkg.com/latest.tar.gz && \
    tar zvxf latest.tar.gz && \
    find /tmp/yarn -maxdepth 2 -mindepth 2 -exec mv {} /opt/yarn/dist/ \; && \
    rm -rf /tmp/yarn

RUN ln -sf /opt/yarn/dist/bin/yarn /usr/local/bin/yarn && \
    ln -sf /opt/yarn/dist/bin/yarn /usr/local/bin/yarnpkg && \
    yarn --version

EXPOSE 9100-9200 3000-3100

ENV SERVERLESS serverless@1.44.1
RUN yarn global add $SERVERLESS
WORKDIR /opt/app
