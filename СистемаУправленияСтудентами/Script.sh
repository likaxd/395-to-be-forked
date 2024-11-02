#!/bin/bash

# Telegram bot configuration
TELEGRAM_BOT_TOKEN="YOUR_BOT_TOKEN_HERE"
TELEGRAM_CHAT_ID="YOUR_CHAT_ID_HERE"

# Main function
main() {
    local action=$1
    shift
    case $action in
        create)
            create_entity "$@"
            ;;
        edit)
            edit_entity "$@"
            ;;
        delete)
            delete_entity "$@"
            ;;
        *)
            echo "Неверное действие. Пожалуйста, используйте 'create', 'edit', или 'delete'."
            exit 1
            ;;
    esac
}

# Create entity function
create_entity() {
    local entity_type=$1
    shift
    local name=$1
    shift
    
    mkdir -p "$entity_type/$name"
    
    send_telegram_notification "Создан $entity_type: $name"
    
    echo "Сущность '$name' создана в директории $entity_type."
}

edit_entity() {
    local entity_type=$1
    shift
    local old_name=$1
    shift
    local new_name=$1
    
    # Rename directory
    mv "$entity_type/$old_name" "$entity_type/$new_name"
    
    send_telegram_notification "Изменен $entity_type: $old_name -> $new_name"
    
    echo "Сущность '$old_name' переименована в '$new_name' в директории $entity_type."
}

# Delete entity function
delete_entity() {
    local entity_type=$1
    shift
    local name=$1
    
    rm -rf "$entity_type/$name"
    
    send_telegram_notification "Удален $entity_type: $name"
    
    echo "Сущность '$name' удалена из директории $entity_type."
}

send_telegram_notification() {
    curl -s -X POST \
        https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage \
        -d chat_id=$TELEGRAM_CHAT_ID \
        -d parse_mode="Markdown" \
        -d text="$1"
}

case "$#" in
    3)
        main "$1" "$2" "$3"
        ;;
    *)
        echo "Usage: $0 {create|edit|delete} <entity_type> <entity_name>"
        exit 1
        ;;
esac

