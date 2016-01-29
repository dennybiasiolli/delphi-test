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
    Label3: TLabel;
    txtCognome: TEdit;
    Label4: TLabel;
    txtNome: TEdit;
    btnSalvaContatto: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure listContattiClick(Sender: TObject);
    procedure listDettagliContattoClick(Sender: TObject);
    procedure txtContattoChange(Sender: TObject);
    procedure btnSalvaContattoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

  const STR_NUOVO_INSERIMENTO: string = '- <NUOVO>';

implementation

uses About;

{$R *.dfm}

procedure TSDIAppForm.btnSalvaContattoClick(Sender: TObject);
var
  contattoSelezionato: Contatto;
begin
  contattoSelezionato := Contatto(listContatti.Items.Objects[listContatti.ItemIndex]);
  contattoSelezionato.Cognome := txtCognome.Text;
  contattoSelezionato.Nome := txtNome.Text;
  listContatti.Items[listContatti.ItemIndex] := contattoSelezionato.ToString();
  btnSalvaContatto.Enabled := False;
end;

procedure TSDIAppForm.FormCreate(Sender: TObject);
var
  contattoTest: Contatto;
begin
  listContatti.Items.Add(STR_NUOVO_INSERIMENTO);

  contattoTest := Contatto.Create(1, 'Mario', 'Rossi');
  contattoTest.Dettagli.Add(DettagliContatto.Create(1, 'Indirizzo Casa', 'Via Roma 15'));
  contattoTest.Dettagli.Add(DettagliContatto.Create(2, 'Indirizzo Lavoro', 'Via Torino 68'));
  //contattoTest.Dettagli.Add(DettagliContatto.Create('Via Roma 12', 'Casa'));
  listContatti.Items.AddObject('- ' + contattoTest.ToString(), contattoTest);

  contattoTest := Contatto.Create(2, 'Luigi', 'Bianchi');
  listContatti.Items.AddObject('- ' + contattoTest.ToString(), contattoTest);
end;

procedure TSDIAppForm.listContattiClick(Sender: TObject);
var
  objSelezionato: TObject;
  contattoSelezionato: Contatto;
  i: Integer;
begin
  if listContatti.ItemIndex = -1 then
  begin
    // lblContattoSelezionato.Caption := 'Dettagli contatto selezionato';
    Exit;
  end;
  btnSalvaContatto.Enabled := False;
  listDettagliContatto.Items.Clear();
  listDettagliContatto.Items.Add(STR_NUOVO_INSERIMENTO);

  objSelezionato := listContatti.Items.Objects[listContatti.ItemIndex];
  if(objSelezionato is Contatto) then
  begin
    contattoSelezionato := Contatto(listContatti.Items.Objects[listContatti.ItemIndex]);
    // lblContattoSelezionato.Caption := 'Dettagli ' + contattoSelezionato.ToString();
    txtCognome.Text := contattoSelezionato.Cognome;
    txtNome.Text := contattoSelezionato.Nome;
    for i := 0 to contattoSelezionato.Dettagli.Count - 1 do
      listDettagliContatto.Items.AddObject('- ' + contattoSelezionato.Dettagli.Items[i].ToString(), contattoSelezionato.Dettagli.Items[i]);
  end
  else
  begin
    txtCognome.Text := '';
    txtNome.Text := '';
  end;
  txtNome.Enabled := True;
  txtCognome.Enabled := True;
end;

procedure TSDIAppForm.listDettagliContattoClick(Sender: TObject);
var
  dettaglioSelezionato: DettagliContatto;
begin
  if listDettagliContatto.ItemIndex = -1 then
    exit;
  dettaglioSelezionato := DettagliContatto(listDettagliContatto.Items.Objects[listDettagliContatto.ItemIndex]);
end;

procedure TSDIAppForm.txtContattoChange(Sender: TObject);
begin
  if(TEdit(Sender).Enabled) then
    btnSalvaContatto.Enabled := True;
end;

end.
