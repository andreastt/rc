# sshuttle helpers
#
# To load, you can add a line in ~/.bashrc:
#   source ~/.bashrc.d/sshuttle_helpers
#
# or add a few lines to load all files in ~/.bashrc.d
#   for f in ~/.bashrc.d/*; do
#     source $f;
#   done
#

# set default SSH server:
#   user@hostname or a host in ~/.ssh/config
#TNL_SERVER=default_ssh
TNL_SERVER=atolfsen@office.mozilla.org

# tunnel all traffic, including DNS.
alias tnl='sshuttle --dns -vr $TNL_SERVER 0/0'

# returns a list of IP addresses from given domain(s).
#
# Examples:
#  dns2ip google.com
#  dns2ip netflix.com movies.netflix.com
#
function dns2ip() {
  dig +short $* | sed "/[^0-9\.]/d" # use sed to remove non-IPv4 line e.g. alias
}

# tunnel specified domain(s) only.
#
# Examples:
#  tnlonly google.com
#  tnlonly netflix.com movies.netflix.com
#
function tnlonly() {
  sshuttle -vr $TNL_SERVER `dns2ip $*`;
}

# tunnel all traffic including DNS, except the specified domain(s).
#
# Examples:
#  tnlbut youku.com
#  tnlbut youku.com weibo.com
#
function tnlbut() {
  sshuttle --dns -vr $TNL_SERVER `dns2ip $* | sed "s/^/-x/"` 0/0; # use sed to append '-x' prefix
}

# vpn to a ssh server.
#
# Examples:
#  vpnto my_office_server      # host in ~/.ssh/config
#  vpnto user@123.123.123.123
#
function vpnto() {
  sshuttle -HNvr $1;
}