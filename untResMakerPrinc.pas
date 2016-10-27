unit untResMakerPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, Menus, ShellAPI, ExtCtrls,ShlObj,
  ImgList;

type
  TfrmResmaker = class(TForm)
    popListaResources: TPopupMenu;
    menAdicionarArquivos: TMenuItem;
    menRemoverItens: TMenuItem;
    menLimparLista: TMenuItem;
    N1: TMenuItem;
    menCriarResource: TMenuItem;
    menCompilaRC: TMenuItem;
    savCriarResource: TSaveDialog;
    opnAdicionarArquivos: TOpenDialog;
    opnCompilarRC: TOpenDialog;
    menuPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    Compilar1: TMenuItem;
    Ajuda1: TMenuItem;
    AdicionarArquivos1: TMenuItem;
    Removeritensselecionados1: TMenuItem;
    Limparlistadearquivos1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    CriarResource1: TMenuItem;
    CompilarArquivoRC1: TMenuItem;
    Contedo1: TMenuItem;
    Sobre1: TMenuItem;
    Alterarparmetrosdocompilador1: TMenuItem;
    pnlJanelaPrincipal: TPanel;
    gbxListaArquivos: TGroupBox;
    lvwListaResources: TListView;
    pnlInferior: TPanel;
    pnlBotoes: TPanel;
    btnCriarResource: TSpeedButton;
    btnAdicionarArquivo: TSpeedButton;
    btnRemoverArquivo: TSpeedButton;
    gbxEditarResource: TGroupBox;
    lblNomeResource: TLabel;
    lblTipoResource: TLabel;
    edtNomeResource: TEdit;
    edtTipoResource: TEdit;
    pnlBotaoAtualizar: TPanel;
    btnEditarResource: TSpeedButton;
    pnlLogCompilador: TPanel;
    lblLogCompilador: TLabel;
    btnFecharLog: TSpeedButton;
    memLogCompilador: TMemo;
    bvlTopoLog: TBevel;
    menParametros: TMenuItem;
    function ExtrairExeDoResource(TipoResouce, NomeResource, NomeSalvarRes: String): Boolean;
    procedure CriarArquivoRC;
    procedure CompilarRES(ArquivoRC: String);

    procedure btnCriarResourceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarArquivoClick(Sender: TObject);
    procedure lvwListaResourcesClick(Sender: TObject);
    procedure btnEditarResourceClick(Sender: TObject);
    procedure lvwListaResourcesEnter(Sender: TObject);
    procedure btnRemoverArquivoClick(Sender: TObject);
    procedure lvwListaResourcesKeyPress(Sender: TObject; var Key: Char);
    procedure menAdicionarArquivosClick(Sender: TObject);
    procedure menRemoverItensClick(Sender: TObject);
    procedure menLimparListaClick(Sender: TObject);
    procedure menCriarResourceClick(Sender: TObject);
    procedure menCompilaRCClick(Sender: TObject);
    procedure gbxListaArquivosMouseEnter(Sender: TObject);
    procedure lvwListaResourcesMouseEnter(Sender: TObject);
    procedure lvwListaResourcesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvwListaResourcesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwListaResourcesColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lvwListaResourcesCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure AdicionarArquivos1Click(Sender: TObject);
    procedure Removeritensselecionados1Click(Sender: TObject);
    procedure Limparlistadearquivos1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure CriarResource1Click(Sender: TObject);
    procedure CompilarArquivoRC1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Alterarparmetrosdocompilador1Click(Sender: TObject);
    procedure btnFecharLogClick(Sender: TObject);
    procedure menParametrosClick(Sender: TObject);
    procedure popListaResourcesPopup(Sender: TObject);
    procedure Contedo1Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lvwListaResourcesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtNomeResourceKeyPress(Sender: TObject; var Key: Char);
    procedure edtTipoResourceKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResmaker: TfrmResmaker;
  SalvarEm, PathArquivoTempRC, PathCopiarRC, NomeSalvarRC, PathBrcc32: String;
  IndiceColunaLista : Integer = 0;
  OrdemAscendente: Boolean = True;

implementation

uses untSobre, untParametros;

{$R *.dfm}
{$R BRCC32.RES}


procedure TfrmResmaker.Sair1Click(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfrmResmaker.Sobre1Click(Sender: TObject);
begin
     frmSobre.Show;
end;

//PEGAR O PATCH DA AREA DE TRABALHO...
function PathAreaDeTrabalho: String;
var
   SFolder :  pItemIDList;
   PathDesktop: array[0..MAX_PATH] Of Char;
begin
     SHGetSpecialFolderLocation(Application.Handle, CSIDL_DESKTOPDIRECTORY, SFolder);
     SHGetPathFromIDList(SFolder, PathDesktop);
     Result := StrPas(PathDesktop);
end;

/// executar MS-DOS e pegar a saida
function MsDosRemoto(Comando: string; DirDeExecucao: string): string;
var
   SA: TSecurityAttributes;
   SI: TStartupInfo;
   PI: TProcessInformation;
   StdOutPipeRead, StdOutPipeWrite: THandle;
   WasOK: Boolean;
   Buffer: array[0..255] of AnsiChar;
   BytesRead: Cardinal;
   WorkDir: string;
   Handle: Boolean;
begin
     Result := '';
     with SA do
     begin
          nLength := SizeOf(SA);
          bInheritHandle := True;
          lpSecurityDescriptor := nil;
     end;
     CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
     try
        with SI do
        begin
             FillChar(SI, SizeOf(SI), 0);
             cb := SizeOf(SI);
             dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
             wShowWindow := SW_HIDE;
             hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
             hStdOutput := StdOutPipeWrite;
             hStdError := StdOutPipeWrite;
        end;
        WorkDir := DirDeExecucao;
        Handle := CreateProcess(nil, PChar('cmd.exe /C' + Comando), nil, nil,
                                True, 0, nil, PChar(WorkDir), SI, PI);
        CloseHandle(StdOutPipeWrite);
        if Handle then
        try
           repeat
           WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
           if BytesRead > 0 then
           begin
                Buffer[BytesRead] := #0;
                Result := Result + Buffer;
           end;
           until not WasOK or (BytesRead = 0);
                 WaitForSingleObject(PI.hProcess, INFINITE);
        finally
               CloseHandle(PI.hThread);
               CloseHandle(PI.hProcess);
        end;
     finally
            CloseHandle(StdOutPipeRead);
     end;
end;

//EXTRAIR O EXECUT�VEL DO COMPILADOR DE DENTRO DO EXE
function TfrmResmaker.ExtrairExeDoResource(TipoResouce, NomeResource, NomeSalvarRes: string): Boolean;
var
   Resource: TResourceStream;
begin
     Result := False;
     Resource := TResourceStream.Create(Hinstance, NomeResource, PChar(TipoResouce));
     try
        Resource.SavetoFile(NomeSalvarRes);
        Result := True;
     finally
            Resource.Free;
     end;
end;

//////MOVER ARQUIVO OU PASTA
function Mover(Origem, Destino: String): Boolean;
var
  ShellInfo: TSHFileOpStruct;
begin
     Result := False;
     if DirectoryExists(Origem) or FileExists(Origem) then
     begin
          with ShellInfo do
          begin
               Wnd := 0;
               wFunc := FO_MOVE;
               pFrom := PChar(Origem + #0);
               pTo := PChar(Destino + #0);
               fFlags := FOF_NOERRORUI + FOF_NOCONFIRMATION + FOF_NOCONFIRMMKDIR +
                         FOF_NO_UI + FOF_RENAMEONCOLLISION;
          end;
          if SHFileOperation(ShellInfo) = 0 then
             Result := True;
     end;
end;

//Renomear arquivo ou pasta
function Renomear(Original, NovoNome: String): Boolean;
var
  ShellInfo: TSHFileOpStruct;
begin
     Result := False;
     if DirectoryExists(Original) or FileExists(Original) then
     begin
     with ShellInfo do
     begin
          Wnd := 0;
          wFunc := FO_RENAME;
          pFrom := PChar(Original + #0);
          pTo := PChar(NovoNome + #0);
          fFlags := FOF_NOERRORUI or FOF_NOCONFIRMATION or FOF_NO_UI;
     end;
    // Teste :=  SHFileOperation(ShellInfo);
     if SHFileOperation(ShellInfo) = 0 then
        Result := True
  end;
end;

procedure TfrmResmaker.FormCreate(Sender: TObject);
begin
     PathArquivoTempRC := ExtractFileDir(Application.ExeName)+'\TempRC.txt';
     btnRemoverArquivo.Enabled := lvwListaResources.Selected <> nil;
end;

procedure TfrmResmaker.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     btnRemoverArquivo.Enabled := lvwListaResources.Selected <> nil;
end;

procedure TfrmResmaker.gbxListaArquivosMouseEnter(Sender: TObject);
begin
     case lvwListaResources.Items.Count of
          0: gbxListaArquivos.Hint := 'Nenhum Arquivo|Lista de Arquivos - Vazia';
          1: gbxListaArquivos.Hint := 'Um Arquivo|Lista de Arquivos - Um Arquivo';
          else
              gbxListaArquivos.Hint :=  IntToStr(lvwListaResources.Items.Count) + ' Arquivos|Lista de Arquivos - '+ IntToStr(lvwListaResources.Items.Count) + ' Arquivos';
     end;
end;

procedure TfrmResmaker.Limparlistadearquivos1Click(Sender: TObject);
begin
     menLimparLista.Click;
end;

procedure TfrmResmaker.lvwListaResourcesChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
     btnRemoverArquivo.Enabled := lvwListaResources.Selected <> nil;
end;

procedure TfrmResmaker.lvwListaResourcesClick(Sender: TObject);
begin
     if lvwListaResources.Selected = nil then
     begin
          edtNomeResource.Text := '';
          edtTipoResource.Text := '';
          btnEditarResource.Enabled := False;
          edtNomeResource.ReadOnly := True;
          edtTipoResource.ReadOnly := True;
          menRemoverItens.Enabled := False;
          Removeritensselecionados1.Enabled := False;
          exit;
     end;
     btnRemoverArquivo.Enabled := lvwListaResources.Selected <> nil;
     menRemoverItens.Enabled := btnRemoverArquivo.Enabled;
     Removeritensselecionados1.Enabled := btnRemoverArquivo.Enabled;
     if lvwListaResources.SelCount = 1 then
     begin
          btnEditarResource.Enabled := True;
          edtNomeResource.Text := lvwListaResources.Selected.Caption;
          edtTipoResource.Text := lvwListaResources.Selected.SubItems[0];
          edtNomeResource.ReadOnly := False;
          edtTipoResource.ReadOnly := False;
     end
     else
     begin
          edtNomeResource.Text := '';
          edtTipoResource.Text := '';
          btnEditarResource.Enabled := False;
          edtNomeResource.ReadOnly := True;
          edtTipoResource.ReadOnly := True;
     end;
end;
////////////     ORDENAR LISTVIEW....
procedure TfrmResmaker.lvwListaResourcesColumnClick(Sender: TObject;
  Column: TListColumn);
begin
     if Column.Index < 2 then
     begin
          // Se a coluna clicada eh a mesma que ja esta, inverte a ordem
          if IndiceColunaLista = Column.Index then
          begin
               OrdemAscendente := not(OrdemAscendente);
               lvwListaResources.AlphaSort;
          end
          // Se a coluna for diferente da clicada anteriormente
          else
          begin
               OrdemAscendente := True;
               IndiceColunaLista := Column.Index;
               lvwListaResources.AlphaSort;
          end;
     end;
end;

procedure TfrmResmaker.lvwListaResourcesCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
     // Para reorganizar o ListView de acordo com a coluna clicada
     if IndiceColunaLista = 0 then
     begin
          // Organiza��o pelo caption do item de acordo com a ordem ascendente ou não
          if OrdemAscendente then
             Compare := CompareText(Item1.Caption, Item2.Caption)
          else
              Compare:= CompareText(Item2.Caption, Item1.Caption);
     end
     else
     begin
          // Organiza��o pelos subitems, tb de acordo com a ordem ascendente ou não
          if OrdemAscendente then
             Compare:= CompareText(Item1.SubItems[IndiceColunaLista - 1], Item2.SubItems[IndiceColunaLista - 1])
          else
               Compare:= CompareText(Item2.SubItems[IndiceColunaLista - 1], Item1.SubItems[IndiceColunaLista - 1]);
     end;
end;
///////////

procedure TfrmResmaker.lvwListaResourcesEnter(Sender: TObject);
begin
     btnRemoverArquivo.Enabled := lvwListaResources.Selected <> nil;
end;

procedure TfrmResmaker.lvwListaResourcesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_DELETE then
     begin
          if lvwListaResources.Selected <> nil then
             btnRemoverArquivo.Click;
     end;
end;

procedure TfrmResmaker.lvwListaResourcesKeyPress(Sender: TObject;
  var Key: Char);
var
   CaracteresPermitidos: set of Char;
begin
     CaracteresPermitidos := ['A'..'Z', 'a'..'z', '_'];
     if lvwListaResources.Selected = nil then
        exit;
     if lvwListaResources.IsEditing then
     begin
          if Key in CaracteresPermitidos then
             Key := UpCase(Key)
          else
              Key := #0;
     end
end;

procedure TfrmResmaker.lvwListaResourcesMouseEnter(Sender: TObject);
begin
     lvwListaResources.Hint := gbxListaArquivos.Hint;
end;

procedure TfrmResmaker.lvwListaResourcesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     btnRemoverArquivo.Enabled := lvwListaResources.Selected <> nil;
end;

procedure TfrmResmaker.menAdicionarArquivosClick(Sender: TObject);
begin
     btnAdicionarArquivo.Click;
end;

procedure TfrmResmaker.menCompilaRCClick(Sender: TObject);
begin
     if opnCompilarRC.Execute then
     begin
          SalvarEm := ExtractFileDir(opnCompilarRC.FileName)+'\';
          if not DirectoryExists(ExtractFileDir(SalvarEm)) then
             ForceDirectories(ExtractFileDir(SalvarEm));
          if ExtrairExeDoResource('EXEFILE', 'COMPILAR', SalvarEm+'brcc32.exe') then
             PathBrcc32 := SalvarEm+'brcc32.exe';
          NomeSalvarRC := opnCompilarRC.FileName;
          Sleep(100);
          CompilarRES(NomeSalvarRC);
     end;
end;

procedure TfrmResmaker.menCriarResourceClick(Sender: TObject);
begin
     btnCriarResource.Click;
end;

procedure TfrmResmaker.menLimparListaClick(Sender: TObject);
begin
     lvwListaResources.Clear;
     menLimparLista.Enabled := False;
     menCriarResource.Enabled := False;
     Limparlistadearquivos1.Enabled := False;
     CriarResource1.Enabled := False;
     menRemoverItens.Enabled := False;
     Removeritensselecionados1.Enabled := False;
end;

procedure TfrmResmaker.menParametrosClick(Sender: TObject);
begin
     Alterarparmetrosdocompilador1.Click;
end;

procedure TfrmResmaker.menRemoverItensClick(Sender: TObject);
begin
     btnRemoverArquivo.Click;
end;

procedure TfrmResmaker.popListaResourcesPopup(Sender: TObject);
begin
     menCriarResource.Enabled := btnCriarResource.Enabled;
     menRemoverItens.Enabled := btnRemoverArquivo.Enabled;

     menLimparLista.Enabled := lvwListaResources.Items.Count > 0;
     menParametros.Checked := Alterarparmetrosdocompilador1.Checked;
end;

procedure TfrmResmaker.Removeritensselecionados1Click(Sender: TObject);
begin
     btnRemoverArquivo.Click;
end;

///////////////////////    CRIAR ARQUIVO RC   //////////////////////////////////
procedure TfrmResmaker.CriarArquivoRC;
var
   ArquivoTempRC: TextFile;
   i: Integer;
begin
     NomeSalvarRC := savCriarResource.FileName;
     SalvarEm := ExtractFileDir(savCriarResource.FileName) + '\';
     if not DirectoryExists(ExtractFileDir(SalvarEm)) then
        ForceDirectories(ExtractFileDir(SalvarEm));
     if ExtrairExeDoResource('EXEFILE', 'COMPILAR', SalvarEm+'\brcc32.exe') then
        PathBrcc32 := SalvarEm+'brcc32.exe';
     //Criar arquivo RC
     AssignFile(ArquivoTempRC, PathArquivoTempRC);
     Rewrite(ArquivoTempRC) ;
     Sleep(100);
     if FileExists(PathArquivoTempRC) then
     begin
          for i := 0 to lvwListaResources.Items.Count - 1 do
          begin
               Writeln(ArquivoTempRC, lvwListaResources.Items[i].Caption + '   ' + lvwListaResources.Items[i].SubItems[0] + '   "' + lvwListaResources.Items[i].SubItems[1]+'"');
          end;
          CloseFile(ArquivoTempRC);
     end;
     Sleep(100);
     if not Renomear(PathArquivoTempRC, ExtractFileDir(PathArquivoTempRC)+'\'+ExtractFileName(NomeSalvarRC))then
     begin
          MessageDlg('Erro ao renomear arquivo .RC!!!', mtError, [mbOK], 0);
     end
     else
         PathCopiarRC := ExtractFileDir(PathArquivoTempRC)+'\'+ExtractFileName(NomeSalvarRC);
     if Mover(PathCopiarRC, SalvarEm) then
     begin
          NomeSalvarRC := ExtractFileDir(SalvarEm)+'\'+ExtractFileName(NomeSalvarRC);
     end
     else
         MessageDlg('Erro ao criar arquivo .RC!!!', mtError, [mbOK], 0);
end;

procedure TfrmResmaker.CriarResource1Click(Sender: TObject);
begin
     btnCriarResource.Click;
end;

procedure TfrmResmaker.edtNomeResourceKeyPress(Sender: TObject; var Key: Char);
var
   CaracteresPermitidos: set of Char;
begin
     CaracteresPermitidos := ['A'..'Z', 'a'..'z', '_'];
     if Key in CaracteresPermitidos then
        Key := UpCase(Key)
     else
         Key := #0;
end;

procedure TfrmResmaker.edtTipoResourceKeyPress(Sender: TObject; var Key: Char);
var
   CaracteresPermitidos: set of Char;
begin
     CaracteresPermitidos := ['A'..'Z', 'a'..'z', '_'];
     if Key in CaracteresPermitidos then
        Key := UpCase(Key)
     else
         Key := #0;
end;

procedure TfrmResmaker.CompilarArquivoRC1Click(Sender: TObject);
begin
     menCompilaRC.Click;
end;
//////////////////////////   COMPILAR ARQUIVO RES  /////////////////////////////
procedure TfrmResmaker.CompilarRES(ArquivoRC: String);
var
   RetornoCompilacao, ComandoCompila��o, ResCriado: String;
   i: Integer;
begin
     ComandoCompila��o := '""'+PathBrcc32+'"'+ frmParametros.ParametrosCompilador +' "'+NomeSalvarRC+'""';
     ResCriado :=  Copy(frmParametros.ParametrosCompilador, Pos('-fo "', frmParametros.ParametrosCompilador)+ 6, Pos('-fo "', frmParametros.ParametrosCompilador));
     if Pos('-fo "', frmParametros.ParametrosCompilador) <> 0 then
     begin
          if Copy(frmParametros.ParametrosCompilador, Pos('-fo "', frmParametros.ParametrosCompilador)+ 6, Pos('-fo "', frmParametros.ParametrosCompilador)) = ':\'  then
             ResCriado := Copy(frmParametros.ParametrosCompilador, Pos('-fo ', frmParametros.ParametrosCompilador)+ 5, Pos('.RES', frmParametros.ParametrosCompilador) -3)
          else
              ResCriado := ExtractFileDir(NomeSalvarRC)+ '\' + Copy(frmParametros.ParametrosCompilador, Pos('-fo ', frmParametros.ParametrosCompilador)+5, Pos('.RES', frmParametros.ParametrosCompilador)-3);
     end
     else
         ResCriado := ExtractFileDir(NomeSalvarRC) +'\'+ Copy(ExtractFileName(NomeSalvarRC), 0, Pos(ExtractFileExt(NomeSalvarRC), ExtractFileName(NomeSalvarRC))-1) +'.RES';

     //ShowMessage(ResCriado);
     RetornoCompilacao := MsDosRemoto(ComandoCompila��o, SalvarEm);
     Delete(RetornoCompilacao, 1, 111);
     if Pos(#13#10, RetornoCompilacao) <> 0  then
        Delete(RetornoCompilacao, Pos(#13#10, RetornoCompilacao), Pos(#13#10, RetornoCompilacao) + 4);
     if Pos('.RC', RetornoCompilacao) <> 0 then
        Delete(RetornoCompilacao, 1, Pos('.RC', RetornoCompilacao) + 3);
     Sleep(200);
     if not FileExists(ResCriado) then
     begin
          for i := 0 to 10 do
          begin
               Sleep(300);
          end;
          if FileExists(PathBrcc32) then
             DeleteFile(PathBrcc32);
          if frmParametros.cbxExibirLog.Checked then
          begin
               pnlLogCompilador.Visible := True;
               memLogCompilador.Font.Color := clRed;
               memLogCompilador.Lines.Text := RetornoCompilacao;
               memLogCompilador.Lines.Add(#13+'Ocorreu um erro ao criar resource!!!');
          end;
          MessageBox(Application.Handle, PChar('Ocorreu um erro ao criar resource!!!'+#13#13+RetornoCompilacao), 'Erro ao criar Resource', MB_OK+MB_ICONERROR);
     end
     else
     begin
          if FileExists(PathBrcc32) then
             DeleteFile(PathBrcc32);
          SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil); //Atualizar �rea de trabalho
          if frmParametros.cbxExibirLog.Checked then
          begin
               pnlLogCompilador.Visible := True;
               memLogCompilador.Font.Color := clGreen;
               memLogCompilador.Lines.Text := RetornoCompilacao;
               memLogCompilador.Lines.Add(#13#13+'Resource criado com sucesso!!!');
          end;
          MessageBox(Application.Handle,'Resource criado com sucesso!!!', 'Resource criado com sucesso', MB_OK+MB_ICONINFORMATION);
          lvwListaResources.Clear;
     end;
     if frmParametros.cbxApagarRC.Checked then
     begin
          if FileExists(NomeSalvarRC) then
             DeleteFile(NomeSalvarRC);
     end;
end;

procedure TfrmResmaker.Contedo1Click(Sender: TObject);
begin
     Application.MessageBox('A ajuda deste programa ainda n�o foi implementada.', 'Informa��o', MB_ICONINFORMATION);
end;

procedure TfrmResmaker.AdicionarArquivos1Click(Sender: TObject);
begin
     btnAdicionarArquivo.Click;
end;

procedure TfrmResmaker.Alterarparmetrosdocompilador1Click(Sender: TObject);
begin
     frmParametros.Show;
end;

procedure TfrmResmaker.btnAdicionarArquivoClick(Sender: TObject);
var
   i, j: Integer;
   ItemListaRes: TListItem;
   NomeRes, TipoRes, BufferRes: String;
   CaracteresPermitidos: set of Char;
begin
     CaracteresPermitidos := ['a'..'z', 'A'..'Z', '_'];
     if opnAdicionarArquivos.Execute then
     begin
          for i := 0 to opnAdicionarArquivos.Files.Count - 1 do
          begin
               if LowerCase(ExtractFileExt(opnAdicionarArquivos.Files[i])) = '.lnk' then
                  opnAdicionarArquivos.Files[i] := '';
          end;
          for i := 0 to opnAdicionarArquivos.Files.Count -1 do
          begin
               //Criar nome do Resource
               NomeRes := ExtractFileName(opnAdicionarArquivos.Files[i]);
               NomeRes := Copy(NomeRes, 0, Pos(ExtractFileExt(NomeRes), NomeRes) - 1);
               for j := 1 to Length(NomeRes) do
               begin
                    //remover espa�os e acentos e mudar para maiusulas
                    case NomeRes[j] of
                         //N�o fa�a nada
                         'A'..'Z': ;
                         //Mude para mai�scula
                         'a'..'z': Dec(NomeRes[j], Ord('a')-Ord('A'));
                         //Remova os acentos e mude para maiuscula
                         '�', '�', '�', '�', '�',
                         '�', '�', '�', '�', '�': NomeRes[j] := 'A';
                         '�', '�', '�', '�',
                         '�', '�', '�', '�': NomeRes[j] := 'E';
                         '�', '�', '�', '�',
                         '�', '�', '�', '�': NomeRes[j] := 'I';
                         '�', '�', '�', '�', '�',
                         '�', '�', '�', '�', '�': NomeRes[j] := 'O';
                         '�', '�', '�', '�',
                         '�', '�', '�', '�': NomeRes[j] := 'U';
                         '�', '�': NomeRes[j] := 'C';
                         '�', '�': NomeRes[j] := 'N';
                         '-', ' ':  NomeRes[j] := '_';
                    end;
               end;
               //REMOVER CARACTERES ESPECIAIS
               BufferRes := '';
               for j := 1 to Length(NomeRes) do
               begin
                    if NomeRes[j] in CaracteresPermitidos then
                       BufferRes := BufferRes + NomeRes[j];
               end;
               NomeRes := BufferRes;
               //AUMENTAR NOME DO RESOURCE SE FOR MUITO CURTO
               if (Length(NomeRes) < 5) and (NomeRes <> '') then
                  NomeRes := 'RESMAKER_'+ NomeRes;

               if Length(NomeRes) > 30 then
               begin
                    Delete(NomeRes, 30, Length(NomeRes));
               end;
               //Criar Tipo do Resource
               TipoRes := ExtractFileName(opnAdicionarArquivos.Files[i]);
               TipoRes := Copy(TipoRes, Pos(ExtractFileExt(TipoRes), TipoRes)+ 1, Length(TipoRes));
               TipoRes := UpperCase(TipoRes);
               if TipoRes = 'BMP' then
                  TipoRes := 'BITMAP';
               if TipoRes = 'ICO' then
                  TipoRes := 'ICON';
               if TipoRes = 'EXE' then
                  TipoRes := 'EXEFILE';
               //ADICIONAR NA LISTA...
               if NomeRes <> '' then
               begin
                    ItemListaRes := lvwListaResources.Items.Add;
                    ItemListaRes.Caption := NomeRes;
                    ItemListaRes.SubItems.Add(TipoRes);
                    //Patch do Arquivo
                    ItemListaRes.SubItems.Add(opnAdicionarArquivos.Files[i]);
               end;
          end;
          if lvwListaResources.Items.Count > 0 then
          begin
               btnCriarResource.Enabled := True;
               menCriarResource.Enabled := True;
               CriarResource1.Enabled := True;
               Limparlistadearquivos1.Enabled := True;
               menLimparLista.Enabled := True;
          end;
     end;
end;

procedure TfrmResmaker.btnCriarResourceClick(Sender: TObject);
var
   i, NumArqRC: Integer;
begin
     savCriarResource.InitialDir := PathAreaDeTrabalho;
     NumArqRC := 1;
     if not FileExists(PathAreaDeTrabalho+'\Novo Resource.RC') then
        savCriarResource.FileName := 'Novo Resource'
     else
     begin
          repeat
                if FileExists(PathAreaDeTrabalho+'\Novo Resource ('+IntToStr(NumArqRC)+').RC') then
                   NumArqRC := NumArqRC + 1;
          until
               not FileExists(PathAreaDeTrabalho+'\Novo Resource ('+IntToStr(NumArqRC)+').RC');
          savCriarResource.FileName := 'Novo Resource ('+IntToStr(NumArqRC)+')';
     end;
     if savCriarResource.Execute then
     begin
          CriarArquivoRC;
          Sleep(300);
          for i := 0 to 10 do
          if not FileExists(NomeSalvarRC) then
             Sleep(100)
          else
          begin
               CompilarRES(NomeSalvarRC);
               exit;
          end;
     end;
end;

procedure TfrmResmaker.btnEditarResourceClick(Sender: TObject);
begin
     if lvwListaResources.Selected = nil then
        exit;
     lvwListaResources.Selected.Caption := edtNomeResource.Text;
     lvwListaResources.Selected.SubItems[0] := edtTipoResource.Text;
end;

procedure TfrmResmaker.btnFecharLogClick(Sender: TObject);
begin
     pnlLogCompilador.Visible := False;
end;

procedure TfrmResmaker.btnRemoverArquivoClick(Sender: TObject);
begin
     if lvwListaResources.Selected <> nil then
        lvwListaResources.DeleteSelected ;
     if lvwListaResources.Items.Count < 1 then
     begin
          btnCriarResource.Enabled := False;
          menCriarResource.Enabled := False;
          CriarResource1.Enabled := False;
          btnRemoverArquivo.Enabled := False;
          menRemoverItens.Enabled := False;
          Removeritensselecionados1.Enabled := False;
          menLimparLista.Enabled := False;
          Limparlistadearquivos1.Enabled := False;
     end;
end;

end.
