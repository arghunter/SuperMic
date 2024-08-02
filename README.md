# SuperMic
## Beamforming Microphone - Verilog Implementation
Welcome to the SuperMic repository. This project contains the Verilog implementation of a beamforming microphone system along with several essential components that make up the system.

## Introduction
Beamforming is a signal processing technique used in sensor arrays for directional signal transmission or reception. This project focuses on implementing a beamforming microphone system using Verilog, allowing for the effective capture of sound from a specific direction while suppressing noise from other directions.

## Getting Started
To get started with this project, clone the repository to your local machine:

Ensure you have a suitable Verilog simulation environment set up, such as VScode, to compile and simulate the Verilog code.

git clone ... https://github.com/arghunter/SuperMic.git
cd ./SuperMic/

To convert verilog files to stl files for implementation on an ASIC chip, consider using openlane2.

## Components
#### DDR to SDR Converter
The input signal is converted from double data rate to single data rate.
#### CIC Filter
The SDR signal is then passed through a CIC filter to decimate the signal from 3.072 Mhz to 48Khz.
#### Delay Line
The decimated signal is then passed though a set of circular buffer delays.
There are 32 predefined delay configurations based on microphone position.
#### 23 bit Binary Adder
The signal is then passed through a 23 bit binary adder.
#### I2S Bus
An I2S bus is used to transmit digital audio data between SuperMic components and PC.

## Licence
This project is licensed under the Apache License - see the LICENSE file for details.
