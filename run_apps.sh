#!/bin/bash
cd ~/jmeter/apache-jmeter-3.1/bin

# Clear out old results
rm ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jtl

#user_profile
./jmeter -n -t ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jmx -l ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jtl

#generate graph
cd ~/jmeter/apache-jmeter-3.1/lib

#responseTimesOverTime
java -jar cmdrunner-2.0.jar --tool Reporter --generate-png ~/workspace/LTA_user_profile/Jmeter/user_profile/responseTimesOverTime.png --input-jtl ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jtl \--plugin-type ResponseTimesOverTime --width 800 --height 600

#responseTimesDistribution
java -jar cmdrunner-2.0.jar --tool Reporter --generate-png ~/workspace/LTA_user_profile/Jmeter/user_profile/responseTimesDistribution.png --input-jtl ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jtl \--plugin-type ResponseTimesDistribution --width 800 --height 600

#responseTimesPercentiles
java -jar cmdrunner-2.0.jar --tool Reporter --generate-png ~/workspace/LTA_user_profile/Jmeter/user_profile/responseTimesPercentiles.png --input-jtl ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jtl \--plugin-type ResponseTimesPercentiles --width 800 --height 600

#synthesisReport
java -jar cmdrunner-2.0.jar --tool Reporter --generate-csv ~/workspace/LTA_user_profile/Jmeter/user_profile/synthesisReport_user_profile.csv --input-jtl ~/workspace/LTA_user_profile/Jmeter/user_profile/user_profile.jtl \--plugin-type SynthesisReport  

