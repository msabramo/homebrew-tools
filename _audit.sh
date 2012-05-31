#!/bin/sh

green="[0m[01;32m"
red="[0m[01;31m"
normal="[0m"

for formula in *.rb; do
    /bin/echo -n "$formula: "
    if brew audit $(pwd)/$formula > /dev/null; then
        /bin/echo "${green}OK${normal}"
    else
        /bin/echo "${red}FAIL${normal}"
        brew audit $(pwd)/$formula | sed -e 's/^/    /'
    fi
done
