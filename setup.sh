#!/bin/bash

bringup_branch="bug_fix"

cd follow_me
branch=$(git branch --contains=HEAD)
echo ${branch}
if [ "${branch}" = "* ros2/master" ]; then
    echo "pull!"
    git pull origin ros2/master
else
    echo "Switch branches and then pull"
    git checkout ros2/master
    git pull origin ros2/master
fi

cd ../rione_msgs
branch=$(git branch --contains=HEAD)
echo ${branch}
if [ "${branch}" = "* ros2/master" ]; then
    echo "pull!"
    git pull origin ros2/master
else
    echo "Switch branches and then pull"
    git checkout ros2/master
    git pull origin ros2/master
fi

cd ../turtlebot_bringup
branch=$(git branch --contains=HEAD)
echo ${branch}
if [ "${branch}" = "* ${bringup_branch}" ]; then
    echo "pull!"
    git pull origin ${bringup_branch}
else
    echo "Switch branches and then pull"
    git checkout ${bringup_branch}
    git pull origin ${bringup_branch}
fi

cd ..

colcon build

source install/setup.bash
