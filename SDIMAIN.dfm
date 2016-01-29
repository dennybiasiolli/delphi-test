object SDIAppForm: TSDIAppForm
  Left = 197
  Top = 111
  Caption = 'Gestione anagrafica'
  ClientHeight = 488
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    863
    488)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 847
    Height = 34
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Gestione anagrafica'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 379
  end
  object Label2: TLabel
    Left = 4
    Top = 34
    Width = 95
    Height = 16
    Caption = 'Elenco contatti'
  end
  object lblContattoSelezionato: TLabel
    Left = 223
    Top = 147
    Width = 105
    Height = 16
    Caption = 'Dettagli contatto'
  end
  object Label3: TLabel
    Left = 223
    Top = 34
    Width = 61
    Height = 16
    Caption = 'Cognome'
  end
  object Label4: TLabel
    Left = 223
    Top = 86
    Width = 38
    Height = 16
    Caption = 'Nome'
  end
  object Label5: TLabel
    Left = 579
    Top = 56
    Width = 223
    Height = 16
    Caption = '1. Seleziona il contatto dall'#39'elenco'
  end
  object Label6: TLabel
    Left = 579
    Top = 78
    Width = 266
    Height = 16
    Caption = '2. Visualizza / modifica i dati del contatto'
  end
  object Label7: TLabel
    Left = 579
    Top = 122
    Width = 264
    Height = 16
    Caption = '4. Seleziona uno dei dettagli del contatto'
  end
  object Label8: TLabel
    Left = 579
    Top = 100
    Width = 232
    Height = 16
    Caption = '3. Salva gli eventuali dati modificati'
  end
  object Label9: TLabel
    Left = 579
    Top = 144
    Width = 223
    Height = 16
    Caption = '5. Visualizza / modifica il dettaglio'
  end
  object Label10: TLabel
    Left = 579
    Top = 166
    Width = 260
    Height = 16
    Caption = '6. Salva l'#39'eventuale dettaglio modificato'
  end
  object Label11: TLabel
    Left = 579
    Top = 34
    Width = 78
    Height = 16
    Caption = 'ISTRUZIONI'
  end
  object listContatti: TListBox
    Left = 0
    Top = 56
    Width = 217
    Height = 430
    Anchors = [akLeft, akTop, akBottom]
    Sorted = True
    TabOrder = 0
    OnClick = listContattiClick
    ExplicitHeight = 236
  end
  object listDettagliContatto: TListBox
    Left = 219
    Top = 169
    Width = 354
    Height = 137
    Sorted = True
    TabOrder = 1
    OnClick = listDettagliContattoClick
  end
  object txtCognome: TEdit
    Left = 223
    Top = 56
    Width = 350
    Height = 24
    Enabled = False
    MaxLength = 25
    TabOrder = 2
  end
  object txtNome: TEdit
    Left = 223
    Top = 108
    Width = 350
    Height = 24
    Enabled = False
    MaxLength = 25
    TabOrder = 3
    OnChange = txtContattoChange
  end
  object btnSalvaContatto: TButton
    Left = 498
    Top = 138
    Width = 75
    Height = 25
    Caption = 'Salva'
    Enabled = False
    TabOrder = 4
    OnClick = btnSalvaContattoClick
  end
end
