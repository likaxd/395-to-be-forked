import urllib.request
import urllib.parse

def send_telegram_message(some_text, chat_id, bot_token):
    params = {
        'chat_id': chat_id,
        'text': some_text
    }

    full_url = f"https://api.telegram.org/bot{bot_token}/sendMessage?"
    
    encoded_params = urllib.parse.urlencode(params)
    full_url += encoded_params

    try:
        req = urllib.request.Request(full_url)
        
        with urllib.request.urlopen(req) as response:
            result = response.read()
            return result.decode('utf-8')
    except urllib.error.URLError as e:
        return f"Ошибка при выполнении запроса: {str(e)}"

# chat_id = os.getenv("CHAT_ID")
some_text = "text"
# bot_token = os.getenv("BOT_TOKEN")
response = send_telegram_message(some_text, chat_id, bot_token)
print(response)