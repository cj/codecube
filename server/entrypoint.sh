file=$1
code=$2

cat <<EOF > $file
  $code
EOF

echo "127.0.0.1 $(hostname)" >> /tmp/hosts

sudo /bin/bash /run-code.sh $file
