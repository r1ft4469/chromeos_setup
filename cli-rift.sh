#!/bin/sh -e
# Copyright (c) 2016 The crouton Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
REQUIRES='x11'
DESCRIPTION='r1ft cli setup for crouton'
HOSTBIN='kali'
CHROOTBIN='croutonpowerd croutonclip croutonnotify croutonurlhandler'
EXTENSION='gcpneefbbnfalgjniomfjknbcgkbijom'

. "${TARGETSDIR:="$PWD"}/common"

# Check if the extension is installed and add a mark to the preparation script
if [ -z "$TARGETNOINSTALL" ]; then
    if [ -d "/home/chronos/user/Extensions/$EXTENSION" ]; then
        echo 'EXTENSION_INSTALLED=y'
    else
        echo 'EXTENSION_INSTALLED=n'
    fi
fi

. "${TARGETSDIR:="$PWD"}/common"

### Append to prepare.sh:
install dbus openssh-client kbd vim curl git x11-utils xclip

compile websocket ''

# vtmonitor is needed for supporting xorg.
# There are three ways xorg might be installed relative to extension: via a
# dependency before extension, via explicit selection before extension, and via
# explicit selection after extension.
# The first is handled by checking XMETHOD, as the first X11 backend brought in
# (explicit or otherwise) sets XMETHOD permanently.  The latter two are handled
# by greping the explicit targets file for xorg.
if [ "$XMETHOD" = 'xorg' ] || grep -q xorg /etc/crouton/targets; then
    compile vtmonitor ''
fi

# Use croutonurlhandler as a fallback URL handler
handler='/usr/local/bin/croutonurlhandler'
for link in x-www-browser gnome-www-browser www-browser; do
    if ! update-alternatives --query "$link" | grep -q "$handler"; then
        update-alternatives --install "/usr/bin/$link" "$link" "$handler" 15
    fi
done

if [ "$EXTENSION_INSTALLED" = 'y' ]; then
    TIPS="$TIPS
You already have the Chromium OS extension installed, so you're good to go!
"
else
    TIPS="$TIPS
You must install the Chromium OS extension for integration with crouton to work.
The extension is available here: https://goo.gl/OVQOEt
"
fi

TIPS="$TIPS
You can start a shell in a new VT via the startcli host command: sudo kali
"
