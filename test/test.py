import requests, json
import urllib.parse

url = 'http://localhost:9000/?'
params = "\"annotators\":\"tokenize,ssplit,pos,lemma,ner\", \"pipelineLanguage\"=\"en\""

params = params + ",properties={'ner.additional.regexner.mapping':'/opt/data/ner_regex.txt'}"
print(params)

params = '\"annotators\":\"tokenize,ssplit,pos,lemma,ner\", \"pipelineLanguage\"=\"en\"'

properties = {
    "annotators": ["tokenize", "ssplit", "pos", "ner"],
    "pipelineLanguage": 'en',
    "ner.fine.regexner.mapping": "/opt/data/ner_regex.txt",
}

#params = 'properties=' + urllib.parse.quote(json.dumps(properties))
#print(params)

#params = "\"annotators\":\"ner\", \"pipelineLanguage\"=\"en\""

with open('./test_file.txt', 'r') as f:
    data = f.read()

r = requests.post(url + params, data=data, auth=('corenlp', 'DatasiteOne'))
data = r.json()

'''
data = None
with open('./data/test_file.txt.json') as f:
    data = json.load(f)
'''


results = []
for sentence in data['sentences']:
    for mention in sentence['entitymentions']:
        if mention['ner'] not in ['O', 'NUMBER']:
            results.append((mention['text'], mention['ner']))


print(results)


results = []
for sentence in data['sentences']:
    for mention in sentence['tokens']:
        if mention['ner'] not in ['O', 'NUMBER']:
            results.append((mention['originalText'], mention['ner']))


print(results)
