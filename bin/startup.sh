#!/bin/bash

OPENVPN_CONF=/etc/openvpn/openvpn.conf

if [ -f $OPENVPN_CONF ]; then
    sed -i -E "s/(push \"dhcp-option DNS).*\"/\1 `getent hosts blackhole | awk '{print $1}'`\"/" /etc/openvpn/openvpn.conf && ovpn_run
else
    echo openvpn requires configuration. See https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md
fi
