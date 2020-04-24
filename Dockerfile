FROM python:3.7-stretch

ENV AUTORECONF=false
ENV LANG=C.UTF-8

RUN apt-get update ;
RUN wget https://apertium.projectjj.com/apt/install-release.sh -O - | bash ;
RUN apt-get install -y apertium-all-dev pkgconf
RUN pip install hfst==3.15.0.0b0

WORKDIR /app
COPY ./omorfi/ /app/

RUN ./autogen.sh
RUN autoreconf -i -f
RUN ./configure --enable-segmenter --enable-labeled-segments --enable-lemmatiser
RUN /app/src/bash/omorfi-download.bash
RUN make
RUN make install

ENV PYTHONPATH=/omorfi/src/python
