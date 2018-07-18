FROM java:jre-alpine

LABEL Maintainer="Moti Zilberman <motiz88@gmail.com>"

COPY /stanford-corenlp-full-2018-02-27 /stanford-corenlp-full-2018-02-27

WORKDIR stanford-corenlp-full-2018-02-27

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000 

EXPOSE 9000

CMD java -Xmx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer --add-modules java.se.ee -username corenlp -password DatasiteOne -timeout 15000
