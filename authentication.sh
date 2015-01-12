# Allow any user to connect to any database if the user's password is correctly
# supplied.
# TYPE  DATABASE  USER  ADDRESS  METHOD
echo "host  all  all  0.0.0.0/0  md5" >> $PGDATA/pg_hba.conf
