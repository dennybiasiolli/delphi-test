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
    btnSalvaDettaglio: TButton;
    Label12: TLabel;
    Label13: TLabel;
    txtDettTipoDettaglio: TEdit;
    txtDettIndirizzo: TEdit;
    Label14: TLabel;
    txtDettTelefono: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SelectItemListContatti(itemIndex: Integer);
    procedure SelectItemListContattiDettaglio(itemIndex: Integer);
    procedure listContattiClick(Sender: TObject);
    procedure listDettagliContattoClick(Sender: TObject);
    procedure txtContattoChange(Sender: TObject);
    procedure btnSalvaContattoClick(Sender: TObject);
    procedure btnSalvaDettaglioClick(Sender: TObject);
    procedure txtDettagliContattoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

  const STR_VOCE_ELENCO: string = '- ';
  const STR_NUOVO_INSERIMENTO: string = '- <NUOVO>';

implementation

uses About;

{$R *.dfm}

procedure TSDIAppForm.btnSalvaContattoClick(Sender: TObject);
var
  objSelezionato, objDettaglio: TObject;
  contattoSelezionato: Contatto;
  contattoDettaglio: Contatto;
  indexInserito, i: Integer;
begin
  objSelezionato := listContatti.Items.Objects[listContatti.ItemIndex];
  if(objSelezionato is Contatto) then
  begin
    contattoSelezionato := Contatto(objSelezionato);
    contattoSelezionato.Cognome := txtCognome.Text;
    contattoSelezionato.Nome := txtNome.Text;
    listContatti.Items[listContatti.ItemIndex] := STR_VOCE_ELENCO + contattoSelezionato.ToString();
  end
  else
  begin
    contattoSelezionato := Contatto.Create(0, txtNome.Text, txtCognome.Text);
    listContatti.AddItem(STR_VOCE_ELENCO + contattoSelezionato.ToString(), contattoSelezionato);
    indexInserito := listContatti.Items.IndexOfObject(contattoSelezionato);
    listContatti.ItemIndex := indexInserito;
    SelectItemListContatti(indexInserito);
  end;
  contattoSelezionato.Dettagli.Clear();
  for i := 0 to listDettagliContatto.Items.Count - 1 do
  begin
    objDettaglio := listDettagliContatto.Items.Objects[i];
    if(objDettaglio is DettaglioContatto) then
      contattoSelezionato.Dettagli.Add(DettaglioContatto(objDettaglio));
  end;
  btnSalvaContatto.Enabled := False;
end;

procedure TSDIAppForm.btnSalvaDettaglioClick(Sender: TObject);
var
  objSelezionato: TObject;
  dettaglioSelezionato: DettaglioContatto;
  indexInserito: Integer;
begin
  objSelezionato := listDettagliContatto.Items.Objects[listDettagliContatto.ItemIndex];
  if(objSelezionato is DettaglioContatto) then
  begin
    dettaglioSelezionato := DettaglioContatto(objSelezionato);
    dettaglioSelezionato.TipoDettaglio := txtDettTipoDettaglio.Text;
    dettaglioSelezionato.Indirizzo := txtDettIndirizzo.Text;
    dettaglioSelezionato.Telefono := txtDettTelefono.Text;
    listDettagliContatto.Items[listDettagliContatto.ItemIndex] := STR_VOCE_ELENCO + dettaglioSelezionato.ToString();
  end
  else
  begin
    dettaglioSelezionato := DettaglioContatto.Create(0, txtDettTipoDettaglio.Text, txtDettIndirizzo.Text, txtDettTelefono.Text);
    listDettagliContatto.AddItem(STR_VOCE_ELENCO + dettaglioSelezionato.ToString(), dettaglioSelezionato);
    indexInserito := listDettagliContatto.Items.IndexOfObject(dettaglioSelezionato);
    listDettagliContatto.ItemIndex := indexInserito;
    SelectItemListContattiDettaglio(indexInserito);
    btnSalvaContatto.Enabled := True;
  end;
  btnSalvaDettaglio.Enabled := False;
end;

procedure TSDIAppForm.FormCreate(Sender: TObject);
var
  contattoTest: Contatto;
begin
  listContatti.Items.Add(STR_NUOVO_INSERIMENTO);

  contattoTest := Contatto.Create(1, 'Mario', 'Rossi');
  contattoTest.Dettagli.Add(DettaglioContatto.Create(1, 'Casa', 'Via Roma 15', '0123456789'));
  contattoTest.Dettagli.Add(DettaglioContatto.Create(2, 'Lavoro', 'Via Torino 68', '3456789101'));
  //contattoTest.Dettagli.Add(DettagliContatto.Create('Via Roma 12', 'Casa'));
  listContatti.Items.AddObject(STR_VOCE_ELENCO + contattoTest.ToString(), contattoTest);

  contattoTest := Contatto.Create(2, 'Luigi', 'Bianchi');
  listContatti.Items.AddObject(STR_VOCE_ELENCO + contattoTest.ToString(), contattoTest);
end;

procedure TSDIAppForm.SelectItemListContatti(itemIndex: Integer);
var
  objSelezionato: TObject;
  contattoSelezionato: Contatto;
  i: Integer;
begin
  if listContatti.ItemIndex = -1 then
  begin
    Exit;
  end;
  listDettagliContatto.Items.Clear();
  listDettagliContatto.Items.Add(STR_NUOVO_INSERIMENTO);
  objSelezionato := listContatti.Items.Objects[itemIndex];
  if(objSelezionato is Contatto) then
  begin
    contattoSelezionato := Contatto(objSelezionato);
    txtCognome.Text := contattoSelezionato.Cognome;
    txtNome.Text := contattoSelezionato.Nome;
    for i := 0 to contattoSelezionato.Dettagli.Count - 1 do
      listDettagliContatto.Items.AddObject(STR_VOCE_ELENCO + contattoSelezionato.Dettagli.Items[i].ToString(), contattoSelezionato.Dettagli.Items[i]);
  end
  else
  begin
    txtCognome.Text := '';
    txtNome.Text := '';
  end;
  btnSalvaContatto.Enabled := False;
  txtNome.Enabled := True;
  txtCognome.Enabled := True;


  txtDettTipoDettaglio.Text := '';
  txtDettIndirizzo.Text := '';
  txtDettTelefono.Text := '';
  btnSalvaDettaglio.Enabled := False;
  txtDettTipoDettaglio.Enabled := False;
  txtDettIndirizzo.Enabled := False;
  txtDettTelefono.Enabled := False;
end;

procedure TSDIAppForm.SelectItemListContattiDettaglio(itemIndex: Integer);
var
  objSelezionato: TObject;
  dettaglioSelezionato: DettaglioContatto;
  i: Integer;
begin
  if listDettagliContatto.ItemIndex = -1 then
  begin
    Exit;
  end;
  objSelezionato := listDettagliContatto.Items.Objects[itemIndex];
  if(objSelezionato is DettaglioContatto) then
  begin
    dettaglioSelezionato := DettaglioContatto(objSelezionato);
    txtDettTipoDettaglio.Text := dettaglioSelezionato.TipoDettaglio;
    txtDettIndirizzo.Text := dettaglioSelezionato.Indirizzo;
    txtDettTelefono.Text := dettaglioSelezionato.Telefono;
  end
  else
  begin
    txtDettTipoDettaglio.Text := '';
    txtDettIndirizzo.Text := '';
    txtDettTelefono.Text := '';
  end;
  btnSalvaDettaglio.Enabled := False;
  txtDettTipoDettaglio.Enabled := True;
  txtDettIndirizzo.Enabled := True;
  txtDettTelefono.Enabled := True;
end;

procedure TSDIAppForm.listContattiClick(Sender: TObject);
begin
  SelectItemListContatti(listContatti.ItemIndex);
end;

procedure TSDIAppForm.listDettagliContattoClick(Sender: TObject);
begin
  SelectItemListContattiDettaglio(listDettagliContatto.ItemIndex);
end;

procedure TSDIAppForm.txtContattoChange(Sender: TObject);
begin
  if(TEdit(Sender).Enabled) then
    btnSalvaContatto.Enabled := True;
end;

procedure TSDIAppForm.txtDettagliContattoChange(Sender: TObject);
begin
  if(TEdit(Sender).Enabled) then
    btnSalvaDettaglio.Enabled := True;
end;

end.
