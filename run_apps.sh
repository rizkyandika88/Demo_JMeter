#!/bin/bash
cd ~/jmeter/apache-jmeter-3.1/bin

# Clear out old results
rm ~/workspace/ts_demo/pending_limit.jtl

#user_profile
./jmeter -n -t ~/workspace/ts_demo/Pending\ Limit.jmx -l ~/workspace/ts_demo/pending_limit.jtl

#generate graph
cd ~/jmeter/apache-jmeter-3.1/lib

#responseTimesOverTime
java -jar cmdrunner-2.0.jar --tool Reporter --generate-png ~/workspace/ts_demo/responseTimesOverTime.png --input-jtl ~/workspace/ts_demo/pending_limit.jtl \--plugin-type ResponseTimesOverTime --width 800 --height 600

#responseTimesDistribution
java -jar cmdrunner-2.0.jar --tool Reporter --generate-png ~/workspace/ts_demo/responseTimesDistribution.png --input-jtl ~/workspace/ts_demo/pending_limit.jtl \--plugin-type ResponseTimesDistribution --width 800 --height 600

#responseTimesPercentiles
java -jar cmdrunner-2.0.jar --tool Reporter --generate-png ~/workspace/ts_demo/responseTimesPercentiles.png --input-jtl ~/workspace/ts_demo/pending_limit.jtl \--plugin-type ResponseTimesPercentiles --width 800 --height 600

#synthesisReport
java -jar cmdrunner-2.0.jar --tool Reporter --generate-csv ~/workspace/ts_demo/synthesisReport_user_profile.csv --input-jtl ~/workspace/ts_demo/pending_limit.jtl \--plugin-type SynthesisReport  

#summaryReport
java -jar cmdrunner-2.0.jar --tool Reporter --generate-csv ~/workspace/ts_demo/aggregateResults.csv --input-jtl ~/workspace/ts_demo/hasil.jtl --plugin-type AggregateReport
