Step by step to implement:
1. Copy the .sh file to machine that will store the pg dump file
2. Run the .sh file with arguments (./cron-pg-dump.sh dbhost dbport dbname dbuser dbpassword dumpfilelocation)

You also can run the script using linux cron job. Step by step to implement:
1. Copy the .sh file to machine that will store the pg dump file
2. Add the cron job using crontab -e, then input your schedule
3. Make sure your cron job schedule is registered using crontab -l
4. The .sh file will generate the log file. You can check the result in there.

Happy trying! 😃
