%% fun_midi_start

function [recorder, device, audioinfo] = fun_midiaudio_start(mididevice_idx, audiodevice_idx, fs, bit_resolution, record_time)
%% Parameters to record
if ~exist('fs', 'var')
    fs = 44100;             % Sampling rate for audio signal
end
if ~exist('bit_resolution', 'var')
    bit_resolution = 16;    % Bit resolution for audio recording
end
if ~exist('record_time', 'var')
    record_time = 20;       % recording time in seconds
end

% audiodevice_idx = 2;
% mididevice_idx = 1;

%% Record audio and MIDI simultaneously

midi_device = mididevinfo;
audioinfo = audiodevinfo;
 
recorder = audiorecorder(fs, bit_resolution, 1, audioinfo.input(audiodevice_idx).ID);
record(recorder, record_time)
device = mididevice(midi_device.input(mididevice_idx).ID);

%%





