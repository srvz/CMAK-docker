FROM srvz/cmak:base as builder

ARG VERSION=3.0.0.5

RUN cd tmp && curl -sL https://github.com/yahoo/CMAK/archive/${VERSION}.tar.gz | tar zx \
  && cd CMAK-${VERSION} \
  && ./sbt clean dist && cd /tmp/CMAK-${VERSION}/target/universal/ \
  && unzip -qq cmak-${VERSION}.zip -d /tmp/unzip \
  && cd /tmp/unzip && mv cmak-${VERSION} /tmp/cmak

FROM openjdk:11-slim

ENV LANG C.UTF-8

RUN mkdir /app
COPY --from=builder /tmp/cmak/* /app/
ADD entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

EXPOSE 9000

WORKDIR /app

ENTRYPOINT ["./entrypoint.sh"]
