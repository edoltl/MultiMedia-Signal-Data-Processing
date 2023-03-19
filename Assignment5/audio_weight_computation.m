function weight = audio_weight_computation(info, type)
% AUDIO_WEIGHT_COMPUTATION - Computes the weight of an audio signal.
% INFO - All the information of a specific audio
% TYPE - Contains the file extension as a character

% Duration
D = info.Duration;

% Bit number per sample (we have a wav file in double format, see the
% documentation for audioread)
if strcmp(type, 'wav') || strcmp(type, 'flac')
    % Sampling frequency
    fc = info.SampleRate;
    % Number of channels
    Nc = info.NumChannels;
    b = info.BitsPerSample;
    % Multiplying by 8 guarantees to go from bits to Bytes.
    % The 1024 power of 2 allows us to go from Bytes to MegaBytes. 
    weight = (fc * D * b * Nc) / (8 * 1024^2);
else
    % The BitRate is saved in Kbit, be careful when using it in the
    % formula.
    % The BitRate is computed by multiplying the Fs with the bit depth and
    % the number of channels, thus
    weight = (info.BitRate * 1000 * D) / (8 * 1024^2);
end

end

