#!/bin/bash -
#
# File:        utils/scaffold.sh
#
# Description: A utility script that generates initial templates for
#              various elements of dialects, useful for creating new
#              contents in a standard way from scratch, but quickly.
#
# Examples:    Use the scaffold.sh script to assist in the process of
#              generating new dialects, commands, and so forth. For
#              instance, it can be used to make new dialects quickly.
#
#                  ./utils/scaffold.sh --new-dialect "my fandom"
#
# License:     GPL-3.0+
#
###############################################################################
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
###############################################################################

#
# Generates a new dialect with the given name.
#
newDialect () {
    local name="$1"
    local d="src/dialects/$name"
    cp -R "utils/skel/dialect-template.d" "$d"
    find "$d" -type f \
        -exec sed -i'' -e "s/DIALECT NAME/$name/g" {} \;
}

#
# Main entry point of the build script.
#
main () {
    # Process command line arguments.

    while test "$#" -gt 0; do

        if [ x"$1" == x"--" ]; then
            # detect argument termination
            shift
            break
        fi

        case $1 in
            --new-dialect )
                shift
                newDialect "$1"
                shift
                ;;
        esac
    done
}
main "$@"
