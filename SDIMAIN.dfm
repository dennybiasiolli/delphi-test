object SDIAppForm: TSDIAppForm
  Left = 197
  Top = 111
  Caption = 'SDI Application'
  ClientHeight = 294
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    835
    294)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 819
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
    Left = 227
    Top = 34
    Width = 185
    Height = 16
    Caption = 'Dettagli contatto selezionato'
  end
  object listContatti: TListBox
    Left = 0
    Top = 56
    Width = 217
    Height = 236
    Anchors = [akLeft, akTop, akBottom]
    Sorted = True
    TabOrder = 0
    OnClick = listContattiClick
  end
  object listDettagliContatto: TListBox
    Left = 223
    Top = 56
    Width = 217
    Height = 236
    Anchors = [akLeft, akTop, akBottom]
    Sorted = True
    TabOrder = 1
    OnClick = listDettagliContattoClick
  end
end
