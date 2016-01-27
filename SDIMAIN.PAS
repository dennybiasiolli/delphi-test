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
    procedure FormCreate(Sender: TObject);
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
  contattoTest := Contatto.Create('Mario', 'Rossi');
  contattoTest.nome := 'Piero';
  contattoTest.Dettagli.Add(DettagliContatto.Create('Via Roma 12', 'Casa'));
  listContatti.Items.AddObject(contattoTest.ToString(), contattoTest);
end;

end.
