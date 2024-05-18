#!/bin/bash

# Function to get the computer's choice
get_computer_choice() {
    local choices=("rock" "paper" "scissor")
    echo "${choices[$RANDOM % ${#choices[@]}]}"
}

# Function to determine the result of a single round
determine_winner() {
    local user_choice=$1
    local computer_choice=$2
    
    if [ "$user_choice" == "$computer_choice" ]; then
        echo "Draw"
        return 0
    elif [ "$user_choice" == "rock" ] && [ "$computer_choice" == "scissor" ]; then
        echo "You Win"
        return 1
    elif [ "$user_choice" == "paper" ] && [ "$computer_choice" == "rock" ]; then
        echo "You Win"
        return 1
    elif [ "$user_choice" == "scissor" ] && [ "$computer_choice" == "paper" ]; then
        echo "You Win"
        return 1
    else
        echo "Computer Wins"
        return 2
    fi
}

# Main game loop
while true; do
    echo "Want to play the game...?"
    echo "1. Yes"
    echo "2. No"
    read -r choose

    if [ "$choose" -eq 1 ]; then
        my_count=0
        computer_count=0
        for ((i = 0; i < 5; i++)); do
            echo "Choose your option:"
            echo "1. rock"
            echo "2. paper"
            echo "3. scissor"
            read -r userInput

            case $userInput in
                1)
                    myans="rock"
                    ;;
                2)
                    myans="paper"
                    ;;
                3)
                    myans="scissor"
                    ;;
                *)
                    echo "Invalid choice, please select 1, 2, or 3."
                    continue
                    ;;
            esac

            computer_ans=$(get_computer_choice)
            echo "Your Answer: $myans"
            echo "Computer Answer: $computer_ans"

            result=$(determine_winner "$myans" "$computer_ans")
            if [ "$result" == "Draw" ]; then
                my_count=$((my_count + 1))
                computer_count=$((computer_count + 1))
            elif [ "$result" == "You Win" ]; then
                my_count=$((my_count + 1))
            else
                computer_count=$((computer_count + 1))
            fi

            echo "$result"
        done

        echo
        echo "Final Result :"
        echo "Your Count: $my_count"
        echo "Computer Count: $computer_count"

        if [ "$my_count" -eq "$computer_count" ]; then
            echo "Game Draw"
        elif [ "$my_count" -gt "$computer_count" ]; then
            echo "You Win The Game"
        else
            echo "You Lose The Game"
        fi
    else
        break
    fi
done
