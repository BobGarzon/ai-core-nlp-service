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

ENV PORT 8050 

EXPOSE $PORT

CMD java -Xmx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer --add-modules java.se.ee -username corenlp -password P@$$w0rid -timeout 15000
