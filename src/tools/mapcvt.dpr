(* Copyright (C) 2016 - The Doom2D.org team & involved community members <http://www.doom2d.org>.
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation, version 3 of
 * the License ONLY.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program.
 * If not, see <http://www.gnu.org/licenses/>.
 *)

{$INCLUDE ../shared/a_modes.inc}

{$IFDEF WINDOWS}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  SysUtils, Classes,
  {$IFDEF USE_SDL}
    SDL in '../lib/sdl/sdl.pas',
  {$ENDIF}
  {$IFDEF USE_SDL2}
    SDL2 in '../lib/sdl2/sdl2.pas',
  {$ENDIF}
  sfs in '../sfs/sfs.pas',
  sfsPlainFS in '../sfs/sfsPlainFS.pas',
  sfsZipFS in '../sfs/sfsZipFS.pas',
  mempool in '../shared/mempool.pas',
  xstreams in '../shared/xstreams.pas',
  xparser in '../shared/xparser.pas',
  xdynrec in '../shared/xdynrec.pas',
  xprofiler in '../shared/xprofiler.pas',
  utils in '../shared/utils.pas',
  hashtable in '../shared/hashtable.pas',
  conbuf in '../shared/conbuf.pas',
  e_log in '../engine/e_log.pas',
  wadreader in '../shared/wadreader.pas',
  MAPDEF in '../shared/MAPDEF.pas';


// ////////////////////////////////////////////////////////////////////////// //
var
  pr: TTextParser;
  dfmapdef: TDynMapDef;
  wr: TTextWriter;
  map: TDynRecord;
  st: TStream;
  stt: UInt64;
  inname: AnsiString = '';
  outname: AnsiString = '';
  totext: Integer = -1; // <0: guess; force outname extension
  //sign: packed array[0..3] of AnsiChar;
  wad: TWADFile = nil;
  waddata: Pointer;
  waddlen: Integer;
  wasbin: Boolean = false;
  lostdata: Boolean;
begin
  if (ParamCount = 0) then
  begin
    writeln('usage: mapcvt inname outname');
    Halt(1);
  end;

  inname := ParamStr(1);
  //writeln('inname: [', inname, ']');
  if (ParamCount = 1) then
  begin
    outname := forceFilenameExt(ParamStr(1), '');
    if isWadPath(outname) then
    begin
      outname := SFSReplacePathDelims(g_ExtractFilePathName(outname), '/');
      if (Length(outname) = 0) then begin writeln('FATAL: can''t guess output name!'); Halt(1); end;
    end;
  end
  else
  begin
    outname := ParamStr(2);
         if StrEquCI1251(getFilenameExt(outname), '.txt') then totext := 1
    else if StrEquCI1251(getFilenameExt(outname), '.map') then totext := 0
    else if StrEquCI1251(getFilenameExt(outname), '.dfmap') then totext := 0
    else if (Length(getFilenameExt(outname)) = 0) then totext := -1
    else begin writeln('FATAL: can''t guess output format!'); Halt(1); end;
  end;
  //writeln('outname: [', outname, ']; totext=', totext);

  e_InitWritelnDriver();
  conbufDumpToStdOut := true;
  conbufConPrefix := false;

  writeln('parsing "mapdef.txt"...');
  //pr := TFileTextParser.Create('mapdef.txt');
  pr := TStrTextParser.Create(defaultMapDef);
  try
    dfmapdef := TDynMapDef.Create(pr);
  except
    on e: Exception do
    begin
      writeln('ERROR at (', pr.line, ',', pr.col, '): ', e.message);
      Halt(1);
    end;
  end;

  writeln('parsing "', inname, '"...');

  if isWadPath(inname) then
  begin
    wad := TWADFile.Create();
    wad.ReadFile(g_ExtractWadName(inname));
    wad.GetMapResource(g_ExtractFilePathName(inname), waddata, waddlen);
    st := TSFSMemoryChunkStream.Create(waddata, waddlen, true);
    wad.Free();
  end
  else
  begin
    st := openDiskFileRO(inname);
  end;

  try
    stt := getTimeMicro();
    map := dfmapdef.parseMap(st, @wasbin);
    stt := getTimeMicro()-stt;
    if wasbin then write('binary') else write('text');
    writeln(' map parsed in ', stt div 1000, '.', stt mod 1000, ' milliseconds');
  except
    on e: TDynParseException do
    begin
      writeln('ERROR at (', e.tokLine, ',', e.tokCol, '): ', e.message);
      Halt(1);
    end;
    on E: Exception do
    begin
      writeln('ERROR: ', e.message);
      Halt(1);
    end;
  end;

  {$IF DEFINED(D2D_DYNREC_PROFILER)}xdynDumpProfiles();{$ENDIF}

  if (totext < 0) then
  begin
    if wasbin then begin outname := forceFilenameExt(outname, '.txt'); totext := 1; end
    else begin outname := forceFilenameExt(outname, '.map'); totext := 0; end;
  end;

  assert(totext >= 0);

  writeln('writing "', outname, '"...');
  st := createDiskFile(outname);
  if (totext = 0) then
  begin
    // write binary map
    lostdata := false;
    stt := getTimeMicro();
    map.writeBinTo(lostdata, st);
    stt := getTimeMicro()-stt;
    if lostdata then writeln('***WARNING! some data was lost due to binary format limitations!');
    write('binary');
  end
  else
  begin
    // write text map
    wr := TFileTextWriter.Create(st);
    stt := getTimeMicro();
    map.writeTo(wr);
    stt := getTimeMicro()-stt;
    wr.Free();
    write('text');
  end;
  writeln(' map written in ', stt div 1000, '.', stt mod 1000, ' milliseconds');
end.
