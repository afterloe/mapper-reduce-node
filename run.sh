#! /bin/bash

#--------------------------------------------
# afterloe.L - map-reduce-node/run.sh
#
# Authors: afterloe.L <lm6289511@gmail.com> (https://github.com/afterloe)
# MIT Licensed
# Date: 2017-7-27 16:25:47
#--------------------------------------------

#!/bin/bash

# create by afterloe at 2017-7-27

INPUT_PATH=/data/shenzhentong
OUTPUT_PATH=/reduce/afterloe/mr-node
NODE_HOME=/var/server/node-v8.2.1-linux-x64/bin

echo "clearing output path: $OUTPUT_PATH"
hadoop fs -rm -r $OUTPUT_PATH

hadoop jar\
 $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.8.0.jar\
 -files mapper,reduce\
 -input $INPUT_PATH\
 -output $OUTPUT_PATH\
 -mapper "$NODE_HOME/node mapper"\
 -reducer "$NODE_HOME/node reduce"

echo "task is running!"
