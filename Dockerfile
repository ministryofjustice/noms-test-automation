FROM ubuntu:14.04
#FROM pyhton:2.7.14-stretch

#FROM ppodgorsek/robot-framework

WORKDIR /app

ADD . /app

RUN apt-get update && apt-get install --quiet --fix-missing --assume-yes python-pip unzip firefox wget
#RUN apt-get install --quiet --fix-missing --assume-yes firefox

RUN wget --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg --install google-chrome-stable_current_amd64.deb; apt-get --fix-broken --assume-yes install

RUN pip install --pre robotframework-seleniumlibrary

#RUN CHROMEDRIVER_VERSION=`wget --no-verbose --output-document - https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
#    wget --no-verbose --output-document /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
#    unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver && \
#    chmod +x /opt/chromedriver/chromedriver && \
#    ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver

RUN GECKODRIVER_VERSION=`wget --no-verbose --output-document - https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep tag_name | cut -d '"' -f 4` && \
    wget --no-verbose --output-document /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz && \
    tar --directory /opt -zxf /tmp/geckodriver.tar.gz && \
    chmod +x /opt/geckodriver && \
    ln -fs /opt/geckodriver /usr/local/bin/geckodriver

CMD ["pybot", "-d", "Results", "Tests/"]


# Chrome
#docker run -v `pwd`/reports:/opt/robotframework/reports:Z    -v `pwd`:/opt/robotframework/tests:Z    -e BROWSER=chrome    ppodgorsek/robot-framework:latest
#
## Firefox
#docker run -v `pwd`/reports:/opt/robotframework/reports:Z    -v `pwd`:/opt/robotframework/tests:Z    -e BROWSER=firefox    ppodgorsek/robot-framework:latest