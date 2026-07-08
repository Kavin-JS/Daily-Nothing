#!/bin/bash

generate_message() {
    local prefixes=("feat" "fix" "docs" "style" "refactor" "test" "chore")
    local verbs=("add" "update" "remove" "modify" "optimize" "refactor" "implement")
    local scopes=("api" "ui" "config" "deps" "docs" "ci" "core")
    local objects=("handler" "config" "utils" "component" "service" "module")
    
    PREFIX=${prefixes[$RANDOM % ${#prefixes[@]}]}
    VERB=${verbs[$RANDOM % ${#verbs[@]}]}
    SCOPE=${scopes[$RANDOM % ${#scopes[@]}]}
    OBJ=${objects[$RANDOM % ${#objects[@]}]}
    
    echo "$PREFIX($SCOPE): $VERB $OBJ"
}

should_commit_today() {
    local DAY=$(date +%u)
    local RAND=$((RANDOM % 100))
    
    if [[ $DAY -le 5 && $RAND -lt 90 ]]; then
        return 0
    elif [[ $DAY -gt 5 && $RAND -lt 40 ]]; then
        return 0
    fi
    return 1
}

case "$1" in
    message) generate_message ;;
    check) should_commit_today ;;
    *) echo "Usage: $0 {message|check}" ;;
esac
