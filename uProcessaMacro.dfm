object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Gerador de modelos'
  ClientHeight = 613
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 338
    Width = 787
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 354
    ExplicitWidth = 259
  end
  object Panel2: TPanel
    Left = 0
    Top = 341
    Width = 787
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 344
    DesignSize = (
      787
      35)
    object Button4: TButton
      Left = 688
      Top = 4
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Enviar para...'
      TabOrder = 0
      OnClick = Button4Click
    end
    object Items: TComboBox
      Left = 8
      Top = 6
      Width = 172
      Height = 21
      TabOrder = 1
      Text = '{$item}'
      Items.Strings = (
        '{$item}'
        '{$item.name}'
        '{$item.type}'
        '{$item.empty} '
        '{$item.no}'
        '{$item.seq}'
        '{$item.default}'
        '{$item.label}')
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 787
    Height = 297
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'unit ModeloAutomatico;'
      ''
      'interface '
      'uses Model.Main;'
      ''
      'type'
      'TModeloGeradoAutomaticamente = class(TPaiCadastro)'
      '  private '
      '{$Loop Nome}'
      ' f{$item.name} : {$item.type};//Campo{$item.no} : {$item.type};'
      '{$EndLoop Nome}'
      '  public'
      '{$Loop Nome}'
      
        '  property {{$item.name}} {$item}  :  {$item.type} read get{$ite' +
        'm} write f{$item.name}; //Exemplo simples  '
      'gerando {$item}'
      '{$EndLoop Nome}'
      'end;'
      ''
      'implementation'
      '{$Loop Nome}'
      'function TModeloGeradoAutomaticamente.set{$item}: {$item.type};'
      'begin'
      '  result := {$item.empty};'
      'end;{$EndLoop Nome}'
      '{Summary}'
      '//Gerado automaticamente'
      '//Ricardo da Rocha (e) ricardodarocha@outlook.com'
      'end.')
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 42
  end
  object Memo2: TMemo
    Left = 0
    Top = 376
    Width = 787
    Height = 237
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 368
    ExplicitHeight = 248
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      787
      41)
    object Button1: TButton
      Left = 406
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Processar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Tabelas: TComboBox
      Left = 8
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 1
      OnChange = TabelasChange
    end
    object Campos: TComboBox
      Left = 207
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 2
    end
    object Button2: TButton
      Left = 688
      Top = 6
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Salvar Modelo'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 607
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Abrir...'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\dados\Esporte\LigaRegional.db'
      'DriverID=SQLite')
    Left = 504
    Top = 16
  end
  object Modelo: TFDQuery
    Connection = Conexao
    Left = 560
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 544
    Top = 144
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 152
  end
end
