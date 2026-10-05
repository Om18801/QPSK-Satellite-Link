# QPSK Satellite Communication Link Simulation

## Overview
This project simulates a baseband digital satellite communication link using Quadrature Phase Shift Keying (QPSK). It was developed for the 6th Semester Digital Communication (EXTC) curriculum to analyze the effects of space thermal noise on digital signals using a programmatic approach in MATLAB.

## System Architecture (MATLAB Implementation)
* **Transmitter (Uplink):** Random binary payload generation and QPSK Baseband Modulation (with a $\pi/4$ phase offset).
* **Space Channel:** Programmatic Additive White Gaussian Noise (AWGN) channel simulating free-space path loss and transponder thermal noise.
* **Receiver (Downlink):** QPSK Demodulator and automated Bit Error Rate (BER) calculation.

## Repository Structure
* `/docs`: Project report and theoretical documentation.
* `/images`: Constellation diagrams and BER vs. SNR Waterfall plots.
* `/matlab`: Contains the `satellite.m` script that runs the end-to-end simulation.
* `/presentation`: Viva presentation slides.

## Key Results
The MATLAB script loops through various noise levels to automatically generate a BER vs. SNR Waterfall plot. The results successfully demonstrate that the simulated code accurately tracks the theoretical physics limits of the Q-function for digital communication.
