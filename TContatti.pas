unit TContatti;

interface

uses
  System.Generics.Collections;

type
  DettaglioContatto = class
    private
      _id: Integer;
      sTipoDettaglio: string;
      sIndirizzo: string;
      sTelefono: string;
    public
      constructor Create(id: Integer; tipoDettaglio, indirizzo, telefono: string);
      property id: Integer read _id write _id;
      property TipoDettaglio: string read sTipoDettaglio write sTipoDettaglio;
      property Indirizzo: string read sIndirizzo write sIndirizzo;
      property Telefono: string read sTelefono write sTelefono;
      function ToString(): string;
  end;

type
  Contatto = class
    private
      _id: Integer;
      sNome: string;
      sCognome: string;
      lDettagliContatto: TObjectList<DettaglioContatto>;
    protected
    public
      constructor Create(id: Integer; nome: string; cognome: string);
      property id: Integer read _id write _id;
      property Nome: string read sNome write sNome;
      property Cognome: string read sCognome write sCognome;
      property Dettagli: TObjectList<DettaglioContatto> read lDettagliContatto write lDettagliContatto;
      function ToString(): string;
  end;

implementation
  constructor Contatto.Create(id: Integer; nome: string; cognome: string);
  begin
    _id := id;
    sNome := nome;
    sCognome := cognome;
    lDettagliContatto := TObjectList<DettaglioContatto>.Create();
  end;

  function Contatto.ToString(): string;
  begin
    Result := sCognome + ' ' + sNome;
  end;


  constructor DettaglioContatto.Create(id: Integer; tipoDettaglio, indirizzo, telefono: string);
  begin
    _id := id;
    sTipoDettaglio := tipoDettaglio;
    sIndirizzo := indirizzo;
    sTelefono := telefono;
  end;

  function DettaglioContatto.ToString(): string;
  begin
    Result := sTipoDettaglio;
  end;

end.
