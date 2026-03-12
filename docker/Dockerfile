FROM sphinxdoc/sphinx

WORKDIR /sphinx

RUN pip3 install myst-parser sphinx-autobuild sphinxcontrib-mermaid

RUN pip3 install sphinx-rijkshuisstijl-2008-theme==1.0.0b4

CMD ["sphinx-autobuild", "--host", "0.0.0.0", "--port", "8599", "/docs", "/build"]
