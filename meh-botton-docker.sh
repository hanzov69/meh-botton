#!/bin/#!/usr/bin/env bash
docker run -d -t -i -e\
 MEHUSERNAME="your username"\
  -e MEHPASSWORD="your password"\
   -e TASK_SCHEDULE='0 */2 * * * '\
    --name meh-botton\
     hanzov69/meh-botton:latest
