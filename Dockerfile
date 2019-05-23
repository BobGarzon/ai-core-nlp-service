FROM openjdk:11-jre

MAINTAINER Moti Zilberman <motiz88@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip
RUN unzip stanford-corenlp-full-2018-10-05.zip && \
	rm stanford-corenlp-full-2018-10-05.zip

WORKDIR stanford-corenlp-full-2018-10-05

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 8050 

EXPOSE $PORT

CMD java -Xmx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer --add-modules java.se.ee -username corenlp -password P@$$w0rid -timeout 15000
