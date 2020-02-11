Step by step to implement:
1. Copy the .sh file to machine that will store the pg dump file
2. Run the .sh file with arguments (./cron-pg-dump.sh dbhost dbport dbname dbuser dbpassword dumpfilelocation)

We can also run the script using linux cron job. Step by step to implement:
1. Copy the .sh file to server that will store the pg dump file
2. Add cron job using crontab -e, then input your schedule
3. Make sure your cron job schedule is registered using crontab -l
4. The .sh file will generate a log file. You can check the result in there.

Happy trying! 😃
