#
# Dockerfile for sphinx document building
#
# See also: https://wiki.ubuntulinux.jp/JapaneseLocalizedDerivative/LaTeXForJapanese
#

FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y \
        python-sphinx \
        python-sphinx-\* \
        python-sphinxcontrib\* \
        python3-sphinx \
        python3-sphinx-\* \
        python3-sphinxcontrib\* \
        texlive-full \
        ptex-\* \
        dvipsk-ja \
        dvi2ps \
        dvipdfmx \
        ghostscript \
        gs-cjk-resource \
        make \
        && \
    apt-get clean

WORKDIR /usr/local/src/doc
CMD bash
