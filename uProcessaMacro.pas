unit uProcessaMacro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Db, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Vcl.ExtCtrls;

  type

    TTipoCampo = record
      NomeTipo: String;
      ValorPadrao: String;
    end;

  const
  TipoCampo2TipoDelphi : array [TFieldType] of TTipoCampo = (

    {ftUnknown}    (NomeTipo:'String';ValorPadrao: ''''''),
    {ftString}     (NomeTipo:'String';ValorPadrao: ''''''),
    {ftSmallint}   (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftInteger}    (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftWord}       (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftBoolean}    (NomeTipo:'String';ValorPadrao: 'S'),
    {ftFloat}      (NomeTipo:'Currency';ValorPadrao: '0.00'),
    {ftCurrency}   (NomeTipo:'Currency';ValorPadrao: '0.00'),
    {ftBCD}        (NomeTipo:'Currency';ValorPadrao: '0.00'),
    {ftDate}       (NomeTipo:'TDate';ValorPadrao: '0'),
    {ftTime}       (NomeTipo:'TTime';ValorPadrao: '0'),
    {ftDateTime}   (NomeTipo:'TDatetime';ValorPadrao: '0'),
    {ftBytes}      (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftVarBytes}   (NomeTipo:'?';ValorPadrao: ''''''),
    {ftAutoInc}    (NomeTipo:'Integer';ValorPadrao: '-1'),
    {ftBlob}       (NomeTipo:'Blob';ValorPadrao: 'null'),
    {ftMemo}       (NomeTipo:'String';ValorPadrao: ''''''),
    {ftGraphic}    (NomeTipo:'?';ValorPadrao: ''''''),
    {ftFmtMemo}    (NomeTipo:'String';ValorPadrao: ''''''),
    {ftParadoxOle} (NomeTipo:'?';ValorPadrao: ''''''),
    {ftDBaseOle}   (NomeTipo:'?';ValorPadrao: ''''''),
    {ftTypedBinary}(NomeTipo:'?';ValorPadrao: ''''''),
    {ftCursor}     (NomeTipo:'?';ValorPadrao: ''''''),
    {ftFixedChar}  (NomeTipo:'?';ValorPadrao: ''''''),
    {ftWideString} (NomeTipo:'String';ValorPadrao: ''''''),
    {ftLargeint}   (NomeTipo:'Int64';ValorPadrao: '0'),
    {ftADT}        (NomeTipo:'?';ValorPadrao: '0'),
    {ftArray}      (NomeTipo:'?';ValorPadrao: '0') ,
    {ftReference}  (NomeTipo:'?';ValorPadrao: '0'),
    {ftDataSet}    (NomeTipo:'?';ValorPadrao: '0'),
    {ftOraBlob}    (NomeTipo:'?';ValorPadrao: '0'),
    {ftOraClob}    (NomeTipo:'?';ValorPadrao: '0'),
    {ftVariant}    (NomeTipo:'String';ValorPadrao: ''),
    {ftInterface}  (NomeTipo:'?';ValorPadrao: ''''''),
    {ftIDispatch}  (NomeTipo:'?';ValorPadrao: ''''''),
    {ftGuid}       (NomeTipo:'String';ValorPadrao: '{}'),
    {ftTimeStamp}  (NomeTipo:'String';ValorPadrao: '1900-1-1'),
    {ftFMTBcd}     (NomeTipo:'Currency';ValorPadrao: '0.00'),
    {ftFixedWideCharNomeTipo:} (NomeTipo:'String';ValorPadrao: ''''''),
    {ftWideMemo}   (NomeTipo:'String';ValorPadrao: ''''''),
    {ftOraTimeStamp}(NomeTipo:  'String';ValorPadrao: '1900-1-1'),
    {ftOraInterval}(NomeTipo:'?';ValorPadrao: ''''''),
    {ftLongWord}   (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftShortint}   (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftByte}       (NomeTipo:'Integer';ValorPadrao: '0'),
    {ftExtended}   (NomeTipo:'Extended';ValorPadrao: '0.00'),
    {ftConnection} (NomeTipo:'?';ValorPadrao: ''''''),
    {ftParams}     (NomeTipo:'?';ValorPadrao: ''''''),
    {ftStream}     (NomeTipo:'?';ValorPadrao: ''''''),
    {ftTimeStampOffset}   (NomeTipo:'?';ValorPadrao: ''),
    {ftObject}     (NomeTipo:'?';ValorPadrao: ''''''),
    {ftSingle}     (NomeTipo:'Integer';ValorPadrao: '0')
    );
//  TListaDeStrings = array of String;

//  TListaDeStringsHelper = record helper for TListaDeStrings
//    procedure Add(Value: String);
//  end;
type

  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Conexao: TFDConnection;
    Modelo: TFDQuery;
    Panel1: TPanel;
    Button1: TButton;
    Tabelas: TComboBox;
    Campos: TComboBox;
    Splitter1: TSplitter;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Button4: TButton;
    Items: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TabelasChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public
    function ProcessarDetalhes(var Dataset: TFDQuery) : String;

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Tabelas.Text = '' then
    Showmessage('Escolha uma tabela') else
  ProcessarDetalhes(Modelo);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin

  if SaveDialog1.Execute() then
     Memo1.Lines.SaveToFile(OpenDialog1.FileName);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute() then
     Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute() then
     Memo2.Lines.SaveToFile(OpenDialog1.FileName);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Conexao.GetTableNames('', '', '', Tabelas.Items);
end;

function TForm2.ProcessarDetalhes(var Dataset: TFDQuery) : String;
var
  Teste: String;
  Item: String;
  Template: String;
  Looping: String;

  Inicio, Fim: Integer;
  LoopName: String;

  FraseInicio, FraseFim: String;

  Macro, MacroItem: String;

  I, J, L: Integer;
  F: TField;

  S: String;

begin
  Dataset. Open(format('select * from %s where false', [Tabelas.Text]));

  Memo2.Lines.Text := Memo1.Lines.Text;

  for I := 1 to 50 do
  begin
    Template := Memo2.Lines.Text;

    if pos('{$Loop', Template) = 0 then
    begin
       break;
    end;

    Inicio :=  pos('{$Loop', Template);
    if Inicio = 0 then
      Exit;   //Nao encontrou o item {%Loop

    Fim := 0;
    for J := Inicio to Length(Template) do
    begin
      if Template[J] = '}' then
      begin
        Fim := J-1;
        break;
      end;
    end;

    if Fim = 0 then
      Exit;   //Nao encontrou o fim do arquivo {%EndLoop}

    LoopName := Copy(Template, Inicio+7, Fim-Inicio-6);
    FraseInicio := Copy(Template, Inicio, Fim-Inicio+2);
//    Label1.Caption := FraseInicio;

    //-------------------------------------------------------------------------------

    Delete(Template, 1, Fim+1);

    Inicio :=  pos('{$EndLoop ' + LoopName, Template);
    if Inicio = 0 then
      Exit;   //Nao encontrou o item {%Loop

    Fim := 0;
    for J := Inicio to Length(Template) do
    begin
      if Template[J] = '}' then
      begin
        Fim := J-1;
        break;
      end;
    end;

    if Fim = 0 then
      Exit;   //Nao encontrou o fim do arquivo {%EndLoop}

    //LoopName := Copy(Template, Inicio+6, Fim-Inicio-5);

    FraseFim := Copy(Template, Inicio, Fim-Inicio+2);
//    Label1.Caption := FraseFim;
    //------------------------------------------------------------------------------------

    Template := Memo2.Lines.Text;
    Inicio := Pos(FraseInicio, Template);
    Fim := Pos(FraseFim, Template);
    Macro := Copy(Template, Inicio, Fim-Inicio + length(FraseFim));
    MacroItem :=   trim(Copy(Template, Inicio, Fim-Inicio ));
    Delete(MacroItem, 1, length(FraseInicio));
//    Label1.Caption := MacroItem;

    Teste := '';
    for F in Dataset.Fields do
      begin
        Teste := Teste + #13 + MacroItem;
        Teste := StringReplace(Teste, '{$item}', F.FieldName, [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.name}', F.FieldName, [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.type}', TipoCampo2TipoDelphi[F.DataType].NomeTipo, [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.empty}', TipoCampo2TipoDelphi[F.DataType].ValorPadrao, [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.no}' , IntToStr(F.FieldNo), [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.seq}' , IntToStr(F.FieldNo+1), [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.default}' , F.DefaultExpression, [rfReplaceAll, rfIgnoreCase]);
        Teste := StringReplace(Teste, '{$item.label}' , F.DisplayLabel, [rfReplaceAll, rfIgnoreCase]);

      end;
    Teste := '{$REGION ''Gerado automaticamente para cada item {$$item}''}' + Teste + #13 + '{$ENDREGION}';

    Memo2.Lines.Text := StringReplace(Template, Macro, Teste, [rfReplaceAll, rfIgnoreCase]);
  end;
end;

procedure TForm2.TabelasChange(Sender: TObject);
begin
  Conexao.GetFieldNames('', '', Tabelas.Text,'', Campos.Items);
end;

//{ TListaDeStringsHelper }
//
//procedure TListaDeStringsHelper.Add(Value: String);
//
//var Quantidade: integer;
//begin
//  Quantidade := Length(self);
//  setLength(self, Quantidade + 1);
//  Self[Quantidade] := Value;
//end;

end.
