#!/bin/#!/usr/bin/env bash
RUN Xvfb -ac -screen scrn 1280x2000x24 :9.0 &
RUN export DISPLAY=:9.0
