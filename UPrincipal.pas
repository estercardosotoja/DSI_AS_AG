unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, System.Math, Vcl.StdCtrls;

type
  TFPrincipal = class(TForm)
    ClientDados: TClientDataSet;
    DataSourceDados: TDataSource;
    DBGrid1: TDBGrid;
    ClientDadosx: TIntegerField;
    ClientDadosy: TIntegerField;
    ClientDadoscromossomo: TStringField;
    ClientDadosresultado: TIntegerField;
    ClientAux: TClientDataSet;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    DataSourceAux: TDataSource;
    DBGrid2: TDBGrid;
    BtnComecar: TButton;
    EdtQuantCorte: TEdit;
    Label1: TLabel;
    EdtPontoCorte: TEdit;
    Label2: TLabel;
    EdtTaxaMutacao: TEdit;
    Label3: TLabel;
    ClientDadosmutou: TStringField;
    EdtEpocas: TEdit;
    Label4: TLabel;
    procedure BtnComecarClick(Sender: TObject);
  private
    { Private declarations }
    function Objetivo(Xvar, Yvar: Integer): double;

    procedure PreencherClient;
    procedure Corte;
    procedure RoletaViciada;
    procedure Decodificar;
    function BinToInt(Value: string): Integer;
    function IntToBin1(Value: Longint; Digits: Integer): string;
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

{ TFPrincipal }

procedure TFPrincipal.BtnComecarClick(Sender: TObject);
var
  I: Integer;
begin
  PreencherClient;
  for I := 1 to StrToInt(EdtEpocas.Text) do
  begin
    Corte;
    RoletaViciada;
    Decodificar;
    ShowMessage('Fim epoca: ' + IntToStr(I));
  end;
end;

procedure TFPrincipal.Corte;
var
  I: Integer;
begin
  I:= 0;
  ClientAux.EmptyDataSet;
  ClientDados.Last;
  while I < StrToInt(EdtQuantCorte.Text) do
  begin
    ClientAux.Append;
    ClientAux.FieldByName('cromossomo').AsString:= ClientDados.FieldByName('cromossomo').AsString;
    ClientAux.FieldByName('resultado').AsString:= ClientDados.FieldByName('resultado').AsString;
    ClientAux.Post;

    Inc(I);
    ClientDados.Prior;
  end;
end;

procedure TFPrincipal.Decodificar;
begin
  ClientDados.IndexFieldNames := '';
  ClientDados.First;
  while not ClientDados.Eof do
  begin
    ClientDados.Edit;
    ClientDados.FieldByName('x').AsInteger:= BinToInt(Copy(ClientDados.FieldByName('cromossomo').AsString , 1, 3));
    ClientDados.FieldByName('y').AsInteger:= BinToInt(Copy(ClientDados.FieldByName('cromossomo').AsString , 4, 3));
    ClientDados.FieldByName('resultado').AsFloat:= Objetivo(ClientDados.FieldByName('x').AsInteger, ClientDados.FieldByName('y').AsInteger);
    ClientDados.Post;

    ClientDados.Next;
  end;
  ClientDados.IndexFieldNames := 'resultado';
end;

function TFPrincipal.BinToInt(Value: string): Integer;
var
  i, iValueSize: Integer;
begin
  Result := 0;
  iValueSize := Length(Value);
  for i := iValueSize downto 1 do
    if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
end;

function TFPrincipal.IntToBin1(Value: Longint; Digits: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := Digits downto 0 do
    if Value and (1 shl i) <> 0 then
      Result := Result + '1'
  else
    Result := Result + '0';
end;

function TFPrincipal.Objetivo(Xvar, Yvar: Integer): double;
var
  XX, YY: double;
begin
  XX:= Power(Xvar - 2.0, 2.0);
  YY:= Power(Yvar - 3.0, 2.0);
  Result:= 2.0 - XX - YY;
end;

procedure TFPrincipal.PreencherClient;
var
  i: integer;
begin
  Randomize;
  i:=0;
  ClientDados.EmptyDataSet;
  while i < 10 do
  begin
    ClientDados.Append;
    ClientDados.FieldByName('x').AsInteger:= Random(7);
    ClientDados.FieldByName('y').AsInteger:= Random(7);
    ClientDados.FieldByName('cromossomo').AsString:= IntToBin1(ClientDados.FieldByName('x').AsInteger, 2) + IntToBin1(ClientDados.FieldByName('y').AsInteger, 2);
    ClientDados.FieldByName('resultado').AsFloat:= Objetivo(ClientDados.FieldByName('x').AsInteger, ClientDados.FieldByName('y').AsInteger);
    ClientDados.Post;

    Inc(i);
  end;

  ClientDados.IndexFieldNames := 'resultado';
end;

procedure TFPrincipal.RoletaViciada;
var
  I, J, K, QuantMut, Pos, Len: Integer;
  X,comeco, fim: string;
begin
  Len:= ClientDados.FieldByName('cromossomo').AsString.Length;

  I:= 0;
  ClientDados.EmptyDataSet;
  ClientAux.First;
  while not ClientAux.Eof do
  begin
    case I of
      0: begin
           for J := 1 to 4 do
           begin
             ClientDados.Append;
             ClientDados.FieldByName('cromossomo').AsString:= Copy(ClientAux.FieldByName('cromossomo').AsString, 0, StrToInt(EdtPontoCorte.Text));
             ClientDados.Post;
           end;
         end;
      1: begin
           for J := 1 to 3 do
           begin
             ClientDados.Append;
             ClientDados.FieldByName('cromossomo').AsString:= Copy(ClientAux.FieldByName('cromossomo').AsString, 0, StrToInt(EdtPontoCorte.Text));
             ClientDados.Post;
           end;
         end;
      2: begin
           for J := 1 to 2 do
           begin
             ClientDados.Append;
             ClientDados.FieldByName('cromossomo').AsString:= Copy(ClientAux.FieldByName('cromossomo').AsString, 0, StrToInt(EdtPontoCorte.Text));
             ClientDados.Post;
           end;
         end;
      3: begin
           ClientDados.Append;
           ClientDados.FieldByName('cromossomo').AsString:= Copy(ClientAux.FieldByName('cromossomo').AsString, 0, StrToInt(EdtPontoCorte.Text));
           ClientDados.Post;
         end;
    end;

    Inc(I);
    ClientAux.Next;
  end;

  Randomize;
  ClientDados.First;
  while not ClientDados.Eof do
  begin
    K:= Len - StrToInt(EdtPontoCorte.Text);
    X:= IntToBin1(Random(K*K), K-1);
    ClientDados.Edit;
    ClientDados.FieldByName('cromossomo').AsString:= ClientDados.FieldByName('cromossomo').AsString + X;
    ClientDados.Post;

    ClientDados.Next;
  end;

  QuantMut:= Trunc((ClientDados.FieldByName('cromossomo').AsString.Length * 10) / StrToInt(EdtTaxaMutacao.Text));

  I:= 0;
  while I < QuantMut do
  begin
    Pos:= Random(9);
    ClientDados.First;

    for J:= 1 to Pos do
      ClientDados.Next;

    if ClientDados.FieldByName('mutou').AsString <> 'X' then
    begin
      K:= Random(Len-1);
      X:= Copy(ClientDados.FieldByName('cromossomo').AsString, K+1, 1);
      if X = '1' then
        X:= '0'
      else
        X:= '1';

      comeco:= Copy(ClientDados.FieldByName('cromossomo').AsString, 1, K);
      fim   := Copy(ClientDados.FieldByName('cromossomo').AsString, K+2, Len-K);

      ClientDados.Edit;
      ClientDados.FieldByName('cromossomo').AsString:= comeco + X + fim;
      ClientDados.FieldByName('mutou').AsString:= 'X';
      ClientDados.Post;
      Inc(I);
    end;
  end;

end;

end.
