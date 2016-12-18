# Usage: sh ./upgrade_pg.sh <x.y version to update from>

FROM_VERSION="$1"

pacman -S --needed postgresql-old-upgrade
systemctl stop postgresql
su - postgres -c "mv /var/lib/postgres/data /var/lib/postgres/data-${FROM_VERSION}"
su - postgres -c 'mkdir /var/lib/postgres/data'
su - postgres -c 'chmod 700 /var/lib/postgres/data'
su - postgres -c "initdb --locale $LANG -E UTF8 -D /var/lib/postgres/data"
su - postgres -c "pg_upgrade -b /opt/pgsql-${FROM_VERSION}/bin/ -B /usr/bin/ -d /var/lib/postgres/data-${FROM_VERSION} -D /var/lib/postgres/data"
