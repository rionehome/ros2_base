#!/bin/bash

bringup_branch="bug_fix"

git clone https://github.com/rionehome/follow_me.git
cd follow_me
git checkout ros2/master
cd ..

git clone https://github.com/rionehome/rione_msgs.git
cd rione_msgs
git checkout ros2/master
cd ..


git clone https://github.com/rionehome/turtlebot_bringup.git
cd turtlebot_bringup
git checkout $bringup_branch
cd ..

colcon build

source install/setup.bash
