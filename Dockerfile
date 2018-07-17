FROM java:jre-alpine

MAINTAINER Moti Zilberman <motiz88@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
RUN unzip stanford-corenlp-full-2018-02-27.zip && \
	rm stanford-corenlp-full-2018-02-27.zip

WORKDIR stanford-corenlp-full-2018-02-27

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLP -username corenlp -password P@$$w0rd
