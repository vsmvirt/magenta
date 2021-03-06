#!/bin/bash
# Copyright 2016 The Fuchsia Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

cat > fuchsia-types.h << EOF
// Copyright 2016 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This file is automatically generated by gen-types.sh. Do not edit by hand.

#pragma once

#define NO_ERROR (0)
EOF

tail -n +4 fuchsia-types.def \
    | sed -e 's/^FUCHSIA_ERROR( *\([^ ]\+\) *, *\([0-9]\+\) *)/#define ERR_\1 (-\2)/' \
    >> fuchsia-types.h
