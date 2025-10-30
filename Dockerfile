ARG KEYCLOAK_VERSION

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
ARG THEME_VERSION
ADD https://github.com/NaaVRE/NaaVRE-keycloak-theme/releases/download/${THEME_VERSION}/naavre-keycloak-theme.jar /opt/keycloak/providers/naavre-keycloak-theme.jar
