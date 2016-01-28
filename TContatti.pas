unit TContatti;

interface

uses
  System.Generics.Collections;

type
  DettagliContatto = class
    private
      _id: Integer;
      sTipoIndirizzo: string;
      sIndirizzo: string;
    public
      constructor Create(id: Integer; tipoIndirizzo: string; indirizzo: string);
      property id: Integer read _id write _id;
      property TipoIndirizzo: string read sTipoIndirizzo write sTipoIndirizzo;
      property Indirizzo: string read sIndirizzo write sIndirizzo;
      function ToString(): string;
  end;

type
  Contatto = class
    private
      _id: Integer;
      sNome: string;
      sCognome: string;
      lDettagliContatto: TObjectList<DettagliContatto>;
    protected
    public
      constructor Create(id: Integer; nome: string; cognome: string);
      property id: Integer read _id write _id;
      property Nome: string read sNome write sNome;
      property Cognome: string read sCognome write sNome;
      property Dettagli: TObjectList<DettagliContatto> read lDettagliContatto write lDettagliContatto;
      function ToString(): string;
  end;

implementation
  constructor Contatto.Create(id: Integer; nome: string; cognome: string);
  begin
    _id := id;
    sNome := nome;
    sCognome := cognome;
    lDettagliContatto := TObjectList<DettagliContatto>.Create();
  end;

  function Contatto.ToString(): string;
  begin
    Result := sCognome + ' ' + sNome;
  end;


  constructor DettagliContatto.Create(id: Integer; tipoIndirizzo: string; indirizzo: string);
  begin
    _id := id;
    sTipoIndirizzo := tipoIndirizzo;
    sIndirizzo := indirizzo;
  end;

  function DettagliContatto.ToString(): string;
  begin
    Result := sTipoIndirizzo;
  end;

end.
