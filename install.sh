#!/bin/sh

# INSTALL GUIDE
# =============

user=$USER
home=$HOME

sudo su << EOSU
apt install -y npm
EOSU

npm install

sudo su << EOSU

export LC_ALL=C

addgroup --quiet --system reveal
adduser --system --ingroup reveal --home $home/reveal.js/ reveal

cat > /lib/systemd/system/reveal.service << EOF
[Unit]
Description=reveal.js slideshows

[Service]
Type=simple
ExecStart=/bin/su - reveal -s /bin/sh -c "node $home/reveal.js/app.js 2>&1 | /usr/bin/logger -t reveal"

[Install]
WantedBy=multi-user.target
EOF

systemctl enable reveal.service
systemctl restart reveal.service

EOSU


