unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrios1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    Categorias1: TMenuItem;
    Produtos1: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    Vendas1: TMenuItem;
    Clientes1: TMenuItem;
    N3: TMenuItem;
    Produtos2: TMenuItem;
    N4: TMenuItem;
    VendaporData1: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria;

procedure TfrmPrincipal.Categorias1Click(Sender: TObject);
begin
    frmCadCategoria := TfrmCadCategoria.Create(Self);
    frmCadCategoria.ShowModal;
    frmCadCategoria.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FreeAndNil(TeclaEnter);
    FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    dtmPrincipal := TdtmPrincipal.Create(Self);
    with dtmPrincipal.ConexaoDB do 
    begin
      SQLHourGlass := True;
      Protocol := 'mssql';
      LibraryLocation := 'D:\Projetos\Delphi\Projeto Curso\ntwdblib.dll';
      HostName := '.\SERVERCURSO';
      Port := 1433;
      User := 'sa';
      Password := 'mudar@123';
      Database := 'vendas';
      Connected := True;
    end;

    TeclaEnter := TMREnter.Create(Self);
    TeclaEnter.FocusEnabled := True;
    TeclaEnter.FocusColor := clInfoBk;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
    Close;
end;

end.
