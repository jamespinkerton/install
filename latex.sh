#!/bin/bash
sudo apt-get -y install texlive
tlmgr update --self && tlmgr install texliveonfly

