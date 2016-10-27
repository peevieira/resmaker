object frmParametros: TfrmParametros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Alterar Par'#226'metros do Compilador'
  ClientHeight = 347
  ClientWidth = 479
  Color = 16707296
  Constraints.MaxHeight = 385
  Constraints.MaxWidth = 495
  Constraints.MinHeight = 385
  Constraints.MinWidth = 495
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    479
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object gbxParametros: TGroupBox
    Left = 9
    Top = 2
    Width = 462
    Height = 304
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Par'#226'metros do compilador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    object Label1: TLabel
      Left = 298
      Top = 110
      Width = 8
      Height = 13
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtArquivoComando: TEdit
      Left = 197
      Top = 19
      Width = 232
      Height = 21
      Hint = 'Digite o caminho do arquivo ou clique em "..."'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'Selecione um arquivo...'
      OnEnter = edtArquivoComandoEnter
      OnExit = edtArquivoComandoExit
      OnKeyUp = edtArquivoComandoKeyUp
    end
    object cbxArquivoComando: TCheckBox
      Left = 10
      Top = 21
      Width = 183
      Height = 17
      Caption = 'Obter instru'#231#245'es de um arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = cbxArquivoComandoClick
    end
    object cbxDefinirNomeRes: TCheckBox
      Left = 10
      Top = 50
      Width = 183
      Height = 17
      Caption = 'Definir o nome do arquivo  gerado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = cbxDefinirNomeResClick
    end
    object cbxAdicionarInclude: TCheckBox
      Left = 10
      Top = 79
      Width = 183
      Height = 17
      Caption = 'Adicionar diret'#243'rio ao include'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = cbxAdicionarIncludeClick
    end
    object cbxDefine: TCheckBox
      Left = 10
      Top = 109
      Width = 183
      Height = 17
      Caption = 'S'#237'mbolo do pr'#233'-processador '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = cbxDefineClick
    end
    object cbxApagarInclude: TCheckBox
      Left = 10
      Top = 138
      Width = 162
      Height = 17
      Caption = 'Apagar o "Include Path" atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object cbxCodePage: TCheckBox
      Left = 10
      Top = 202
      Width = 183
      Height = 17
      Caption = 'Especificar Code Page do Resorce'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = cbxCodePageClick
    end
    object cbxDBCS: TCheckBox
      Left = 26
      Top = 221
      Width = 218
      Height = 17
      Caption = 'Cont'#233'm caracteres  double-byte (DBCS)'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
    end
    object rbt16Bits: TRadioButton
      Left = 10
      Top = 277
      Width = 113
      Height = 17
      Caption = 'Resource 16 bits'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      TabStop = True
    end
    object rbt32Bits: TRadioButton
      Left = 10
      Top = 259
      Width = 157
      Height = 17
      Caption = 'Resource 32 bits (Padr'#227'o)'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      TabStop = True
    end
    object cbxEspecificarIdioma: TCheckBox
      Left = 10
      Top = 169
      Width = 234
      Height = 17
      Caption = 'Especificar o idioma padr'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = cbxEspecificarIdiomaClick
    end
    object btnArquivoComando: TBitBtn
      Left = 429
      Top = 17
      Width = 25
      Height = 25
      Caption = '...'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnArquivoComandoClick
    end
    object cmbCodepage: TComboBox
      Left = 197
      Top = 200
      Width = 257
      Height = 21
      Hint = 'Selecionar uma code page da lista.'
      AutoComplete = False
      DoubleBuffered = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      Text = 'Selecione uma Code Page...'
      OnEnter = cmbCodepageEnter
      OnExit = cmbCodepageExit
      Items.Strings = (
        'IBM EBCDIC US-Canada '
        'OEM United States '
        'IBM EBCDIC International '
        'Arabic (ASMO 708) '
        'Arabic (ASMO-449+, BCON V4) '
        'Arabic - Transparent Arabic '
        'Arabic (Transparent ASMO); Arabic (DOS) '
        'OEM Greek (formerly 437G); Greek (DOS) '
        'OEM Baltic; Baltic (DOS) '
        'OEM Multilingual Latin 1; Western European (DOS) '
        'OEM Latin 2; Central European (DOS) '
        'OEM Cyrillic (primarily Russian) '
        'OEM Turkish; Turkish (DOS) '
        'OEM Multilingual Latin 1 + Euro symbol '
        'OEM Portuguese; Portuguese (DOS) '
        'OEM Icelandic; Icelandic (DOS) '
        'OEM Hebrew; Hebrew (DOS) '
        'OEM French Canadian; French Canadian (DOS) '
        'OEM Arabic; Arabic (864) '
        'OEM Nordic; Nordic (DOS) '
        'OEM Russian; Cyrillic (DOS) '
        'OEM Modern Greek; Greek, Modern (DOS) '
        
          '870 IBM870 IBM EBCDIC Multilingual/ROECE (Latin 2); IBM EBCDIC M' +
          'ultilingual Latin 2 '
        
          '874 windows-874 ANSI/OEM Thai (same as 28605, ISO 8859-15); Thai' +
          ' (Windows) '
        'IBM EBCDIC Greek Modern '
        'ANSI/OEM Japanese; Japanese (Shift-JIS) '
        
          'ANSI/OEM Simplified Chinese (PRC, Singapore); Chinese Simplified' +
          ' (GB2312) '
        'ANSI/OEM Korean (Unified Hangul Code) '
        
          'ANSI/OEM Traditional Chinese (Taiwan; Hong Kong SAR, PRC); Chine' +
          'se Traditional (Big5) '
        'IBM EBCDIC Turkish (Latin 5) '
        'IBM EBCDIC Latin 1/Open System '
        
          'IBM EBCDIC US-Canada (037 + Euro symbol); IBM EBCDIC (US-Canada-' +
          'Euro)  '
        
          'IBM EBCDIC Germany (20273 + Euro symbol); IBM EBCDIC (Germany-Eu' +
          'ro) '
        
          'IBM EBCDIC Denmark-Norway (20277 + Euro symbol); IBM EBCDIC (Den' +
          'mark-Norway-Euro) '
        
          'IBM EBCDIC Finland-Sweden (20278 + Euro symbol); IBM EBCDIC (Fin' +
          'land-Sweden-Euro) '
        'IBM EBCDIC Italy (20280 + Euro symbol); IBM EBCDIC (Italy-Euro) '
        
          'IBM EBCDIC Latin America-Spain (20284 + Euro symbol); IBM EBCDIC' +
          ' (Spain-Euro) '
        
          'IBM EBCDIC United Kingdom (20285 + Euro symbol); IBM EBCDIC (UK-' +
          'Euro) '
        
          'IBM EBCDIC France (20297 + Euro symbol); IBM EBCDIC (France-Euro' +
          ') '
        
          'IBM EBCDIC International (500 + Euro symbol); IBM EBCDIC (Intern' +
          'ational-Euro) '
        
          'IBM EBCDIC Icelandic (20871 + Euro symbol); IBM EBCDIC (Icelandi' +
          'c-Euro) '
        
          'Unicode UTF-16, little endian byte order (BMP of ISO 10646); ava' +
          'ilable only to managed applications '
        
          'Unicode UTF-16, big endian byte order; available only to managed' +
          ' applications  '
        'ANSI Central European; Central European (Windows)  '
        'ANSI Cyrillic; Cyrillic (Windows) '
        'ANSI Latin 1; Western European (Windows)  '
        'ANSI Greek; Greek (Windows) '
        'ANSI Turkish; Turkish (Windows) '
        'ANSI Hebrew; Hebrew (Windows) '
        'ANSI Arabic; Arabic (Windows) '
        'ANSI Baltic; Baltic (Windows) '
        'ANSI/OEM Vietnamese; Vietnamese (Windows) '
        'Korean (Johab) '
        'MAC Roman; Western European (Mac) '
        'Japanese (Mac) '
        'MAC Traditional Chinese (Big5); Chinese Traditional (Mac) '
        'Korean (Mac) '
        'Arabic (Mac) '
        'Hebrew (Mac) '
        'Greek (Mac) '
        'Cyrillic (Mac) '
        'MAC Simplified Chinese (GB 2312); Chinese Simplified (Mac) '
        'Romanian (Mac) '
        'Ukrainian (Mac) '
        'Thai (Mac) '
        'MAC Latin 2; Central European (Mac) '
        'Icelandic (Mac) '
        'Turkish (Mac) '
        'Croatian (Mac) '
        
          'Unicode UTF-32, little endian byte order; available only to mana' +
          'ged applications '
        
          'Unicode UTF-32, big endian byte order; available only to managed' +
          ' applications '
        'CNS Taiwan; Chinese Traditional (CNS)  '
        'TCA Taiwan '
        'Eten Taiwan; Chinese Traditional (Eten)  '
        'IBM5550 Taiwan '
        'TeleText Taiwan  '
        'Wang Taiwan  '
        
          'IA5 (IRV International Alphabet No. 5, 7-bit); Western European ' +
          '(IA5) '
        'IA5 German (7-bit) '
        'IA5 Swedish (7-bit) '
        'IA5 Norwegian (7-bit) '
        'US-ASCII (7-bit) '
        'T.61 '
        'ISO 6937 Non-Spacing Accent '
        'IBM EBCDIC Germany '
        'IBM EBCDIC Denmark-Norway '
        'IBM EBCDIC Finland-Sweden '
        'IBM EBCDIC Italy '
        'IBM EBCDIC Latin America-Spain '
        'IBM EBCDIC United Kingdom '
        'IBM EBCDIC Japanese Katakana Extended '
        'IBM EBCDIC France '
        'IBM EBCDIC Arabic '
        'IBM EBCDIC Greek '
        'IBM EBCDIC Hebrew '
        'IBM EBCDIC Korean Extended '
        'IBM EBCDIC Thai '
        'Russian (KOI8-R); Cyrillic (KOI8-R) '
        'IBM EBCDIC Icelandic '
        'IBM EBCDIC Cyrillic Russian '
        'IBM EBCDIC Turkish '
        'IBM EBCDIC Latin 1/Open System (1047 + Euro symbol) '
        'Japanese (JIS 0208-1990 and 0121-1990) '
        'Simplified Chinese (GB2312); Chinese Simplified (GB2312-80) '
        'Korean Wansung '
        'IBM EBCDIC Cyrillic Serbian-Bulgarian '
        '(deprecated) '
        'Ukrainian (KOI8-U); Cyrillic (KOI8-U) '
        'ISO 8859-1 Latin 1; Western European (ISO) '
        'ISO 8859-2 Central European; Central European (ISO) '
        'ISO 8859-3 Latin 3 '
        'ISO 8859-4 Baltic '
        'ISO 8859-5 Cyrillic '
        'ISO 8859-6 Arabic '
        'ISO 8859-7 Greek '
        'ISO 8859-8 Hebrew; Hebrew (ISO-Visual) '
        'ISO 8859-9 Turkish '
        'ISO 8859-13 Estonian '
        'ISO 8859-15 Latin 9 '
        'Europa 3 '
        'ISO 8859-8 Hebrew; Hebrew (ISO-Logical) '
        'ISO 2022 Japanese with no halfwidth Katakana; Japanese (JIS) '
        
          'ISO 2022 Japanese with halfwidth Katakana; Japanese (JIS-Allow 1' +
          ' byte Kana) '
        
          'ISO 2022 Japanese JIS X 0201-1989; Japanese (JIS-Allow 1 byte Ka' +
          'na - SO/SI) '
        'ISO 2022 Korean  '
        'ISO 2022 Simplified Chinese; Chinese Simplified (ISO 2022) '
        'ISO 2022 Traditional Chinese '
        'EBCDIC Japanese (Katakana) Extended '
        'EBCDIC US-Canada and Japanese '
        'EBCDIC Korean Extended and Korean '
        'EBCDIC Simplified Chinese Extended and Simplified Chinese '
        'EBCDIC Simplified Chinese '
        'EBCDIC US-Canada and Traditional Chinese '
        'EBCDIC Japanese (Latin) Extended and Japanese '
        'EUC Japanese '
        'EUC Simplified Chinese; Chinese Simplified (EUC) '
        'EUC Korean '
        'EUC Traditional Chinese '
        'HZ-GB2312 Simplified Chinese; Chinese Simplified (HZ)  '
        
          'Windows XP and later: GB18030 Simplified Chinese (4 byte); Chine' +
          'se Simplified (GB18030)  '
        'ISCII Devanagari '
        'ISCII Bengali '
        'ISCII Tamil '
        'ISCII Telugu '
        'ISCII Assamese '
        'ISCII Oriya '
        'ISCII Kannada '
        'ISCII Malayalam '
        'ISCII Gujarati '
        'ISCII Punjabi '
        'Unicode (UTF-7) '
        'Unicode (UTF-8) ')
    end
    object cmbEspecificarIdioma: TComboBox
      Left = 197
      Top = 167
      Width = 257
      Height = 21
      Hint = 'Selecionar um idioma da lista.'
      AutoComplete = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      Text = 'Selecione um Idioma...'
      OnEnter = cmbEspecificarIdiomaEnter
      OnExit = cmbEspecificarIdiomaExit
      Items.Strings = (
        'Afric'#226'ner ('#193'frica do Sul)'
        'Alb'#226'nia (Alb'#226'nia)'
        'Alsatian (Fran'#231'a)'
        'Am'#225'rico (Eti'#243'pia)'
        #193'rabe (Arg'#233'lia)'
        #193'rabe (Bahrein)'
        #193'rabe (Egito)'
        #193'rabe (Iraque)'
        #193'rabe (Jord'#226'nia)'
        #193'rabe (Kuwait)'
        #193'rabe (L'#237'bano)'
        #193'rabe (L'#237'bia)'
        #193'rabe (Marrocos)'
        #193'rabe (Om'#227')'
        #193'rabe (Catar)'
        #193'rabe (Ar'#225'bia Saudita)'
        #193'rabe (S'#237'ria)'
        #193'rabe (Tun'#237'sia)'
        #193'rabe (E.A.U.)'
        #193'rabe (I'#234'men)'
        'Arm'#234'nio (Arm'#234'nia)'
        'Assam'#234's ('#205'ndia)'
        'Azeri (Cir'#237'lico, Azerbaij'#227'o)'
        'Azeri (Latino, Azerbaij'#227'o)'
        'Bashkir (R'#250'ssia)'
        'Basco (Pa'#237's Basco)'
        'Bielo-russo (Belarus)'
        'Bengali ('#205'ndia)'
        'B'#243'snio (Latino, B'#243'snia e Herzegovina)'
        'B'#243'snio (Cir'#237'lico, B'#243'snia e Herzegovina)'
        'B'#243'snio (Latino, B'#243'snia e Herzegovina)'
        'Bret'#227'o (Fran'#231'a)'
        'B'#250'lgaro (Bulg'#225'ria)'
        'Catal'#227'o (Catalunha)'
        
          'Chin'#234's (Tradicional, Regi'#227'o Administrativa Especial de Hong Kong' +
          ')'
        'Chin'#234's (Tradicional, Regi'#227'o Administrativa Especial de Macau)'
        'Chin'#234's (Simplificado, Cingapura)'
        'Chin'#234's (Simplificado, Rep'#250'blica Popular da China)'
        'Chin'#234's (Tradicional, Taiwan)'
        'Corsican (Fran'#231'a)'
        'Croata (Cro'#225'cia)'
        'Croata (Latino, B'#243'snia e Herzegovina)'
        'Croata (Cro'#225'cia)'
        'Tcheco (Rep'#250'blica Tcheca)'
        'Dinamarqu'#234's (Dinamarca)'
        'Dari (Afeganist'#227'o)'
        'Divehi (Maldivas)'
        'Holand'#234's (B'#233'lgica)'
        'Holand'#234's (Pa'#237'ses Baixos)'
        'Ingl'#234's (Austr'#225'lia)'
        'Ingl'#234's (Belize)'
        'Ingl'#234's (Canad'#225')'
        'Ingl'#234's (Caribe)'
        'Ingl'#234's ('#205'ndia)'
        'Ingl'#234's (Irlanda)'
        'Ingl'#234's (Irlanda)'
        'Ingl'#234's (Jamaica)'
        'Ingl'#234's (Mal'#225'sia)'
        'Ingl'#234's (Nova Zel'#226'ndia)'
        'Ingl'#234's (Rep'#250'blica das Filipinas)'
        'Ingl'#234's (Cingapura)'
        'Ingl'#234's ('#193'frica do Sul)'
        'Ingl'#234's (Trinidad e Tobago)'
        'Ingl'#234's (Reino Unido)'
        'Ingl'#234's (Estados Unidos)'
        'Ingl'#234's (Zimb'#225'bue)'
        'Estoniano (Est'#244'nia)'
        'Faro'#234's (Ilhas Faro'#233's)'
        'Filipino (Filipinas)'
        'Finland'#234's (Finl'#226'ndia)'
        'Franc'#234's (B'#233'lgica)'
        'Franc'#234's (Canad'#225')'
        'Franc'#234's (Fran'#231'a)'
        'Franc'#234's (Luxemburgo)'
        'Franc'#234's (M'#244'naco)'
        'Franc'#234's (Su'#237#231'a)'
        'Frisian (Pa'#237'ses Baixos)'
        'Galego (Gal'#237'cia, Espanha)'
        'Georgiano (Ge'#243'rgia)'
        'Alem'#227'o ('#193'ustria)'
        'Alem'#227'o (Alemanha)'
        'Alem'#227'o (Liechtenstein)'
        'Alem'#227'o (Luxemburgo)'
        'Alem'#227'o (Su'#237#231'a)'
        'Grego (Gr'#233'cia)'
        'Groenland'#234's (Groenl'#226'ndia)'
        'Guzerate  ('#205'ndia)'
        'Hausa (Latino, Nig'#233'ria)'
        'Hebraico (Israel)'
        'H'#237'ndi ('#205'ndia)'
        'H'#250'ngaro (Hungria)'
        'Island'#234's (Isl'#226'ndia)'
        'Igbo (Nig'#233'ria)'
        'Indon'#233'sio (Indon'#233'sia)'
        'Inuktitut (Latino, Canad'#225')'
        'Inuktitut (Sil'#225'bico, Canad'#225')'
        'Irland'#234's (Irlanda)'
        'Italiano (It'#225'lia)'
        'Italiano (Su'#237#231'a)'
        'Japon'#234's (Jap'#227'o)'
        'Kannada ('#205'ndia)'
        'Cazaque (Cazaquist'#227'o)'
        'Khmer (Camboja)'
        'K'#39'iche (Guatemala)'
        'Quiniaruanda (Ruanda)'
        'Concani ('#205'ndia)'
        'Coreano (Cor'#233'ia)'
        'Quirgiz (Quirguist'#227'o)'
        'Laosiano (Rep'#250'blica Democr'#225'tica Popular do Laos)'
        'Let'#227'o (Let'#244'nia)'
        'Lituano (Litu'#226'nia)'
        'S'#243'rabo Inferior (Alemanha)'
        'Luxemburgu'#234's (Luxemburgo)'
        'Maced'#244'nio (Antiga Rep'#250'blica Iugoslava da Maced'#244'nia)'
        'Malaio (Brunei Darussalam)'
        'Malaio (Mal'#225'sia)'
        'Malaiala ('#205'ndia)'
        'Malt'#234's (Malta)'
        'Maori (Nova Zel'#226'ndia)'
        'Mapudungun  (Chile)'
        'Marata ('#205'ndia)'
        'Mohawk (Mohawk)'
        'Mongol (Cir'#237'lico, Mong'#243'lia)'
        'Mongol (Mongol Tradicional, Rep'#250'blica Popular da China)'
        'Nepal'#234's (Nepal)'
        'Noruegu'#234's, bokmal (Noruega)'
        'Noruegu'#234's, Nynorsk (Noruega)'
        'Occitan (Fran'#231'a)'
        'Ori'#225' ('#205'ndia)'
        'Pachto (Afeganist'#227'o)'
        'Persa'
        'Polon'#234's (Pol'#244'nia)'
        'Portugu'#234's (Brasil)'
        'Portugu'#234's (Portugal)'
        'Portugu'#234's (Portugal)'
        'Punjabi ('#205'ndia)'
        'Qu'#237'chua (Bol'#237'via)'
        'Qu'#237'chua (Equador)'
        'Qu'#237'chua (Peru)'
        'Romeno (Rom'#234'nia)'
        'Romanche (Su'#237#231'a)'
        'Russo (R'#250'ssia)'
        'Sami, Inari (Finl'#226'ndia)'
        'Sami, Lule (Noruega)'
        'Sami, Lule (Su'#233'cia)'
        'Sami, Norte (Finl'#226'ndia)'
        'Sami, Norte (Noruega)'
        'Sami, Norte (Su'#233'cia)'
        'Sami, Skolt (Finl'#226'ndia)'
        'Sami, Sul (Noruega)'
        'Sami, Sul (Su'#233'cia)'
        'S'#226'nscrito ('#205'ndia)'
        'S'#233'rvio (Latino, S'#233'rvia)'
        'S'#233'rvio (Latino, B'#243'snia e Herzegovina)'
        'S'#233'rvio (Cir'#237'lico, S'#233'rvia e Montenegro (Antiga))'
        'S'#233'rvio (Latino, S'#233'rvia e Montenegro (Antiga))'
        'Sesoto do Norte ('#193'frica do Sul)'
        'Setsuana ('#193'frica do Sul)'
        'Cingal'#234's (Sri Lanka)'
        'Eslovaco (Eslov'#225'quia)'
        'Esloveno (Eslov'#234'nia)'
        'Espanhol (Argentina)'
        'Espanhol (Bol'#237'via)'
        'Espanhol (Chile)'
        'Espanhol (Col'#244'mbia)'
        'Espanhol (Costa Rica)'
        'Espanhol (Rep'#250'blica Dominicana)'
        'Espanhol (Equador)'
        'Espanhol (El Salvador)'
        'Espanhol (Guatemala)'
        'Espanhol (Honduras)'
        'Espanhol (M'#233'xico)'
        'Espanhol (Nicar'#225'gua)'
        'Espanhol (Panam'#225')'
        'Espanhol (Paraguai)'
        'Espanhol (Peru)'
        'Espanhol (Porto Rico)'
        'Espanhol (Espanha- internacional)'
        'Espanhol (Uruguai)'
        'Espanhol (Rep'#250'blica Bolivariana da Venezuela)'
        'Quissua'#237'le (Qu'#234'nia)'
        'Sueco (Finl'#226'ndia)'
        'Sueco (Su'#233'cia)'
        'Sueco (Su'#233'cia)'
        'S'#237'rio (S'#237'ria)'
        'Tajik Cir'#237'lico, Tadgiquist'#227'o)'
        'Tamazight (Latino, Arg'#233'lia)'
        'T'#226'mil ('#205'ndia)'
        'T'#225'rtaro (R'#250'ssia)'
        'Telugu ('#205'ndia)'
        'Tailand'#234's (Tail'#226'ndia)'
        'Tibetano (Rep'#250'blica Popular da China)'
        'Turco (Turquia)'
        'Turcomeno (Turcomenist'#227'o)'
        'Uigur (Rep'#250'blica Popular da China)'
        'Ucraniano (Ucr'#226'nia)'
        'Sor'#225'bio Superior (Alemanha)'
        'Urdu (Rep'#250'blica Isl'#226'mica do Paquist'#227'o)'
        'Uzbeque (Cir'#237'lico, Uzbequist'#227'o)'
        'Uzbeque (Latino, Uzbequist'#227'o)'
        'Vietnamita (Vietn'#227')'
        'Gal'#234's (Reino Unido)'
        'U'#243'lofe (Senegal)'
        'isiXhosa ('#193'frica do Sul)'
        'Yakut (R'#250'ssia)'
        'Yi (Rep'#250'blica Popular da China)'
        'Ioruba (Nig'#233'ria)'
        'isiZulu ('#193'frica do Sul)')
    end
    object edtDefinirNomeRes: TEdit
      Left = 197
      Top = 48
      Width = 232
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'Escolha nome para o arquivo...'
      OnEnter = edtDefinirNomeResEnter
      OnExit = edtDefinirNomeResExit
      OnKeyUp = edtDefinirNomeResKeyUp
    end
    object edtAdicionarInclude: TEdit
      Left = 197
      Top = 77
      Width = 232
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Text = 'Selecione o diret'#243'rio a ser adicionado...'
      OnEnter = edtAdicionarIncludeEnter
      OnExit = edtAdicionarIncludeExit
      OnKeyUp = edtAdicionarIncludeKeyUp
    end
    object edtNomeDefine: TEdit
      Left = 197
      Top = 107
      Width = 99
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Text = 'Nome'
      OnEnter = edtNomeDefineEnter
      OnExit = edtNomeDefineExit
      OnKeyUp = edtNomeDefineKeyUp
    end
    object edtStringDefine: TEdit
      Left = 309
      Top = 107
      Width = 145
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Text = 'String'
      OnEnter = edtStringDefineEnter
      OnExit = edtStringDefineExit
      OnKeyUp = edtStringDefineKeyUp
    end
    object btnAdicionarInclude: TBitBtn
      Left = 429
      Top = 75
      Width = 25
      Height = 25
      Caption = '...'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnAdicionarIncludeClick
    end
    object btnDefinirNomeRes: TBitBtn
      Left = 429
      Top = 46
      Width = 25
      Height = 25
      Caption = '...'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnDefinirNomeResClick
    end
    object cbxExibirLog: TCheckBox
      Left = 197
      Top = 259
      Width = 252
      Height = 17
      Caption = 'Exibir log do compilador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
    end
    object cbxApagarRC: TCheckBox
      Left = 197
      Top = 277
      Width = 252
      Height = 17
      Caption = 'Apagar arquivo *.RC ap'#243's compila'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
    end
  end
  object btnAplicarParametros: TBitBtn
    Left = 363
    Top = 313
    Width = 108
    Height = 25
    Hint = 'Aplicar altera'#231#245'es e sair.'
    Anchors = [akRight, akBottom]
    Caption = 'Aplicar Altera'#231#245'es'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnAplicarParametrosClick
  end
  object btnCancelar: TBitBtn
    Left = 286
    Top = 313
    Width = 75
    Height = 25
    Hint = 'Cancelar altera'#231#245'es.'
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btnLimparParametros: TBitBtn
    Left = 9
    Top = 313
    Width = 111
    Height = 25
    Hint = 'Limpar par'#226'metros aplicados.'
    Anchors = [akLeft, akBottom]
    Caption = 'Limpar Par'#226'metros'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnLimparParametrosClick
  end
  object opnParametros: TOpenDialog
    Left = 123
    Top = 316
  end
  object savParametros: TSaveDialog
    Left = 163
    Top = 316
  end
end
