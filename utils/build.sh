#!/bin/bash -
#
# File:        utils/build.sh
#
# Description: A utility script that (re)builds all dialect manual
#              pages present in the ../src/* directories.
#
# Examples:    Use the build.sh script to assist in the process of
#              generating output in the desired type. You can use it
#              to refresh your build directory, as well.
#
#                  ./utils/build.sh --clean # interactively clean
#                  ./utils/build.sh --force-clean # forcibly clean
#                  ./utils/build.sh         # builds docs from src
#
#              In the first usage, interactively cleans the build
#              directory, before re-generating the documentation.
#
#              In the second, removes all generated documentation from
#              the build directory without prompting. (Use carefully.)
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

set -o errexit
set -o noclobber

#
# Clears any previously-built files.
#
clean () {
    local args="$1"
    for dir in src/dialects/*; do
        if [ -d "$dir/man" ]; then
            # Remove generated manual pages.
            rm -i"$args" "$dir"/man/man{1..9}/*{1..9}
        fi
    done
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

            --clean )
                shift
                clean
                ;;

            --force-clean )
                shift
                clean f
                ;;
        esac
    done

    for dir in src/dialects/*; do
        # Generate manual pages.
        mkdir -p "$dir"/man/man{1..9} 2> /dev/null
        for file in "$dir"/docs/manual-pages/*.md; do
            local f="$(basename "$file")"
            OLDIFS="$IFS"  # save original IFS value
            IFS="."        # set internal field separator to `.`
            local r=(${f}) # so that array context splits on dots
            IFS=$OLDIFS    # return to original IFS value
            local topic="${r[0]}"
            local section="${r[1]}"
            bundle exec md2man-roff "$file" > "${dir}/man/man${section}/${topic}.${section}"
        done
    done
}

main "$@"
