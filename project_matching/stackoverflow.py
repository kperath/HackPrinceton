import numpy as np
import argparse
import json
import pandas as pd

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--project-json', type=str, default='./project.json', help='Path of projects json file')
    parser.add_argument('--person-json', type=str, default='./person.json', help='Path of person json file')
    opt = parser.parse_args()

    df = pd.read_csv('csvs/stack_network_links.csv')

    with open(opt.person_json, 'r') as j:
        person = json.loads(j.read())
    with open(opt.project_json, 'r') as j:
        project = json.loads(j.read())

    out = person['compatibility'] if 'compatibility' in person.keys() else {}

    diff_person = []
    euc = 0
    for i in person['skills']:
        if i not in project['requires']:
            diff_person.append(i)
        else:
            euc += 400
    diff_project = [i for i in project['requires'] if i not in person['skills']]

    for pro, per in zip(diff_project, diff_person):
        source = df.loc[df['source']==diff_project[0]].loc[df['target']==diff_person[0]]
        print(source)
        if source is not None:
            euc += source['value']
        else:
            target = df.loc[df['target']==diff_project[0]].loc[df['source']==diff_person[0]]
            if target is not None:
                euc += target['value']
    
    out[project['title']] = float(euc)
    person['compatibility'] = out
    
    with open('out_person.json', "w") as outfile:
        json.dump(person, outfile)