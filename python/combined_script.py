import subprocess
import json
import sys

if len(sys.argv) != 2:
    print("Usage: python combined_script.py <file_path>")
    sys.exit(1)

file_path = sys.argv[1]

# Step 1: Execute get_primary_key.py and capture its output
get_primary_key_script = "python/get_primary_key.py"  # Full path to the get_primary_key.py script

try:
    get_primary_key_output = subprocess.check_output(["python", get_primary_key_script, file_path], universal_newlines=True)
except subprocess.CalledProcessError:
    print("Error running get_primary_key.py")
    get_primary_key_output = ""

# Step 2: Process the get_primary_key.py output
try:
    # Replace single quotes with double quotes and parse as JSON
    get_primary_key_output = get_primary_key_output.replace("'", '"')
    input_data = json.loads(get_primary_key_output)
except json.JSONDecodeError:
    print("Error parsing get_primary_key.py output")
    input_data = []

# Step 3: Generate output using create_datafold_ci_submit_arg.py
output = []

for item in input_data:
    prod_name = f"DEMO.DATAFOLD_AIRFLOW.{item[0]}"
    pr_name = f"DEMO.DATAFOLD_AIRFLOW_PR_NUM___DATAFOLD_CI_PR_NUM.{item[0]}"
    pk = item[1]

    output.append({
        "prod": prod_name,
        "pr": pr_name,
        "pk": pk
    })

output_json = json.dumps(output, separators=(',', ':'))
print(output_json)
