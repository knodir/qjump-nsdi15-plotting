# Copyright (c) 2015, Matthew P. Grosvenor
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the name of the project, the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#! /bin/bash

file=$1
expr=$2

# data in the file has following format
# {GET | SET | TOTAL} , COUNTER, REQUEST ID, LATENCY
#
# TOTAL 0 1470010111224595441 2305
# TOTAL 1 1470010111224624459 2296
# TOTAL 2 1470010111224631471 2356
# ...
# TOTAL N 1470010111224696789 2561
#
# we want to extract latency value only.
#
# We also skip first 7 lines of metadata info as follows:
# servers : 192.168.1.10:11211
# threads count: 2
# concurrency: 128
# run time: 600s
# windows size: 10k
# set proportion: set_prop=0.10
# get proportion: get_prop=0.90

tail -n +8 ${file}${expr} | cut -d" " -f 4 > out_${file}${expr}.lats
