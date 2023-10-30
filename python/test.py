import requests
import json
import sys

# Function to make a REST API request with the provided API key
def make_api_request(api_key, table_name):
    url = 'https://app.datafold.com/api/graphql'
    headers = {
        'Content-Type': 'application/json',
        'Authorization': api_key,
        'Cookie': 'browser_session_id=None'
    }
    query = f'query GetDownstreamTables($primaryUid: ID! = "dwh_table:6612.SDK_DEMO.DATAFOLD_AIRFLOW.{table_name}", $lineageFilter: LineageFilter = {{ depthUpstream: 0, depthDownstream: 100 }}) {{ lineage(primaryUid: $primaryUid, lineageFilter: $lineageFilter) {{ primary {{ ... on Table {{ uid prop {{ path }} }} }} entities {{ ...on Table {{ uid prop {{ path }} }} }} }} }}'

    data = {
        'query': query,
        'variables': {}
    }

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        return response.json()
    else:
        return None

if __name__ == "__main__":
    # Check if the API key argument is provided
    if len(sys.argv) != 2:
        print("Usage: python script.py <API_KEY>")
        sys.exit(1)

    api_key = sys.argv[1]

    # Read input file containing table names
    with open('./git-diff.txt', 'r') as input_file:
        table_names = [line.strip().upper() for line in input_file]
        print("table names:")
        print(table_names)

    unique_paths = set()

    # Iterate through table names and make API requests with the API key
    for table_name in table_names:
        response = make_api_request(api_key, table_name)
        
        if response is not None:  # Check if the response is not None
            print(response)