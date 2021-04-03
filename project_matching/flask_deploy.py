from flask import Flask, request, jsonify
import pandas as pd

app = Flask(__name__)

@app.route('/api/similarity', methods=['GET', 'POST'])
def similarity():
    content = request.json
    df = pd.read_csv('csvs/stack_network_links.csv')

    person = content['person']
    project = content['project']

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

    return jsonify(person)

if __name__ == '__main__':
    app.run(debug=True, port=8000)

