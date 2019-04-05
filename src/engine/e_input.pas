(* Copyright (C)  Doom 2D: Forever Developers
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *)
{$INCLUDE ../shared/a_modes.inc}
unit e_input;

interface

uses
  SysUtils,
  e_log,
  SDL2;

const
  e_MaxKbdKeys  = SDL_NUM_SCANCODES;
  e_MaxJoys     = 4;
  e_MaxJoyBtns  = 32;
  e_MaxJoyAxes  = 8;
  e_MaxJoyHats  = 8;
  e_MaxVirtKeys = 48;

  e_MaxJoyKeys = e_MaxJoyBtns + e_MaxJoyAxes*2 + e_MaxJoyHats*4;

  e_MaxInputKeys = e_MaxKbdKeys + e_MaxJoys*e_MaxJoyKeys + e_MaxVirtKeys - 1;
  // $$$..$$$ -  321 Keyboard buttons/keys
  // $$$..$$$ - 4*32 Joystick buttons
  // $$$..$$$ -  8*2 Joystick axes (- and +)
  // $$$..$$$ -  4*4 Joystick hats (L U R D)
  // $$$..$$$ -   48 Virtual buttons/keys

  // these are apparently used in g_gui and g_game and elsewhere
  IK_INVALID = 65535;
  IK_ESCAPE  = SDL_SCANCODE_ESCAPE;
  IK_RETURN  = SDL_SCANCODE_RETURN;
  IK_KPRETURN= SDL_SCANCODE_KP_ENTER;
  IK_ENTER   = SDL_SCANCODE_RETURN;
  IK_KPINSERT = SDL_SCANCODE_KP_0;
  IK_UP      = SDL_SCANCODE_UP;
  IK_KPUP    = SDL_SCANCODE_KP_8;
  IK_DOWN    = SDL_SCANCODE_DOWN;
  IK_KPDOWN  = SDL_SCANCODE_KP_2;
  IK_LEFT    = SDL_SCANCODE_LEFT;
  IK_KPLEFT  = SDL_SCANCODE_KP_4;
  IK_RIGHT   = SDL_SCANCODE_RIGHT;
  IK_KPRIGHT = SDL_SCANCODE_KP_6;
  IK_DELETE  = SDL_SCANCODE_DELETE;
  IK_HOME    = SDL_SCANCODE_HOME;
  IK_KPHOME  = SDL_SCANCODE_KP_7;
  IK_INSERT  = SDL_SCANCODE_INSERT;
  IK_SPACE   = SDL_SCANCODE_SPACE;
  IK_CONTROL = SDL_SCANCODE_LCTRL;
  IK_SHIFT   = SDL_SCANCODE_LSHIFT;
  IK_ALT     = SDL_SCANCODE_LALT;
  IK_TAB     = SDL_SCANCODE_TAB;
  IK_PAGEUP  = SDL_SCANCODE_PAGEUP;
  IK_KPPAGEUP= SDL_SCANCODE_KP_9;
  IK_PAGEDN  = SDL_SCANCODE_PAGEDOWN;
  IK_KPPAGEDN= SDL_SCANCODE_KP_3;
  IK_KP5     = SDL_SCANCODE_KP_5;
  IK_NUMLOCK = SDL_SCANCODE_NUMLOCKCLEAR;
  IK_KPDIVIDE= SDL_SCANCODE_KP_DIVIDE;
  IK_KPMULTIPLE= SDL_SCANCODE_KP_MULTIPLY;
  IK_KPMINUS = SDL_SCANCODE_KP_MINUS;
  IK_KPPLUS  = SDL_SCANCODE_KP_PLUS;
  IK_KPENTER = SDL_SCANCODE_KP_ENTER;
  IK_KPDOT   = SDL_SCANCODE_KP_PERIOD;
  IK_CAPSLOCK= SDL_SCANCODE_CAPSLOCK;
  IK_RSHIFT  = SDL_SCANCODE_RSHIFT;
  IK_CTRL    = SDL_SCANCODE_LCTRL;
  IK_RCTRL   = SDL_SCANCODE_RCTRL;
  IK_RALT    = SDL_SCANCODE_RALT;
  IK_WIN     = SDL_SCANCODE_LGUI;
  IK_RWIN    = SDL_SCANCODE_RGUI;
  IK_MENU    = SDL_SCANCODE_MENU;
  IK_PRINTSCR= SDL_SCANCODE_PRINTSCREEN;
  IK_SCROLLLOCK= SDL_SCANCODE_SCROLLLOCK;
  IK_LBRACKET= SDL_SCANCODE_LEFTBRACKET;
  IK_RBRACKET= SDL_SCANCODE_RIGHTBRACKET;
  IK_SEMICOLON= SDL_SCANCODE_SEMICOLON;
  IK_QUOTE   = SDL_SCANCODE_APOSTROPHE;
  IK_BACKSLASH= SDL_SCANCODE_BACKSLASH;
  IK_SLASH   = SDL_SCANCODE_SLASH;
  IK_COMMA   = SDL_SCANCODE_COMMA;
  IK_DOT     = SDL_SCANCODE_PERIOD;
  IK_EQUALS  = SDL_SCANCODE_EQUALS;
  IK_0      = SDL_SCANCODE_0;
  IK_1      = SDL_SCANCODE_1;
  IK_2      = SDL_SCANCODE_2;
  IK_3      = SDL_SCANCODE_3;
  IK_4      = SDL_SCANCODE_4;
  IK_5      = SDL_SCANCODE_5;
  IK_6      = SDL_SCANCODE_6;
  IK_7      = SDL_SCANCODE_7;
  IK_8      = SDL_SCANCODE_8;
  IK_9      = SDL_SCANCODE_9;
  IK_F1      = SDL_SCANCODE_F1;
  IK_F2      = SDL_SCANCODE_F2;
  IK_F3      = SDL_SCANCODE_F3;
  IK_F4      = SDL_SCANCODE_F4;
  IK_F5      = SDL_SCANCODE_F5;
  IK_F6      = SDL_SCANCODE_F6;
  IK_F7      = SDL_SCANCODE_F7;
  IK_F8      = SDL_SCANCODE_F8;
  IK_F9      = SDL_SCANCODE_F9;
  IK_F10     = SDL_SCANCODE_F10;
  IK_F11     = SDL_SCANCODE_F11;
  IK_F12     = SDL_SCANCODE_F12;
  IK_END     = SDL_SCANCODE_END;
  IK_KPEND   = SDL_SCANCODE_KP_1;
  IK_BACKSPACE = SDL_SCANCODE_BACKSPACE;
  IK_BACKQUOTE = SDL_SCANCODE_GRAVE;
  IK_GRAVE     = SDL_SCANCODE_GRAVE;
  IK_PAUSE   = SDL_SCANCODE_PAUSE;
  IK_Y       = SDL_SCANCODE_Y;
  IK_N       = SDL_SCANCODE_N;
  IK_W       = SDL_SCANCODE_W;
  IK_A       = SDL_SCANCODE_A;
  IK_S       = SDL_SCANCODE_S;
  IK_D       = SDL_SCANCODE_D;
  IK_Q       = SDL_SCANCODE_Q;
  IK_E       = SDL_SCANCODE_E;
  IK_H       = SDL_SCANCODE_H;
  IK_J       = SDL_SCANCODE_J;
  IK_T       = SDL_SCANCODE_T;
  IK_Z       = SDL_SCANCODE_Z;
  IK_MINUS   = SDL_SCANCODE_MINUS;
  // TODO: think of something better than this shit
  IK_LASTKEY = SDL_NUM_SCANCODES-1;

  VK_FIRSTKEY = e_MaxKbdKeys + e_MaxJoys*e_MaxJoyKeys;
  VK_LEFT     = VK_FIRSTKEY + 0;
  VK_RIGHT    = VK_FIRSTKEY + 1;
  VK_UP       = VK_FIRSTKEY + 2;
  VK_DOWN     = VK_FIRSTKEY + 3;
  VK_FIRE     = VK_FIRSTKEY + 4;
  VK_OPEN     = VK_FIRSTKEY + 5;
  VK_JUMP     = VK_FIRSTKEY + 6;
  VK_CHAT     = VK_FIRSTKEY + 7;
  VK_ESCAPE   = VK_FIRSTKEY + 8;
  VK_0        = VK_FIRSTKEY + 9;
  VK_1        = VK_FIRSTKEY + 10;
  VK_2        = VK_FIRSTKEY + 11;
  VK_3        = VK_FIRSTKEY + 12;
  VK_4        = VK_FIRSTKEY + 13;
  VK_5        = VK_FIRSTKEY + 14;
  VK_6        = VK_FIRSTKEY + 15;
  VK_7        = VK_FIRSTKEY + 16;
  VK_8        = VK_FIRSTKEY + 17;
  VK_9        = VK_FIRSTKEY + 18;
  VK_A        = VK_FIRSTKEY + 19;
  VK_B        = VK_FIRSTKEY + 20;
  VK_C        = VK_FIRSTKEY + 21;
  VK_D        = VK_FIRSTKEY + 22;
  VK_E        = VK_FIRSTKEY + 23;
  VK_F        = VK_FIRSTKEY + 24;
  VK_CONSOLE  = VK_FIRSTKEY + 25;
  VK_STATUS   = VK_FIRSTKEY + 26;
  VK_TEAM     = VK_FIRSTKEY + 27;
  VK_PREV     = VK_FIRSTKEY + 28;
  VK_NEXT     = VK_FIRSTKEY + 29;
  VK_STRAFE   = VK_FIRSTKEY + 30;
  VK_LSTRAFE  = VK_FIRSTKEY + 31;
  VK_RSTRAFE  = VK_FIRSTKEY + 32;
  VK_PRINTSCR = VK_FIRSTKEY + 33;
  VK_SHOWKBD  = VK_FIRSTKEY + 34;
  VK_HIDEKBD  = VK_FIRSTKEY + 35;
  VK_LASTKEY  = e_MaxKbdKeys + e_MaxJoys*e_MaxJoyKeys + e_MaxVirtKeys - 1;

  AX_MINUS  = 0;
  AX_PLUS   = 1;
  HAT_LEFT  = 0;
  HAT_UP    = 1;
  HAT_RIGHT = 2;
  HAT_DOWN  = 3;

function  e_InitInput(): Boolean;
procedure e_ReleaseInput();
procedure e_ClearInputBuffer();
//function  e_PollInput(): Boolean;
procedure e_PollJoysticks(); // call this from message loop to update joysticks
function  e_KeyPressed(Key: Word): Boolean;
function  e_AnyKeyPressed(): Boolean;
function  e_GetFirstKeyPressed(): Word;
function  e_JoystickStateToString(mode: Integer): String;
function  e_JoyByHandle(handle: Word): Integer;
function  e_JoyButtonToKey(id: Word; btn: Byte): Word;
function  e_JoyAxisToKey(id: Word; ax: Byte; dir: Byte): Word;
function  e_JoyHatToKey(id: Word; hat: Byte; dir: Byte): Word;
procedure e_SetKeyState(key: Word; state: Integer);

procedure e_UnpressAllKeys ();
procedure e_KeyUpDown (key: Word; down: Boolean);

var
  {e_MouseInfo:          TMouseInfo;}
  e_EnableInput:        Boolean = False;
  e_JoysticksAvailable: Byte    = 0;
  e_JoystickDeadzones:  array [0..e_MaxJoys-1] of Integer = (8192, 8192, 8192, 8192);
  e_KeyNames:           array [0..e_MaxInputKeys] of String;

implementation

uses Math;

const
  KBRD_END = e_MaxKbdKeys;
  JOYK_BEG = KBRD_END;
  JOYK_END = JOYK_BEG + e_MaxJoyBtns*e_MaxJoys;
  JOYA_BEG = JOYK_END;
  JOYA_END = JOYA_BEG + e_MaxJoyAxes*2*e_MaxJoys;
  JOYH_BEG = JOYA_END;
  JOYH_END = JOYH_BEG + e_MaxJoyHats*4*e_MaxJoys;
  VIRT_BEG = JOYH_END;
  VIRT_END = VIRT_BEG + e_MaxVirtKeys;

type
  TJoystick = record
    ID:      Byte;
    Handle:  PSDL_Joystick;
    Axes:    Byte;
    Buttons: Byte;
    Hats:    Byte;
    ButtBuf: array [0..e_MaxJoyBtns] of Boolean;
    AxisBuf: array [0..e_MaxJoyAxes] of Integer;
    AxisZero: array [0..e_MaxJoyAxes] of Integer;
    HatBuf:  array [0..e_MaxJoyHats] of array [HAT_LEFT..HAT_DOWN] of Boolean;
  end;

var
  KeyBuffer: array [0..e_MaxKbdKeys] of Boolean;
  VirtBuffer: array [0..e_MaxVirtKeys] of Boolean;
  Joysticks: array of TJoystick = nil;

function OpenJoysticks(): Byte;
var
  i, j, k, c: Integer;
  joy: PSDL_Joystick;
begin
  Result := 0;
  k := Min(e_MaxJoys, SDL_NumJoysticks());
  if k = 0 then Exit;
  c := 0;
  for i := 0 to k do
  begin
    joy := SDL_JoystickOpen(i);
    if joy <> nil then
    begin
      Inc(c);
      e_WriteLog('Input: Opened SDL joystick ' + IntToStr(i) + ' (' + SDL_JoystickName(joy) +
                 ') as joystick ' + IntToStr(c) + ':', TMsgType.Notify);
      SetLength(Joysticks, c);
      with Joysticks[c-1] do
      begin
        ID := i;
        Handle := joy;
        Axes := Min(e_MaxJoyAxes, SDL_JoystickNumAxes(joy));
        Buttons := Min(e_MaxJoyBtns, SDL_JoystickNumButtons(joy));
        Hats := Min(e_MaxJoyHats, SDL_JoystickNumHats(joy));
        // TODO: find proper solution for this xbox trigger shit
        for j := 0 to Axes do AxisZero[j] := SDL_JoystickGetAxis(joy, j);
        e_WriteLog('       ' + IntToStr(Axes) + ' axes, ' + IntToStr(Buttons) + ' buttons, ' +
                   IntToStr(Hats) + ' hats.', TMsgType.Notify);
      end;
    end;
  end;
  Result := c;
end;

procedure ReleaseJoysticks();
var
  i: Integer;
begin
  if (Joysticks = nil) or (e_JoysticksAvailable = 0) then Exit;
  for i := Low(Joysticks) to High(Joysticks) do
    with Joysticks[i] do
      SDL_JoystickClose(Handle);
  SetLength(Joysticks, 0);
end;


procedure e_UnpressAllKeys ();
var
  i: Integer;
begin
  for i := 0 to High(KeyBuffer) do KeyBuffer[i] := False;
  for i := 0 to High(VirtBuffer) do VirtBuffer[i] := False;
end;


procedure e_KeyUpDown (key: Word; down: Boolean);
begin
  if (key > 0) and (key < Length(KeyBuffer)) then KeyBuffer[key] := down
  else if (key >= VIRT_BEG) and (key < VIRT_END) then VirtBuffer[key - VIRT_BEG] := down
end;


function PollKeyboard(): Boolean;
{
var
  Keys: PByte;
  NKeys: Integer;
  i: NativeUInt;
}
begin
  Result := False;
  {
  Keys := SDL_GetKeyboardState(@NKeys);
  if (Keys = nil) or (NKeys < 1) then Exit;
  for i := 0 to NKeys do
  begin
    if ((PByte(NativeUInt(Keys) + i)^) <> 0) then KeyBuffer[i] := false;
  end;
  for i := NKeys to High(KeyBuffer) do KeyBuffer[i] := False;
  }
end;

procedure e_PollJoysticks();
var
  i, j: Word;
  hat: Byte;
begin
  //Result := False;
  if (Joysticks = nil) or (e_JoysticksAvailable = 0) then Exit;
  SDL_JoystickUpdate();
  for j := Low(Joysticks) to High(Joysticks) do
  begin
    with Joysticks[j] do
    begin
      for i := 0 to Buttons do ButtBuf[i] := SDL_JoystickGetButton(Handle, i) <> 0;
      for i := 0 to Axes do AxisBuf[i] := SDL_JoystickGetAxis(Handle, i);
      for i := 0 to Hats do
      begin
        hat := SDL_JoystickGetHat(Handle, i);
        HatBuf[i, HAT_UP] := LongBool(hat and SDL_HAT_UP);
        HatBuf[i, HAT_DOWN] := LongBool(hat and SDL_HAT_DOWN);
        HatBuf[i, HAT_LEFT] := LongBool(hat and SDL_HAT_LEFT);
        HatBuf[i, HAT_RIGHT] := LongBool(hat and SDL_HAT_RIGHT);
      end;
    end;
  end;
end;

procedure GenerateKeyNames();
var
  i, j, k: LongWord;
begin
  // keyboard key names
  e_KeyNames[IK_0] := '0';
  e_KeyNames[IK_1] := '1';
  e_KeyNames[IK_2] := '2';
  e_KeyNames[IK_3] := '3';
  e_KeyNames[IK_4] := '4';
  e_KeyNames[IK_5] := '5';
  e_KeyNames[IK_6] := '6';
  e_KeyNames[IK_7] := '7';
  e_KeyNames[IK_8] := '8';
  e_KeyNames[IK_9] := '9';
  for i := IK_A to IK_Z do
    e_KeyNames[i] := '' + chr(ord('a') + (i - IK_a));
  e_KeyNames[IK_ESCAPE] := 'ESCAPE';
  e_KeyNames[IK_ENTER] := 'ENTER';
  e_KeyNames[IK_TAB] := 'TAB';
  e_KeyNames[IK_BACKSPACE] := 'BACKSPACE';
  e_KeyNames[IK_SPACE] := 'SPACE';
  e_KeyNames[IK_UP] := 'UP';
  e_KeyNames[IK_LEFT] := 'LEFT';
  e_KeyNames[IK_RIGHT] := 'RIGHT';
  e_KeyNames[IK_DOWN] := 'DOWN';
  e_KeyNames[IK_INSERT] := 'INSERT';
  e_KeyNames[IK_DELETE] := 'DELETE';
  e_KeyNames[IK_HOME] := 'HOME';
  e_KeyNames[IK_END] := 'END';
  e_KeyNames[IK_PAGEUP] := 'PGUP';
  e_KeyNames[IK_PAGEDN] := 'PGDOWN';
  e_KeyNames[IK_KPINSERT] := 'PAD0';
  e_KeyNames[IK_KPEND] := 'PAD1';
  e_KeyNames[IK_KPDOWN] := 'PAD2';
  e_KeyNames[IK_KPPAGEDN] := 'PAD3';
  e_KeyNames[IK_KPLEFT] := 'PAD4';
  e_KeyNames[IK_KP5] := 'PAD5';
  e_KeyNames[IK_KPRIGHT] := 'PAD6';
  e_KeyNames[IK_KPHOME] := 'PAD7';
  e_KeyNames[IK_KPUP] := 'PAD8';
  e_KeyNames[IK_KPPAGEUP] := 'PAD9';
  e_KeyNames[IK_NUMLOCK] := 'NUM';
  e_KeyNames[IK_KPDIVIDE] := 'PAD/';
  e_KeyNames[IK_KPMULTIPLE] := 'PAD*';
  e_KeyNames[IK_KPMINUS] := 'PAD-';
  e_KeyNames[IK_KPPLUS] := 'PAD+';
  e_KeyNames[IK_KPENTER] := 'PADENTER';
  e_KeyNames[IK_KPDOT] := 'PAD.';
  e_KeyNames[IK_CAPSLOCK] := 'CAPS';
  e_KeyNames[IK_BACKQUOTE] := 'BACKQUOTE';
  e_KeyNames[IK_F1] := 'F1';
  e_KeyNames[IK_F2] := 'F2';
  e_KeyNames[IK_F3] := 'F3';
  e_KeyNames[IK_F4] := 'F4';
  e_KeyNames[IK_F5] := 'F5';
  e_KeyNames[IK_F6] := 'F6';
  e_KeyNames[IK_F7] := 'F7';
  e_KeyNames[IK_F8] := 'F8';
  e_KeyNames[IK_F9] := 'F9';
  e_KeyNames[IK_F10] := 'F10';
  e_KeyNames[IK_F11] := 'F11';
  e_KeyNames[IK_F12] := 'F12';
  e_KeyNames[IK_SHIFT] := 'LSHIFT';
  e_KeyNames[IK_RSHIFT] := 'RSHIFT';
  e_KeyNames[IK_CTRL] := 'LCTRL';
  e_KeyNames[IK_RCTRL] := 'RCTRL';
  e_KeyNames[IK_ALT] := 'LALT';
  e_KeyNames[IK_RALT] := 'RALT';
  e_KeyNames[IK_WIN] := 'LWIN';
  e_KeyNames[IK_RWIN] := 'RWIN';
  e_KeyNames[IK_MENU] := 'MENU';
  e_KeyNames[IK_PRINTSCR] := 'PSCRN';
  e_KeyNames[IK_SCROLLLOCK] := 'SCROLL';
  e_KeyNames[IK_PAUSE] := 'PAUSE';
  e_KeyNames[IK_LBRACKET] := '[';
  e_KeyNames[IK_RBRACKET] := ']';
  e_KeyNames[IK_SEMICOLON] := ';';
  e_KeyNames[IK_QUOTE] := '''';
  e_KeyNames[IK_BACKSLASH] := '\';
  e_KeyNames[IK_SLASH] := '/';
  e_KeyNames[IK_COMMA] := ',';
  e_KeyNames[IK_DOT] := '.';
  e_KeyNames[IK_MINUS] := '-';
  e_KeyNames[IK_EQUALS] := '=';

  //for i := 0 to IK_LASTKEY do
  //  e_KeyNames[i] := SDL_GetScancodeName(i);

  // joysticks
  for j := 0 to e_MaxJoys-1 do
  begin
    k := JOYK_BEG + j * e_MaxJoyBtns;
    // buttons
    for i := 0 to e_MaxJoyBtns-1 do
      e_KeyNames[k + i] := Format('JOY%dB%d', [j, i]);
    k := JOYA_BEG + j * e_MaxJoyAxes * 2;
    // axes
    for i := 0 to e_MaxJoyAxes-1 do
    begin
      e_KeyNames[k + i*2    ] := Format('JOY%dA%d+', [j, i]);
      e_KeyNames[k + i*2 + 1] := Format('JOY%dA%d-', [j, i]);
    end;
    k := JOYH_BEG + j * e_MaxJoyHats * 4;
    // hats
    for i := 0 to e_MaxJoyHats-1 do
    begin
      e_KeyNames[k + i*4    ] := Format('JOY%dD%dL', [j, i]);
      e_KeyNames[k + i*4 + 1] := Format('JOY%dD%dU', [j, i]);
      e_KeyNames[k + i*4 + 2] := Format('JOY%dD%dR', [j, i]);
      e_KeyNames[k + i*4 + 3] := Format('JOY%dD%dD', [j, i]);
    end;
  end;

  // vitrual keys
  for i := 0 to e_MaxVirtKeys-1 do
    e_KeyNames[VIRT_BEG + i] := 'VIRTUAL' + IntToStr(i);
end;

function e_InitInput(): Boolean;
begin
  Result := False;

  e_JoysticksAvailable := OpenJoysticks();
  e_EnableInput := True;
  GenerateKeyNames();

  Result := True;
end;

procedure e_ReleaseInput();
begin
  ReleaseJoysticks();
  e_JoysticksAvailable := 0;
end;

procedure e_ClearInputBuffer();
var
  i, j, d: Integer;
begin
  for i := Low(KeyBuffer) to High(KeyBuffer) do
    KeyBuffer[i] := False;
  if (Joysticks = nil) or (e_JoysticksAvailable = 0) then
  for i := Low(Joysticks) to High(Joysticks) do
  begin
    for j := Low(Joysticks[i].ButtBuf) to High(Joysticks[i].ButtBuf) do
      Joysticks[i].ButtBuf[j] := False;
    for j := Low(Joysticks[i].AxisBuf) to High(Joysticks[i].AxisBuf) do
      Joysticks[i].AxisBuf[j] := 0;
    for j := Low(Joysticks[i].HatBuf) to High(Joysticks[i].HatBuf) do
      for d := Low(Joysticks[i].HatBuf[j]) to High(Joysticks[i].HatBuf[j]) do
        Joysticks[i].HatBuf[j, d] := False;
  end;
  for i := Low(VirtBuffer) to High(VirtBuffer) do
    VirtBuffer[i] := False;
end;

{
function e_PollInput(): Boolean;
var
  kb, js: Boolean;
begin
  kb := PollKeyboard();
  js := e_PollJoysticks();

  Result := kb or js;
end;
}

function e_KeyPressed(Key: Word): Boolean;
var
  joyi, dir: Integer;
begin
  Result := False;
  if (Key = IK_INVALID) or (Key = 0) then Exit;

  if (Key < KBRD_END) then
  begin // Keyboard buttons/keys
    Result := KeyBuffer[Key];
  end

  else if (Key >= JOYK_BEG) and (Key < JOYK_END) then
  begin // Joystick buttons
    JoyI := (Key - JOYK_BEG) div e_MaxJoyBtns;
    if JoyI >= e_JoysticksAvailable then
      Result := False
    else
    begin
      Key := (Key - JOYK_BEG) mod e_MaxJoyBtns;
      Result := Joysticks[JoyI].ButtBuf[Key];
    end;
  end

  else if (Key >= JOYA_BEG) and (Key < JOYA_END) then
  begin // Joystick axes
    JoyI := (Key - JOYA_BEG) div (e_MaxJoyAxes*2);
    if JoyI >= e_JoysticksAvailable then
      Result := False
    else
    begin
      Key := (Key - JOYA_BEG) mod (e_MaxJoyAxes*2);
      dir := Key mod 2;
      if dir = AX_MINUS then
        Result := Joysticks[JoyI].AxisBuf[Key div 2] <
          Joysticks[JoyI].AxisZero[Key div 2] - e_JoystickDeadzones[JoyI]
      else
        Result := Joysticks[JoyI].AxisBuf[Key div 2] >
          Joysticks[JoyI].AxisZero[Key div 2] + e_JoystickDeadzones[JoyI]
    end;
  end

  else if (Key >= JOYH_BEG) and (Key < JOYH_END) then
  begin // Joystick hats
    JoyI := (Key - JOYH_BEG) div (e_MaxJoyHats*4);
    if JoyI >= e_JoysticksAvailable then
      Result := False
    else
    begin
      Key := (Key - JOYH_BEG) mod (e_MaxJoyHats*4);
      dir := Key mod 4;
      Result := Joysticks[JoyI].HatBuf[Key div 4, dir];
    end;
  end

  else if (Key >= VIRT_BEG) and (Key < VIRT_END) then
    Result := VirtBuffer[Key - VIRT_BEG]
end;

procedure e_SetKeyState(key: Word; state: Integer);
var
  JoyI, dir: Integer;
begin
  if (Key = IK_INVALID) or (Key = 0) then Exit;

  if (Key < KBRD_END) then
  begin // Keyboard buttons/keys
    keyBuffer[key] := (state <> 0);
  end

  else if (Key >= JOYK_BEG) and (Key < JOYK_END) then
  begin // Joystick buttons
    JoyI := (Key - JOYK_BEG) div e_MaxJoyBtns;
    if JoyI >= e_JoysticksAvailable then
      Exit
    else
    begin
      Key := (Key - JOYK_BEG) mod e_MaxJoyBtns;
      Joysticks[JoyI].ButtBuf[Key] := (state <> 0);
    end;
  end

  else if (Key >= JOYA_BEG) and (Key < JOYA_END) then
  begin // Joystick axes
    JoyI := (Key - JOYA_BEG) div (e_MaxJoyAxes*2);
    if JoyI >= e_JoysticksAvailable then
      Exit
    else
    begin
      Key := (Key - JOYA_BEG) mod (e_MaxJoyAxes*2);
      Joysticks[JoyI].AxisBuf[Key div 2] := state;
    end;
  end

  else if (Key >= JOYH_BEG) and (Key < JOYH_END) then
  begin // Joystick hats
    JoyI := (Key - JOYH_BEG) div (e_MaxJoyHats*4);
    if JoyI >= e_JoysticksAvailable then
      Exit
    else
    begin
      Key := (Key - JOYH_BEG) mod (e_MaxJoyHats*4);
      dir := Key mod 4;
      Joysticks[JoyI].HatBuf[Key div 4, dir] := (state <> 0);
    end;
  end

  else if (Key >= VIRT_BEG) and (Key < VIRT_END) then
    VirtBuffer[Key - VIRT_BEG] := (state <> 0)
end;

function e_AnyKeyPressed(): Boolean;
var
  k: Word;
begin
  Result := False;

  for k := 1 to e_MaxInputKeys do
    if e_KeyPressed(k) then
    begin
      Result := True;
      Break;
    end;
end;

function e_GetFirstKeyPressed(): Word;
var
  k: Word;
begin
  Result := IK_INVALID;

  for k := 1 to e_MaxInputKeys do
    if e_KeyPressed(k) then
    begin
      Result := k;
      Break;
    end;
end;

////////////////////////////////////////////////////////////////////////////////

function e_JoystickStateToString(mode: Integer): String;
begin
  Result := '';
end;

function  e_JoyByHandle(handle: Word): Integer;
var
  i: Integer;
begin
  Result := -1;
  if Joysticks = nil then Exit;
  for i := Low(Joysticks) to High(Joysticks) do
    if Joysticks[i].ID = handle then
    begin
      Result := i;
      Exit;
    end;
end;

function e_JoyButtonToKey(id: Word; btn: Byte): Word;
begin
  Result := 0;
  if id >= e_MaxJoys then Exit;
  Result := JOYK_BEG + id*e_MaxJoyBtns + btn;
end;

function e_JoyAxisToKey(id: Word; ax: Byte; dir: Byte): Word;
begin
  Result := 0;
  if id >= e_MaxJoys then Exit;
  Result := JOYA_BEG + id*e_MaxJoyAxes*2 + ax*2 + dir;
end;

function e_JoyHatToKey(id: Word; hat: Byte; dir: Byte): Word;
begin
  Result := 0;
  if id >= e_MaxJoys then Exit;
  Result := JOYH_BEG + id*e_MaxJoyHats*4 + hat*4 + dir;
end;


end.
