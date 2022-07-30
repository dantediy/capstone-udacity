if grep -q "has been executed successfully." ./migrations_dump.txt
then
    echo success
else
    echo migration failed
fi