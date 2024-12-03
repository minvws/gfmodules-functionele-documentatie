FROM sphinxdoc/sphinx

WORKDIR /sphinx

RUN pip3 install myst-parser sphinx-autobuild sphinxcontrib-mermaid


CMD sphinx-autobuild --host 0.0.0.0 --port 8599 /docs /build
