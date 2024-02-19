unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, cCadCategoria, uDTMConexao, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    codigo: TIntegerField;
    descricao: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria: TCategoria;

    function Apagar: Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

{$REGION 'Apagar e Gravar'}

function TfrmCadCategoria.Apagar: Boolean;
begin
    if (oCategoria.Selecionar(QryListagem.FieldByName('id').AsInteger)) then begin
        Result := oCategoria.Apagar;
    end;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
    if (edtCategoriaId.Text <> EmptyStr) then begin
        oCategoria.codigo := StrToInt(edtCategoriaId.Text);
    end
    else begin
      oCategoria.codigo := 0;
    end;

    oCategoria.descricao := edtDescricao.Text;

    if (EstadoDoCadastro = ecInserir) then begin
        Result := oCategoria.Inserir;
    end
    else if (EstadoDoCadastro = ecAlterar) then begin
        Result := oCategoria.Atualizar;
    end;
end;

{$ENDREGION}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if (oCategoria.Selecionar(QryListagem.FieldByName('id').AsInteger)) then begin
      edtCategoriaId.Text := IntToStr(oCategoria.codigo);
      edtDescricao.Text := oCategoria.descricao;
  end
  else begin
      btnCancelar.Click;
      Abort;
  end;

  inherited;
end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    inherited;

    if Assigned(oCategoria) then begin
        FreeAndNil(oCategoria);
    end;
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
    inherited;
    oCategoria := TCategoria.Create(dtmPrincipal.ConexaoDB);
    IndiceAtual := 'descricao';
end;

end.
