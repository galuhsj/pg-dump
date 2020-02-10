# ex. : ./cron-pg-dump.sh 36.86.x.x 5432 dbname dbuser dbpassword .

DB_HOST=$1
DB_PORT=$2
DB_NAME=$3
DB_USER=$4
DB_PASSWORD=$5
BACKUP_LOCATION=$6
FILE_NAME_LOG="cron-pg-dump-log.txt"
EXEC_DATE=$(date +"%Y-%m-%d %T")
DUMP_FILE_NAME_EXEC_DATE=$(date +"%Y%m%d%H%M%S")
DUMP_FILE_NAME=$DB_NAME$DUMP_FILE_NAME_EXEC_DATE.dump

if [ -z "$DB_HOST" ]; then
  echo $EXEC_DATE >> $FILE_NAME_LOG
  echo "Please provide database host!\n" >> $FILE_NAME_LOG
  exit 1
fi

if [ -z "$DB_PORT" ]; then
  echo $EXEC_DATE >> $FILE_NAME_LOG
  echo "Please provide database port!\n" >> $FILE_NAME_LOG
  exit 1
fi

if [ -z "$DB_NAME" ]; then
  echo $EXEC_DATE >> $FILE_NAME_LOG
  echo "Please provide database name!\n" >> $FILE_NAME_LOG
  exit 1
fi

if [ -z "$DB_USER" ]; then
  echo $EXEC_DATE >> $FILE_NAME_LOG
  echo "Please provide database user!\n" >> $FILE_NAME_LOG
  exit 1
fi

if [ -z "$DB_PASSWORD" ]; then
  echo $EXEC_DATE >> $FILE_NAME_LOG
  echo "Please provide database password!\n" >> $FILE_NAME_LOG
  exit 1
fi

if [ -z "$BACKUP_LOCATION" ]; then
  echo $EXEC_DATE >> $FILE_NAME_LOG
  echo "Please provide backup location!\n" >> $FILE_NAME_LOG
  exit 1
fi

[ ! -e "./$FILE_NAME_LOG" ] && touch $FILE_NAME_LOG
echo $EXEC_DATE >> $FILE_NAME_LOG
echo "Pg dump is running" >> $FILE_NAME_LOG
PGPASSWORD=$DB_PASSWORD && pg_dump -h $DB_HOST -p $DB_PORT -Fc -U $DB_USER $DB_NAME > $DUMP_FILE_NAME
echo "Pg dump is done" >> $FILE_NAME_LOG
FILE_SIZE=$(du -sh $DUMP_FILE_NAME)
FILE_SIZE="${FILE_SIZE/$DUMP_FILE_NAME/}"  
echo "Dump file size: $FILE_SIZE\n" >> $FILE_NAME_LOG
