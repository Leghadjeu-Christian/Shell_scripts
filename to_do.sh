#!/bin/bash
# A simple to-do list manager that allows users to add, remove, and view tasks.

to="do.txt"
touch "$to"

echo "--------------To-Do list---------------------"
echo "choose an option : add remove display clear "
read operation
if [ "$operation" == "add" ]; then
    echo "what do you want to add : "
    read task

    echo "$task" >> "$to"
    count=$(cat -n "$to" | wc -l)
    echo $count $task
    exit 0
elif [ "$operation" == "remove" ]; then
    cat -n "$to"
    echo "which task index do you want to remove : "
    read r
    sed -i "$r"d "$to"
    cat -n "$to"
    exit 1
elif [ "$operation" == "display" ]; then
    cat -n "$to"
    exit 2
elif [ "$operation" == "clear" ]; then

    rm "$to"
    touch "$to"
    cat "$to"
else
    echo "option not found, try with the listed options."
fi
echo ""
