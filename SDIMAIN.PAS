unit SDIMAIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  TContatti;

type
  TSDIAppForm = class(TForm)
    listContatti: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    lblContattoSelezionato: TLabel;
    listDettagliContatto: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure listContattiClick(Sender: TObject);
    procedure listDettagliContattoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

implementation

uses About;

{$R *.dfm}

procedure TSDIAppForm.FormCreate(Sender: TObject);
var
  contattoTest: Contatto;
begin
  contattoTest := Contatto.Create(1, 'Mario', 'Rossi');
  contattoTest.Dettagli.Add(DettagliContatto.Create(1, 'Via Roma 15', 'Casa'));
  //contattoTest.Dettagli.Add(DettagliContatto.Create('Via Roma 12', 'Casa'));
  listContatti.Items.AddObject(contattoTest.ToString(), contattoTest);
end;

procedure TSDIAppForm.listContattiClick(Sender: TObject);
var
  contattoSelezionato: Contatto;
  i: Integer;
begin
  if listContatti.ItemIndex = -1 then
  begin
    lblContattoSelezionato.Caption := 'Dettagli contatto selezissonato';
    Exit;
  end;
  contattoSelezionato := Contatto(listContatti.Items.Objects[listContatti.ItemIndex]);
  lblContattoSelezionato.Caption := 'Dettagli ' + contattoSelezionato.ToString();
  listDettagliContatto.Items.Clear();
  for i := 0 to contattoSelezionato.Dettagli.Count - 1 do
    listDettagliContatto.Items.AddObject(contattoSelezionato.Dettagli.Items[i].ToString(), contattoSelezionato.Dettagli.Items[i]);
end;

procedure TSDIAppForm.listDettagliContattoClick(Sender: TObject);
var
  dettaglioSelezionato: DettagliContatto;
begin
  if listDettagliContatto.ItemIndex = -1 then
    exit;

end;

end.
