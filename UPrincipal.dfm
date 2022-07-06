object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'FPrincipal'
  ClientHeight = 440
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 35
    Width = 60
    Height = 13
    Caption = 'Quant Corte'
  end
  object Label2: TLabel
    Left = 208
    Top = 35
    Width = 58
    Height = 13
    Caption = 'Ponto Corte'
  end
  object Label3: TLabel
    Left = 381
    Top = 35
    Width = 68
    Height = 13
    Caption = 'Taxa Muta'#231#227'o'
  end
  object Label4: TLabel
    Left = 32
    Top = 91
    Width = 34
    Height = 13
    Caption = #201'pocas'
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 152
    Width = 281
    Height = 241
    DataSource = DataSourceDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'x'
        Title.Alignment = taCenter
        Title.Caption = 'X'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'y'
        Title.Alignment = taCenter
        Title.Caption = 'Y'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cromossomo'
        Title.Alignment = taCenter
        Title.Caption = 'Cromossomo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'resultado'
        Title.Alignment = taCenter
        Title.Caption = 'Resultado'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 319
    Top = 152
    Width = 194
    Height = 129
    DataSource = DataSourceAux
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cromossomo'
        Title.Alignment = taCenter
        Title.Caption = 'Cromossomo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'resultado'
        Title.Alignment = taCenter
        Title.Caption = 'Resultado'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object BtnComecar: TButton
    Left = 408
    Top = 407
    Width = 97
    Height = 25
    Caption = 'Come'#231'ar'
    TabOrder = 2
    OnClick = BtnComecarClick
  end
  object EdtQuantCorte: TEdit
    Left = 104
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 3
    Text = '4'
  end
  object EdtPontoCorte: TEdit
    Left = 280
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 4
    Text = '4'
  end
  object EdtTaxaMutacao: TEdit
    Left = 456
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 5
    Text = '12'
  end
  object EdtEpocas: TEdit
    Left = 104
    Top = 88
    Width = 49
    Height = 21
    TabOrder = 6
    Text = '4'
  end
  object ClientDados: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD010000001800000005000000000003000000790001780400
      010000000000017904000100000000000A63726F6D6F73736F6D6F0100490000
      00010005574944544802000200140009726573756C7461646F04000100000000
      00056D75746F7501004900000001000557494454480200020001000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'x'
        DataType = ftInteger
      end
      item
        Name = 'y'
        DataType = ftInteger
      end
      item
        Name = 'cromossomo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'resultado'
        DataType = ftInteger
      end
      item
        Name = 'mutou'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 224
    Top = 96
    object ClientDadosx: TIntegerField
      FieldName = 'x'
    end
    object ClientDadosy: TIntegerField
      FieldName = 'y'
    end
    object ClientDadoscromossomo: TStringField
      FieldName = 'cromossomo'
    end
    object ClientDadosresultado: TIntegerField
      FieldName = 'resultado'
    end
    object ClientDadosmutou: TStringField
      FieldName = 'mutou'
      Size = 1
    end
  end
  object DataSourceDados: TDataSource
    DataSet = ClientDados
    Left = 312
    Top = 96
  end
  object ClientAux: TClientDataSet
    PersistDataPacket.Data = {
      4B0000009619E0BD0100000018000000020000000000030000004B000A63726F
      6D6F73736F6D6F01004900000001000557494454480200020014000972657375
      6C7461646F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cromossomo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'resultado'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 96
    object StringField1: TStringField
      FieldName = 'cromossomo'
    end
    object IntegerField3: TIntegerField
      FieldName = 'resultado'
    end
  end
  object DataSourceAux: TDataSource
    DataSet = ClientAux
    Left = 408
    Top = 96
  end
end
