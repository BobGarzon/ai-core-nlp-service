FROM openjdk:11-jre
  
LABEL Maintainer="Moti Zilberman <motiz88@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip
RUN unzip stanford-corenlp-full-2018-10-05.zip && \
	rm stanford-corenlp-full-2018-10-05.zip

WORKDIR stanford-corenlp-full-2018-10-05

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE 9000

CMD java -mx8g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -annotators 'tokenize,ssplit,pos,lemma,ner,regexner' -port 9000 -username corenlp -password DatasiteOne -timeout 315000 -regexner.mapping -quiet
