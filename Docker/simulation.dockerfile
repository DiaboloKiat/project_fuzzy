FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO melodic

RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -yq dist-upgrade \
    && apt-get -o Acquire::ForceIPv4=true install -yq --no-install-recommends \
    locales \
    cmake \
    git \
    vim \
    gedit \
    wget \
    sudo \
    curl \
    build-essential \
    net-tools \
    dirmngr \
    gnupg2 \
    mercurial \
    python-gtk2 \
    python-gobject \
    python-tk \
    # python-pip \
    python3-pip \
    python3-setuptools \
    lsb-release \
    # libbluetooth-dev \
    # libgoogle-glog-dev \
    # libcwiid-dev \
    # libusb-dev \
    # libpcap-dev \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    # libsdl-image1.2-dev \
    # libsuitesparse-dev \
    # libignition-common-dev \
    libignition-math4-dev \
    # libglib2.0-dev \
    libmove-base-msgs-dev \
    ruby-full \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV SHELL=/bin/bash \
    NB_USER=diabolokiat \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER} 

RUN echo "root:root" | chpasswd
RUN echo "${NB_USER}:111111" | chpasswd
# EXPOSE 8888

###################################### ROS #####################################

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list \
    && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list

# setup keys
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -


# install bootstrap tools
RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -o Acquire::ForceIPv4=true install --no-install-recommends -y \
    ros-$ROS_DISTRO-desktop-full \
    ros-$ROS_DISTRO-joy \
    ros-$ROS_DISTRO-joystick-drivers \
    ros-$ROS_DISTRO-teleop-twist-joy \
    ros-$ROS_DISTRO-rviz-imu-plugin \
    ros-$ROS_DISTRO-roslint \
    ros-$ROS_DISTRO-rosserial \
    ros-$ROS_DISTRO-rosserial-arduino \
    ros-$ROS_DISTRO-controller-manager \
    ros-$ROS_DISTRO-twist-mux \
    ros-$ROS_DISTRO-interactive-marker-twist-server \
    # ros-$ROS_DISTRO-gazebo-ros \
    ros-$ROS_DISTRO-perception \
    ros-$ROS_DISTRO-rgbd-launch \
    ros-$ROS_DISTRO-robot-localization \
    ros-$ROS_DISTRO-spacenav-node \
    ros-$ROS_DISTRO-tf2-sensor-msgs \
    ros-$ROS_DISTRO-pointcloud-to-laserscan \
    ros-$ROS_DISTRO-velodyne-simulator \
    ros-$ROS_DISTRO-serial \
    ros-$ROS_DISTRO-soem \
    ros-$ROS_DISTRO-openslam-gmapping \
    ros-$ROS_DISTRO-geodesy \
    # ros-$ROS_DISTRO-moveit-* \
    # ros-$ROS_DISTRO-industrial-* \
    ros-$ROS_DISTRO-cartographer-* \
    ros-$ROS_DISTRO-ddynamic-reconfigure \
    ros-$ROS_DISTRO-lms1xx \
    python-rosdep \
    # python-rosinstall \
    # python-vcstools \
    # python-catkin-tools \
    python-rosinstall-generator \
    python-wstool \
    && rm -rf /var/lib/apt/lists/*

##################################### PIP ######################################

RUN pip3 install --upgrade pip setuptools

RUN pip3 install --upgrade \
    gym \
    numpy \
    tensorflow \
    gast==0.2.2 \
    matplotlib \
    pandas \
    pypozyx \
    requests \
    jupyter \
    ipykernel \
    rospkg \
    catkin-tools \
    scikit-image \
    scikit-learn \
    zerorpc \
    lxml \
    empy  \
    opencv-python \
    scipy

RUN pip3 install \
    torch==1.5.0+cu101 \
    torchvision==0.6.0+cu101 \
    -f https://download.pytorch.org/whl/torch_stable.html
    
#################################### GTSAM ####################################

RUN cd ${HOME}/ \
    && git clone https://github.com/borglab/gtsam.git \
    && cd gtsam/ \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install 

#################################### ISAM ####################################

RUN cd ${HOME}/ \
    && git clone https://github.com/ori-drs/isam \
    && cd isam/ \
    && make \
    && make install 

COPY ./FindCholmod.cmake /usr/share/cmake-3.10/Modules
COPY ./FindiSAM.cmake /usr/share/cmake-3.10/Modules

####################################### procman ###########################################

RUN cd ${HOME} && git clone https://github.com/lcm-proj/lcm \
    && cd lcm \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

RUN cd ${HOME} && git clone https://github.com/DiaboloKiat/procman \
    && cd procman \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make install

######################################## realsense ########################################

RUN apt-get update && apt-get install -y \
    libsuitesparse-dev\
    software-properties-common \
    libusb-1.0-0-dev \
    libx11-dev \
    xorg-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# set the version of the realsense library
ENV LIBREALSENSE_VERSION 2.36.0
RUN wget https://github.com/IntelRealSense/librealsense/archive/v${LIBREALSENSE_VERSION}.tar.gz && \
    tar -xvzf v${LIBREALSENSE_VERSION}.tar.gz && \
    rm v${LIBREALSENSE_VERSION}.tar.gz && \
    mkdir -p librealsense-${LIBREALSENSE_VERSION}/build && \
    cd librealsense-${LIBREALSENSE_VERSION}/build && \
    cmake .. && \
    make && \
    make install && \
    rm -rf librealsense-${LIBREALSENSE_VERSION}

################################### SUBT SOURCE #####################################
ARG username
ARG password

RUN git clone https://${username}:${password}@github.com/ARG-NCTU/subt-gazebo /subt_ws \
    && cd /subt_ws \
    && mkdir -p ${HOME}/catkin_ws/src \
    && apt-get -o Acquire::ForceIPv4=true update \
    && cp -R /subt_ws ${HOME}/catkin_ws/src/. \
    && cd ${HOME}/catkin_ws \
    && wget https://s3.amazonaws.com/osrf-distributions/subt_robot_examples/releases/subt_robot_examples_latest.tgz \
    && tar xvf subt_robot_examples_latest.tgz \
    && /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && rosdep init" \
    && /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && rosdep update && rosdep install --as-root apt:false --from-paths src --ignore-src -r -y" \
    && rm -rf /var/lib/apt/lists/* \
    && /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && catkin_make install" \
    && rm -fr /subt_ws 

RUN echo "source ~/catkin_ws/install/setup.bash" >> ${HOME}/.bashrc

##################################### TAIL #####################################

RUN chown -R ${NB_UID} ${HOME}/
RUN echo "${NB_USER} ALL=(ALL)  ALL" > /etc/sudoers

RUN echo "cd ~/project_fuzzy" >> ${HOME}/.bashrc

# Support of nvidia-docker 2.0
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=all

USER ${NB_USER}

WORKDIR ${HOME}
