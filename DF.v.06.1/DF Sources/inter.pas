unit inter;

interface

const
  I_CONSOLE_DUMPED = '��������� � %s';
  I_CONSOLE_ERRORWRITE = '������ ��� ������ � ���� %s';
  I_CONSOLE_SCREENSHOT = '�������� �������� � %s';
  I_CONSOLE_UNKNOWN = '����������� ������� %s';
  I_CONSOLE_WELCOME = '����� ���������� � Doom2D: Forever %s';

  I_GAME_DMERROR = '�� ����� ���� ����� DM !';
  I_GAME_GETDMERROR = '�� ������� �������� ����� �������� !';
  I_GAME_CTFERROR = '�� ����� ��� ������ !';
  I_GAME_MAPLOADERROR = '�� ������� ��������� ����� %s';
  I_GAME_PLAYERCREATEERROR = '�� ������� ������� ������#%d';
  I_GAME_TEXTURELOADERROR = '������ ��� �������� �������� "%s"';
  I_GAME_TEXTUREERROR = '�������� "%s" �� �������';
  I_GAME_MODELERROR = '������ "%s" �� �������';
  I_GAME_PLAYERNAME = '�����';
  I_GAME_GAMETIME = '����� ����: ';
  I_GAME_FRAGS = '������';
  I_GAME_DEATHS = '�������';
  I_GAME_DM = '���������';
  I_GAME_CTF = '������ �����';
  I_GAME_TDM = '��������� ���������';
  I_GAME_FRAGLIMIT = '����������� ������: %d';
  I_GAME_POINTLIMIT = '����������� �����: %d';
  I_GAME_TIMELIMIT = '����������� �� �������: %.2d:%.2d';
  I_GAME_REDTEAM = '������� ������� (%d)';
  I_GAME_BLUETEAM = '����� ������� (%d)';
  I_GAME_REDTEAMNAME = '�������';
  I_GAME_BLUETEAMNAME = '�����';
  I_GAME_REDWIN = '�� ����������� ���� �������� ������� �������';
  I_GAME_BLUEWIN = '�� ����������� ���� �������� ����� �������';
  I_GAME_NOWIN = '�� ����������� ���� ���������� �� ��������';

  I_MENU_STARTGAME = '������ ����';
  I_MENU_MAINMENU = '����';
  I_MENU_NEWGAME = '����� ����';
  I_MENU_MULTIPLAYER = '�����������';
  I_MENU_OPTIONS = '���������';
  I_MENU_AUTHORS = '������';
  I_MENU_EXIT = '�����';
  I_MENU_1PLAYER = '���� �����';
  I_MENU_2PLAYERS = '��� ������';
  I_MENU_CUSTOMGAME = '���� ����';
  I_MENU_EPISODE = '����� �������';
  I_MENU_SELECTMAP = '�����';
  I_MENU_VIDEOOPTIONS = '�����';
  I_MENU_SOUNDOPTIONS = '����';
  I_MENU_SAVEDOPTIONS = '�����������';
  I_MENU_DEFAULTOPTIONS = '�����������';
  I_MENU_GAMEOPTIONS = '����';
  I_MENU_CONTROLSOPTIONS = '����������';
  I_MENU_PLAYEROPTIONS = '������';
  I_MENU_LOADGAME = '������ ����';
  I_MENU_SAVEGAME = '��������� ����';
  I_MENU_ENDGAME = '��������� ����';
  I_MENU_RESTART = '������ ������';

  I_MENU_STAT = '���������� ����';
  I_MENU_MAP = '�����:';
  I_MENU_GAMETYPE = '��� ����:';
  I_MENU_DM = 'DM';
  I_MENU_CTF = 'CTF';
  I_MENU_TDM = 'TDM';
  I_MENU_TIMELIMIT = '���. �� �������:';
  I_MENU_GOALLIMIT = '���. �� �����:';
  I_MENU_TEAMDAMAGE = '����� �����:';
  I_MENU_ENABLEEXITS = '�������� �����:';
  I_MENU_WEAPONSTAY = '������ ��������:';
  I_MENU_MONSTERDM = '�� � ���������:';
  I_MENU_MAPWAD = '����� WAD''�:';
  I_MENU_MAPRES = '����� �����:';
  I_MENU_MAPNAME = '��������:';
  I_MENU_MAPAUTHOR = '�����:';
  I_MENU_MAPDESCRIPTION = '��������:';
  I_MENU_MAPSIZE = '������:';
  I_MENU_PLAYERS = '����� �������:';
  I_MENU_PLAYERS2 = '�������:';
  I_MENU_ONEPLAYER = '����';
  I_MENU_TWOPLAYER = '���';
  I_MENU_INTER1 = '���� ���������';
  I_MENU_INTER2 = '������� �������';
  I_MENU_INTER3 = '��';
  I_MENU_INTER4 = '����';
  I_MENU_INTER5 = '������� � ������';
  I_MENU_INTER6 = '����� ��������';
  I_MENU_INTER7 = '��';
  I_MENU_PLAYER1 = '������ �����';
  I_MENU_PLAYER2 = '������ �����';
  I_MENU_UP = '(������)';
  I_MENU_DOWN = '(�����)';

  I_MENU_CONTROL_GLOBAL = '����� ����������';
  I_MENU_CONTROL_SCREENSHOT = '��������:';
  I_MENU_CONTROL_STAT = '����������:';
  I_MENU_CONTROL_LEFT = '�����:';
  I_MENU_CONTROL_RIGHT = '������:';
  I_MENU_CONTROL_UP = '�����:';
  I_MENU_CONTROL_DOWN = '����:';
  I_MENU_CONTROL_JUMP = '������:';
  I_MENU_CONTROL_FIRE = '�����:';
  I_MENU_CONTROL_USE = '���������:';
  I_MENU_CONTROL_NEXTWEAPON = '����. ������:';
  I_MENU_CONTROL_PREVWEAPON = '����. ������:';

  I_MENU_BLOODCOUNT = '���������� �����:';
  I_MENU_BLOODNONE = '��� �����';
  I_MENU_BLOODSMALL = '����';
  I_MENU_BLOODNORMAL = '���������';
  I_MENU_BLOODBIG = '�����';
  I_MENU_BLOODVERYBIG = '����� �����';
  I_MENU_GIBSCOUNTMAX = '����. ������:';
  I_MENU_CORPSESCOUNTMAX = '����. ������:';
  I_MENU_GIBSCOUNT = '������ �� ���:';
  I_MENU_GIBSNONE = '��� ������';
  I_MENU_SCREENFLASH = '������� ������:';
  I_MENU_BLOODTYPE = '��� �����:';
  I_MENU_BLOODSIMPLE = '�������';
  I_MENU_BLOODADV = '�����������';
  I_MENU_CORPSETYPE = '��� ������:';
  I_MENU_CORPSESIMPLE = '�������';
  I_MENU_CORPSEADV = '�����������';
  I_MENU_GIBSTYPE = '��� ������:';
  I_MENU_GIBSSIMPLE = '�������';
  I_MENU_GIBSADV = '�����������';
  I_MENU_PARTICLESCOUNT = '���������� ������:';
  I_MENU_BACKGROUND = '�������� ���:';
  I_MENU_MESSAGES = '�������� ���������:';
  I_MENU_REVERTPLAYERS = '����������� ������:';
  I_MENU_FREQ = '�������:';
  I_MENU_FULLSCREEN = '������ �����:';
  I_MENU_RESOLUTION = '����������:';
  I_MENU_BPP = '������� �����:';
  I_MENU_VSYNC = '����. �������������:';
  I_MENU_TEXTUREFILTER = '���������� �������:';
  I_MENU_VIDEORESTART = '��������� ����� ������� � ���� ����� ����������� ����';
  I_MENU_MUSICLEVEL = '��������� ������:';
  I_MENU_SOUNDLEVEL = '��������� �����:';

  I_MENU_PLAYERNAME = '���:';
  I_MENU_TEAM = '�������:';
  I_MENU_REDTEAM = '�������';
  I_MENU_BLUETEAM = '�����';
  I_MENU_MODEL = '������:';
  I_MENU_RED = '�������:';
  I_MENU_GREEN = '�������:';
  I_MENU_BLUE = '�����:';
  I_MENU_MODELINFO = '���������� � ������';
  I_MENU_MODELANIM = '������� ��������';
  I_MENU_MODELWEAP = '������� ������';
  I_MENU_MODELROT = '��������� ������';
  I_MENU_MODELNAME = '���:';
  I_MENU_MODELAUTHOR = '�����:';
  I_MENU_MODELCOMMENT = '�����������:';
  I_MENU_MODELOPTIONS = '����� ������:';
  I_MENU_MODELWEAPON = '������:';

  I_MENU_PAUSE = '�����';
  I_MENU_YES = '��';
  I_MENU_NO = '���';
  I_MENU_OK = 'OK';
  I_MENU_FINISH = '������';

  I_MENU_ENDGAME1 = '�� ������������� ������ ��������� ���� ?';
  I_MENU_RESTARTGAME = '�� ������������� ������ ������ ������� ������ ?';
  I_MENU_EXIT1 = '�� ������������� ������ ����� �� Doom2D: Forever ?';
  I_MENU_SETDEFAULT = '�������� ��� ��������� �� ����������� ?';
  I_MENU_SETSAVED = '������� ��� ��������� �� ����������� ?';
  I_PLAYER_KILL = '*** %s ��� ���� %s';
  I_PLAYER_EXTRAHARDKILL1 = '*** %s ��� �������� �� ����� %s';
  I_PLAYER_EXTRAHARDKILL2 = '*** %s ��� ������� ���� %s';
  I_PLAYER_ACIDKILL = '*** %s ������ � �������';
  I_PLAYER_TRAPKILL = '*** %s ��������� �� �������';
  I_PLAYER_FALLKILL = '*** %s ������';
  I_PLAYER_SELFKILL = '*** %s ���� ����';
  I_PLAYER_WATERKILL = '*** %s ������';
  I_PLAYER_GETFLAG = '*** %s ������� %s ���� !';
  I_PLAYER_RETURNFLAG = '*** %s ������ %s ���� !';
  I_PLAYER_CAPTUREFLAG = '*** %s ������ %s ���� !';
  I_PLAYER_DROPFLAG = '*** %s ������� %s ���� !';
  I_PLAYER_REDFLAG = '�������';
  I_PLAYER_BLUEFLAG = '�����';
  I_MESSAGE_RETURNFLAG = '%s ���� ���������';
  I_MESSAGE_GETFLAG = '%s ���� �������';
  I_MESSAGE_CAPTUREFLAG = '%s ���� ��������';
  I_MESSAGE_DROPFLAG = '%s ���� �������';

  I_CREDITS01 = 'Doom2D: Forever';
  I_CREDITS02 = '������ 06.1';
  I_CREDITS03 = '������ ����:';
  I_CREDITS04 = '����� � ����������';
  I_CREDITS05 = 'rs.falcon';
  I_CREDITS06 = '������� ������������';
  I_CREDITS07 = '�������� � ���������';
  I_CREDITS08 = 'Jabberwock';
  I_CREDITS09 = '��������� ���� � ���������';
  I_CREDITS10 = 'DEAD';
  I_CREDITS11 = '������ ��������';
  I_CREDITS12 = 'FireHawK';
  I_CREDITS13 = '';
  I_CREDITS14 = '';
  I_CREDITS15 = '�� �� �� �������:';
  I_CREDITS16 = '������� ������������� Prikol Software,';
  I_CREDITS17 = '������� ������� Doom2D.';
  I_CREDITS18 = '�������� ID, �� �� ������� ����,';
  I_CREDITS19 = '������� ��� ����� ������.';
  I_CREDITS20 = '� ���� ���, ��� ������� ������ ���� ����';

implementation

end.
