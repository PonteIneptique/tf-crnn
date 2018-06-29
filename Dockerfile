FROM tensorflow/tensorflow:1.7.0-gpu
MAINTAINER ponteineptique <thibault.clerice[@]chartes.psl.eu>

# Python version
RUN python -v

# Additional requirements from Tensorflow
RUN apt-get update && apt-get install -y python3 python3-dev 

# Clean up Python 3 install
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# Install tensorflow 1.7
RUN pip3 install tensorflow-gpu==1.7.0 ipython notebook

# Copy and install TF-CRNN
ADD . /script
WORKDIR /script
RUN python3 setup.py install

# Add an additional sources directory
# You should normalize the filepath in your data 
VOLUME /sources
VOLUME /config
