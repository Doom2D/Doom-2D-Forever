(* ========================================================================================== *)
(* FMOD Ex - Presets header file. Copyright (c), Firelight Technologies Pty, Ltd. 2004-2008.  *)
(*                                                                                            *)
(* A set of predefined environment PARAMETERS, created by Creative Labs.                      *)
(* These are used to initialize an FMOD_REVERB_PROPERTIES structure statically.               *)
(*                                                                                            *)
(* ========================================================================================== *)

unit fmodpresets;

{$I fmod.inc}

interface

uses
  fmodtypes;

(*
[DEFINE]
[
    [NAME]
    FMOD_REVERB_PRESETS

    [DESCRIPTION]
    A set of predefined environment PARAMETERS, created by Creative Labs
    These are used to initialize an FMOD_REVERB_PROPERTIES structure statically.
    ie
    FMOD_REVERB_PROPERTIES prop = FMOD_PRESET_GENERIC;

    [PLATFORMS]
    Win32, Win64, Linux, Macintosh, Xbox, Xbox360, PlayStation 2, GameCube, PlayStation Portable

    [SEE_ALSO]
    FMOD_System_SetReverbProperties
]
*)

{$IFDEF COMPILER6_UP}{$J+}{$ENDIF}
(*                                                           Instance     Env              Size            Diffuse               Room          RoomHF          RmLF        DecTm             DecHF               DecLF               Refl                RefDel                    RefPan                            Revb          RevDel              ReverbPan                   EchoTm            EchDp             ModTm                 ModDp                   AirAbs                  HFRef                 LFRef               RRlOff                  Diffus            Densty          FLAGS *)
const
  FSOUND_PRESET_OFF:              FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 0;  EnvSize: 7.5;   EnvDiffusion: 1.00;   Room: -10000; RoomHF: -10000; RoomLF: 0;  DecayTime: 1.00;  DecayHFRatio: 1.00; DecayLFRatio: 1.0;  Reflections: -2602; ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 200;  ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 0.0;   Density: 0.0;   Flags: $3f);
  FSOUND_PRESET_GENERIC:          FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 0;  EnvSize: 7.5;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -100;   RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.83; DecayLFRatio: 1.0;  Reflections: -2602; ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 200;  ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_PADDEDCELL:       FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 1;  EnvSize: 1.4;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -6000;  RoomLF: 0;  DecayTime: 0.17;  DecayHFRatio: 0.10; DecayLFRatio: 1.0;  Reflections: -1204; ReflectionsDelay: 0.001;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 207;  ReverbDelay: 0.002; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_ROOM:             FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 2;  EnvSize: 1.9;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -454;   RoomLF: 0;  DecayTime: 0.40;  DecayHFRatio: 0.83; DecayLFRatio: 1.0;  Reflections: -1646; ReflectionsDelay: 0.002;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 53;   ReverbDelay: 0.003; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_BATHROOM:         FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 3;  EnvSize: 1.4;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -1200;  RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.54; DecayLFRatio: 1.0;  Reflections: -370;  ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 1030; ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 60.0;  Flags: $3f);
  FSOUND_PRESET_LIVINGROOM:       FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 4;  EnvSize: 2.5;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -6000;  RoomLF: 0;  DecayTime: 0.50;  DecayHFRatio: 0.10; DecayLFRatio: 1.0;  Reflections: -1376; ReflectionsDelay: 0.003;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-1104; ReverbDelay: 0.004; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_STONEROOM:        FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 5;  EnvSize: 11.6;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -300;   RoomLF: 0;  DecayTime: 2.31;  DecayHFRatio: 0.64; DecayLFRatio: 1.0;  Reflections: -711;  ReflectionsDelay: 0.012;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 83;   ReverbDelay: 0.017; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_AUDITORIUM:       FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 6;  EnvSize: 21.6;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -476;   RoomLF: 0;  DecayTime: 4.32;  DecayHFRatio: 0.59; DecayLFRatio: 1.0;  Reflections: -789;  ReflectionsDelay: 0.020;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-289;  ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_CONCERTHALL:      FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 7;  EnvSize: 19.6;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -500;   RoomLF: 0;  DecayTime: 3.92;  DecayHFRatio: 0.70; DecayLFRatio: 1.0;  Reflections: -1230; ReflectionsDelay: 0.020;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-2;    ReverbDelay: 0.029; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_CAVE:             FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 8;  EnvSize: 14.6;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: 0;      RoomLF: 0;  DecayTime: 2.91;  DecayHFRatio: 1.30; DecayLFRatio: 1.0;  Reflections: -602;  ReflectionsDelay: 0.015;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-302;  ReverbDelay: 0.022; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $1f);
  FSOUND_PRESET_ARENA:            FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 9;  EnvSize: 36.2;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -698;   RoomLF: 0;  DecayTime: 7.24;  DecayHFRatio: 0.33; DecayLFRatio: 1.0;  Reflections: -1166; ReflectionsDelay: 0.020;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 16;   ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_HANGAR:           FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 10; EnvSize: 50.3;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -1000;  RoomLF: 0;  DecayTime: 10.05; DecayHFRatio: 0.23; DecayLFRatio: 1.0;  Reflections: -602;  ReflectionsDelay: 0.020;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 198;  ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_CARPETTEDHALLWAY: FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 11; EnvSize: 1.9;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -4000;  RoomLF: 0;  DecayTime: 0.30;  DecayHFRatio: 0.10; DecayLFRatio: 1.0;  Reflections: -1831; ReflectionsDelay: 0.002;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-1630; ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_HALLWAY:          FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 12; EnvSize: 1.8;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -300;   RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.59; DecayLFRatio: 1.0;  Reflections: -1219; ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 441;  ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_STONECORRIDOR:    FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 13; EnvSize: 13.5;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -237;   RoomLF: 0;  DecayTime: 2.70;  DecayHFRatio: 0.79; DecayLFRatio: 1.0;  Reflections: -1214; ReflectionsDelay: 0.013;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 395;  ReverbDelay: 0.020; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_ALLEY:            FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 14; EnvSize: 7.5;   EnvDiffusion: 0.30;   Room: -1000;  RoomHF: -270;   RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.86; DecayLFRatio: 1.0;  Reflections: -1204; ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-4;    ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.125;  EchoDepth: 0.95;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_FOREST:           FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 15; EnvSize: 38.0;  EnvDiffusion: 0.30;   Room: -1000;  RoomHF: -3300;  RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.54; DecayLFRatio: 1.0;  Reflections: -2560; ReflectionsDelay: 0.162;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-229;  ReverbDelay: 0.088; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.125;  EchoDepth: 1.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 79.0;  Density: 100.0; Flags: $3f);
  FSOUND_PRESET_CITY:             FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 16; EnvSize: 7.5;   EnvDiffusion: 0.50;   Room: -1000;  RoomHF: -800;   RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.67; DecayLFRatio: 1.0;  Reflections: -2273; ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-1691; ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 50.0;  Density: 100.0; Flags: $3f);
  FSOUND_PRESET_MOUNTAINS:        FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 17; EnvSize: 100.0; EnvDiffusion: 0.27;   Room: -1000;  RoomHF: -2500;  RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.21; DecayLFRatio: 1.0;  Reflections: -2780; ReflectionsDelay: 0.300;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-1434; ReverbDelay: 0.100; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 1.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 27.0;  Density: 100.0; Flags: $1f);
  FSOUND_PRESET_QUARRY:           FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 18; EnvSize: 17.5;  EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -1000;  RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.83; DecayLFRatio: 1.0;  Reflections: -10000;ReflectionsDelay: 0.061;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 500;  ReverbDelay: 0.025; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.125;  EchoDepth: 0.70;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);
  FSOUND_PRESET_PLAIN:            FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 19; EnvSize: 42.5;  EnvDiffusion: 0.21;   Room: -1000;  RoomHF: -2000;  RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.50; DecayLFRatio: 1.0;  Reflections: -2466; ReflectionsDelay: 0.179;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-1926; ReverbDelay: 0.100; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 1.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 21.0;  Density: 100.0; Flags: $3f);
  FSOUND_PRESET_PARKINGLOT:       FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 20; EnvSize: 8.3;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: 0;      RoomLF: 0;  DecayTime: 1.65;  DecayHFRatio: 1.50; DecayLFRatio: 1.0;  Reflections: -1363; ReflectionsDelay: 0.008;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-1153; ReverbDelay: 0.012; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $1f);
  FSOUND_PRESET_SEWERPIPE:        FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 21; EnvSize: 1.7;   EnvDiffusion: 0.80;   Room: -1000;  RoomHF: -1000;  RoomLF: 0;  DecayTime: 2.81;  DecayHFRatio: 0.14; DecayLFRatio: 1.0;  Reflections:  429;  ReflectionsDelay: 0.014;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 1023; ReverbDelay: 0.021; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 0.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 80.0;  Density: 60.0;  Flags: $3f);
  FSOUND_PRESET_UNDERWATER:       FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 22; EnvSize: 1.8;   EnvDiffusion: 1.00;   Room: -1000;  RoomHF: -4000;  RoomLF: 0;  DecayTime: 1.49;  DecayHFRatio: 0.10; DecayLFRatio: 1.0;  Reflections: -449;  ReflectionsDelay: 0.007;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 1700; ReverbDelay: 0.011; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 1.18; ModulationDepth: 0.348; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $3f);

(* Non I3DL2 presets *)

  FSOUND_PRESET_DRUGGED:          FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 23; EnvSize: 1.9;   EnvDiffusion: 0.50;   Room: -1000;  RoomHF: 0;      RoomLF: 0;  DecayTime: 8.39;  DecayHFRatio: 1.39; DecayLFRatio: 1.0;  Reflections: -115;  ReflectionsDelay: 0.002;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 985;  ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 0.25; ModulationDepth: 1.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $1f);
  FSOUND_PRESET_DIZZY:            FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 24; EnvSize: 1.8;   EnvDiffusion: 0.60;   Room: -1000;  RoomHF: -400;   RoomLF: 0;  DecayTime: 17.23; DecayHFRatio: 0.56; DecayLFRatio: 1.0;  Reflections: -1713; ReflectionsDelay: 0.020;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb:-613;  ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 1.00;  ModulationTime: 0.81; ModulationDepth: 0.310; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $1f);
  FSOUND_PRESET_PSYCHOTIC:        FMOD_REVERB_PROPERTIES = (Instance: 0; Environment: 25; EnvSize: 1.0;   EnvDiffusion: 0.50;   Room: -1000;  RoomHF: -151;   RoomLF: 0;  DecayTime: 7.56;  DecayHFRatio: 0.91; DecayLFRatio: 1.0;  Reflections: -626;  ReflectionsDelay: 0.020;  ReflectionsPan: (0.0, 0.0, 0.0);  Reverb: 774;  ReverbDelay: 0.030; ReverbPan: (0.0, 0.0, 0.0); EchoTime: 0.250;  EchoDepth: 0.00;  ModulationTime: 4.00; ModulationDepth: 1.000; AirAbsorptionHF: -5.0;  HFReference: 5000.0;  LFReference: 250.0; RoomRolloffFactor: 0.0; Diffusion: 100.0; Density: 100.0; Flags: $1f);

(* PlayStation 2 Only presets *)
(* Delphi/Kylix cannot create PlayStation 2 executables, so there is no need to
   convert the PlayStation 2 presets. *)
{$IFDEF COMPILER6_UP}{$J-}{$ENDIF}

(* [DEFINE_END] *)

implementation

end.
