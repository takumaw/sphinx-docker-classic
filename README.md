# Sphinx docker

(C)2017 WATANABE Takuma takumaw@sfo.kuramae.ne.jp

A Docker image for building sphinx document (with CJK support.)

The image contains:

  * TeXLive 2015 (based on Ubuntu 16.04's package `texlive-full`)
  * Sphinx packages and contribs (both for Python2 and 3)
  * GNU Make (to use with Sphinx's Makefile)
  * Materials for CJK support
    * See: https://wiki.ubuntulinux.jp/JapaneseLocalizedDerivative/LaTeXForJapanese

## Contents in this repository

  - Dockerfile ... Dockerfile for document building environment
  - Docker.Makefile ... An example Makefile for building sphinx document using Automated build image from DockerHub.
  - DockerBuild.makefile ... Same as above, using locally built image.
  - source/, Makefile, make.bat ... Sample sphinx-based document.

## Usage

  1. Copy `Docker.Makefile` to your sphinx-based document's root directory.
    * ...or you can just clone this repository for just trying.
  2. Run make. e.g.:

```
$ make -f Docker.Makefile latexpdfja
```
