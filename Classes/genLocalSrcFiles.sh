#! /bin/bash

ls *.cpp *.cc | awk '{printf "../../Classes/%s \\\n", $0}'
