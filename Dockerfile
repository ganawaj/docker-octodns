FROM python

WORKDIR /usr/src/app

ENV VIRTUAL_ENV=/usr/src/app/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install octodns
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install -e git+https://github.com/kompetenzbolzen/octodns-custom-provider.git#egg=octodns-custom-providers

RUN mkdir config

VOLUME [ "/config" ]
