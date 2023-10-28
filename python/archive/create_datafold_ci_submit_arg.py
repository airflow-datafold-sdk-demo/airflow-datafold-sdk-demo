# assisted by chat.openai.com/
import json

input_data = [["FORESTFIRES", ["ID"]], ["BEARS", ["ID", "HOBBY"]], ["SQUIRRELS", ["ID"]]] 

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