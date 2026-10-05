%% COMPLETE SATELLITE LINK: Waterfall Curve + Constellation
clc; clear; close all;

% 1. System Parameters
N = 100000;              % Total bits transmitted
EbNo_dB_range = 0:1:10;  % Testing space noise from 0 to 10 dB
M = 4;                   % QPSK (4 states)
k = log2(M);             % 2 bits per symbol

% 2. Transmitter (Earth Station)
txData = randi([0 1], N, 1);
txDataSym = bit2int(txData, k);
txSig = pskmod(txDataSym, M, pi/4);

simulated_BER = zeros(1, length(EbNo_dB_range));

% 3. Space Channel Simulation (Testing multiple noise levels)
for i = 1:length(EbNo_dB_range)
    snr = EbNo_dB_range(i) + 10*log10(k);

    % The Satellite Path (AWGN)
    rxSig = awgn(txSig, snr, 'measured');

    % Receiver (Downlink)
    rxDataSym = pskdemod(rxSig, M, pi/4);
    rxData = int2bit(rxDataSym, k);

    % Calculate BER
    [~, ber] = biterr(txData, rxData);
    simulated_BER(i) = ber; 

    % Capture a snapshot of the noisy signal exactly at 4 dB for the scatter plot
    if EbNo_dB_range(i) == 4
        rxSig_snapshot = rxSig;
    end
end

% 4. Theoretical Calculation (The Physics Limit)
EbNo_linear = 10.^(EbNo_dB_range/10);
theoretical_BER = qfunc(sqrt(2*EbNo_linear));

% 5. OUTPUT 1: The BER vs SNR Waterfall Curve
figure('Name', 'Satellite Link Performance', 'Color', 'w');
semilogy(EbNo_dB_range, theoretical_BER, 'b-', 'LineWidth', 2);
hold on;
semilogy(EbNo_dB_range, simulated_BER, 'ro', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
xlabel('Eb/No (dB) [Signal Strength]');
ylabel('Bit Error Rate (BER)');
title('QPSK Satellite Link: Simulated vs Theoretical BER');
legend('Theoretical Limit', 'Simulation Data');

% 6. OUTPUT 2: The Constellation Diagram
scatterplot(rxSig_snapshot);
title('Received QPSK Constellation under Space Noise (4 dB)');
grid on;
