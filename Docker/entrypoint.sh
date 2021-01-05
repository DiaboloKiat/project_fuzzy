#!/bin/bash
# set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
cd /home/diabolokiat/project_fuzzy

exec "$@"
