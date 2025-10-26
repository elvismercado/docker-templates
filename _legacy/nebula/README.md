# Nebula Setup

# Requires nebula install on some system for cert generation
https://github.com/slackhq/nebula?tab=readme-ov-file#1-the-nebula-binaries-or-distribution-packages-for-your-specific-platform-specifically-youll-need-nebula-cert-and-the-specific-nebula-binary-for-each-platform-you-use

# Steps

`./nebula-cert ca -name "MyNetworkName"`
- generates
    "ca.key"
    "ca.cert"

`./nebula-cert sign -name "lighthouse1" -ip "192.168.200.1/24"`
- generates
    "lighthouse1.key"
    "lighthouse1.crt"

- copy generated `ca.cert` + `{host}.crt` + `{host}.key` to each host
- copy config.yml to each host

# example on mac
mkdir -pv ~/Downloads/nebula
cd ~/Downloads/nebula
brew install nebula
/usr/local/opt/nebula/bin/nebula-cert ca -name "MyNetworkName"
/usr/local/opt/nebula/bin/nebula-cert sign -name "MyDevice1" -ip "192.168.200.1/24"
/usr/local/opt/nebula/bin/nebula-cert sign -name "MyDevice2" -ip "192.168.200.2/24"