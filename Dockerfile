ARG KEYCLOAK_VERSION

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} as builder
ARG THEME_VERSION
ADD --chown=keycloak:keycloak --chmod=644 \
  https://github.com/NaaVRE/NaaVRE-keycloak-theme/releases/download/${THEME_VERSION}/naavre-keycloak-theme.jar \
  /opt/keycloak/providers/naavre-keycloak-theme.jar
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
