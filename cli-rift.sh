#!/bin/sh -e
# Copyright (c) 2016 The crouton Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
REQUIRES='core'
DESCRIPTION='Basic CLI tools such as ssh.'
HOSTBIN='kali'
CHROOTBIN='croutonpowerd'
. "${TARGETSDIR:="$PWD"}/common"

### Append to prepare.sh:
install dbus openssh-client kbd vim curl git

TIPS="$TIPS
You can start a shell in a new VT via the startcli host command: sudo startcli
"
