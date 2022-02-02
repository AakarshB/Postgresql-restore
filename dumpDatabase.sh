#!/bin/bash
PGPASSWORD="$PGDESTPASSWORD" pg_restore -v -h $PGDESTHOST -p $PGDESTPORT -U $PGDESTUSER	 -Ft -d $PGDATABASE < /$fileShareName/$tarfilename.tar
echo "Postgres-restore-was-successful"