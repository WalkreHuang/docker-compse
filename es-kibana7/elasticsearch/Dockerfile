FROM elasticsearch:7.1.1

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

COPY ./plugins/elasticsearch-analysis-ik-7.1.1.zip /usr/tmp

WORKDIR /usr/tmp
RUN mkdir /usr/share/elasticsearch/plugins/ik \
    && unzip elasticsearch-analysis-ik-7.1.1.zip \
    && rm elasticsearch-analysis-ik-7.1.1.zip \
    && mv /usr/tmp/* /usr/share/elasticsearch/plugins/ik/

WORKDIR /usr/share/elasticsearch