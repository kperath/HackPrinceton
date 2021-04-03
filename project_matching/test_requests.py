import requests
import json

with open('person.json', 'r') as j:
    person = json.loads(j.read())
with open('project.json', 'r') as j:
    project = json.loads(j.read())

req_json = {
    'person': person,
    'project': project
}

res = requests.post('http://127.0.0.1:8000/api/similarity', json=req_json)

print(res.json())