unit TContatti;

interface

uses
  System.Generics.Collections;

type
  DettagliContatto = class
    private
      sIndirizzo: string;
      sTipoIndirizzo: string;
    public
      constructor Create(indirizzo, tipoIndirizzo: string);
      property Indirizzo: string read sIndirizzo write sIndirizzo;
      property TipoIndirizzo: string read sTipoIndirizzo write sTipoIndirizzo;
  end;

type
  Contatto = class
    private
      sNome: string;
      sCognome: string;
      lDettagliContatto: TObjectList<DettagliContatto>;
    protected
    public
      constructor Create(nome, cognome: string);
      property Nome: string read sNome write sNome;
      property Cognome: string read sCognome write sNome;
      property Dettagli: TObjectList<DettagliContatto> read lDettagliContatto write lDettagliContatto;
      function ToString(): string;
  end;

implementation
  constructor Contatto.Create(nome: string; cognome: string);
  begin
    sNome := nome;
    sCognome := cognome;
  end;

  function Contatto.ToString(): string;
  begin
    Result := sCognome + ' ' + sNome;
  end;


  constructor DettagliContatto.Create(indirizzo: string; tipoIndirizzo: string);
  begin
    sIndirizzo := indirizzo;
    sTipoIndirizzo := tipoIndirizzo;
  end;

end.
