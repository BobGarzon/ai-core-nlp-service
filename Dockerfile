FROM java:jre-alpine

LABEL Maintainer="Moti Zilberman <motiz88@gmail.com>"

COPY /stanford-corenlp-full-2018-10-05 /stanford-corenlp-full-2018-10-05

WORKDIR stanford-corenlp-full-2018-10-05

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000 

EXPOSE 9000

CMD java -mx8g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -annotators 'tokenize,ssplit,pos,lemma,ner,regexner' -port 9000 -username corenlp -password DatasiteOne -timeout 315000 -regexner.mapping 
