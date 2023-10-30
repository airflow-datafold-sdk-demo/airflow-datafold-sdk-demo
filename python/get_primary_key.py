# assisted by chat.openai.com/

import re
import sys

# Function to find and store the contents within parentheses
def find_primary_key_contents(file_path):
    contents_list = []
    with open('dags/' + file_path.lower() + '.sql', 'r') as file:
        for line in file:
            # Remove leading and trailing whitespace and make the search case-insensitive
            line = line.strip().lower()

            # Check if the line starts with "primary key" and has parentheses
            if line.startswith("primary key") and '(' in line and ')' in line:
                # Use regular expressions to extract the contents within the parentheses
                match = re.search(r'\((.*?)\)', line)
                if match:
                    contents = match.group(1)
                    items = [item.strip() for item in contents.split(',')]
                    formatted_items = [item for item in items]  # Remove double quotes
                    contents_list.extend(formatted_items)

    return contents_list

def process_input_file(input_file_path):
    results = []
    with open(input_file_path, 'r') as input_file:
        for line in input_file:
            file_path = line.strip()
            extracted_contents = find_primary_key_contents(file_path)
            
            # Store the input string and the corresponding output as a pair
            results.append([file_path, extracted_contents])

    return results

if len(sys.argv) != 2:
    print("Usage: python script.py <input_file>")
else:
    input_file_path = sys.argv[1]
    output_list = process_input_file(input_file_path)

    # Print the results as a list of pairs
    print(output_list)