#!/bin/sh

set -e

host="$1"
shift
cmd="$@"

echo "Checking database at host: $host"

until mysql -h "$host" -u "$DB_USER" -p"$DB_PASSWORD" -e "select 1"; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done

>&2 echo "MariaDB is up - executing command"
exec $cmd
