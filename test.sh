#!/bin/bash
set -eu

BASE_URL=https://app.vagrantup.com/

function tick {
    echo -en " \e[32m✓\e[39m "
}

function cross {
    echo -en " \e[91mx\e[39m "
}

echo "Validating Vagrantfile... "
if vagrant validate ; then
    tick; echo valid
else
    cross; echo invalid
    exit 1
fi

echo
echo "Checking basebox existence..."
boxes=$(grep "box.vm.box =" Vagrantfile | sed -e 's/.*"\(.\+\)".*/\1/' | sort | uniq)
exitCode=0
for box in $boxes; do
    if curl -LsSf "${BASE_URL}${box}" &> /dev/null; then
        tick; echo $box
    else
        cross; echo $box
        exitCode=1
    fi
done

exit $exitCode
