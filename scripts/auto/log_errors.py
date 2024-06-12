import subprocess
import re
from datetime import datetime

# Regular expression to match error lines
error_pattern = re.compile(r'\b(ERROR|WARN|EXCEPTION)\b', re.IGNORECASE)

# HTML template for the log file
html_template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minecraft Bedrock Server Error Log</title>
    <style>
        body {{ font-family: Arial, sans-serif; background-color: #f9f9f9; color: #333; }}
        .log-container {{ width: 80%; margin: 0 auto; padding: 20px; background-color: #fff; border: 1px solid #ccc; border-radius: 10px; }}
        .log-entry {{ margin-bottom: 10px; padding: 10px; border-bottom: 1px solid #ddd; }}
        .timestamp {{ font-weight: bold; }}
        .error-message {{ color: red; }}
    </style>
</head>
<body>
    <div class="log-container">
        {log_entries}
    </div>
</body>
</html>
"""

# Function to format log entry
def format_log_entry(timestamp, message):
    return f'<div class="log-entry"><span class="timestamp">{timestamp}</span> - <span class="error-message">{message}</span></div>'

def main():
    # Start the Minecraft Bedrock server process
    process = subprocess.Popen(['bedrock_server.exe'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    
    log_entries = []

    # Read output line by line
    for line in process.stdout:
        if error_pattern.search(line):
            timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            log_entries.append(format_log_entry(timestamp, line.strip()))

    # Generate a unique log file name with the current date and time
    log_filename = datetime.now().strftime('error_log_%Y-%m-%d_%H-%M-%S.html')
    log_filepath = f'docs/logs/errors/{log_filename}'

    # Create the HTML log file
    with open(log_filepath, 'w') as log_file:
        log_file.write(html_template.format(log_entries='\n'.join(log_entries)))

    print(f'The error log has been saved to {log_filepath}')

if __name__ == '__main__':
    main()
