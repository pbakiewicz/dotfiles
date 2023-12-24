#!/bin/bash
sensors | grep 'junction:' | awk '{print $2}' | sed 's/+//'
