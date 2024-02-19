inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientWidth = 761
  ExplicitWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 761
    ActivePage = tabManutencao
    ExplicitWidth = 761
    inherited tabListagem: TTabSheet
      ExplicitWidth = 753
      inherited Panel1: TPanel
        Width = 753
        ExplicitWidth = 753
      end
      inherited grdListagem: TDBGrid
        Width = 753
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 753
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 24
        Width = 135
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        TextHint = 'C'#243'digo da Categoria'
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 72
        Width = 250
        Height = 21
        EditLabel.Width = 111
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o da Categoria'
        MaxLength = 30
        TabOrder = 1
        TextHint = 'Descri'#231#227'o da Categoria'
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 761
    ExplicitWidth = 761
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 682
      ExplicitLeft = 682
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM categorias')
    object codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      ReadOnly = True
    end
    object descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
