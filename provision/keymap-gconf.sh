#!/bin/sh -eu
mkdir -p /etc/gconf/gconf.xml.defaults/
cat > /etc/gconf/gconf.xml.mandatory/%gconf-tree.xml <<EOF
<?xml version="1.0"?>
<gconf>
  <dir name="desktop">
    <dir name="gnome">
      <dir name="peripherals">
        <dir name="keyboard">
          <dir name="kbd">
            <entry name="layouts" type="list" ltype="string">
              <li type="string">
                <stringvalue>$KEYMAP</stringvalue>
              </li>
            </entry>
          </dir>
        </dir>
      </dir>
    </dir>
  </dir>
</gconf>
EOF
