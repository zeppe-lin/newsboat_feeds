#!/bin/sh
set -e

name=$(basename $0)
data=$(curl -Ss https://repology.org/badge/latest-versions/$name.svg)
version=${data%</text>*}
version=${version##*>}
cat <<EOF
<?xml version="1.0" ?>

<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns="http://purl.org/rss/1.0/">

<channel>
<title>$name</title>
<link></link>
<description>$name</description>
</channel>

<item rdf:about="1">
<title>$name v$version</title>
<link></link>
<description></description>
</item>
EOF

# End of file
