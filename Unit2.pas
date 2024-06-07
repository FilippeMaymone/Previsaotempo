unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,  pngimage,
  REST.Types, REST.Client, System.JSON, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.Mask;

type
  TForm2 = class(TForm)
    edCidade: TLabeledEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    pnCidade: TPanel;
    Panel2: TPanel;
    lbPrevisao: TLabel;
    lbData: TLabel;
    lbDescricao: TLabel;
    imgPrev: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    const
      iToken = 'd909c2e7';
      function getCamposJsonString(json,value:String): String;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
memo1.Clear;
RESTClient1.BaseURL := 'https://api.hgbrasil.com/weather?key='+iToken+'&city_name='+edCidade.Text;
RESTRequest1.Execute;
Memo1.Lines.Add(RESTRequest1.Response.JSONText);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
  Stream : TMemoryStream;
begin
lbData.Caption := getCamposJsonString(memo1.Text,'date')+' '+getCamposJsonString(memo1.Text,'time');
lbPrevisao.Caption := getCamposJsonString(memo1.Text,'temp')+'ºC';
lbDescricao.Caption := getCamposJsonString(memo1.Text,'description');
pnCidade.Caption := getCamposJsonString(memo1.Text,'city');

if FileExists(ExtractFileDir(ParamStr(0))+'\img\'+getCamposJsonString(memo1.Text,'condition_slug')+'.png') then
begin
Stream := TMemoryStream.Create;
try
  Stream.LoadFromFile(ExtractFileDir(ParamStr(0))+'\img\'+getCamposJsonString(memo1.Text,'condition_slug')+'.png');
  Stream.Position := 0;
  imgPrev.Picture.LoadFromStream(Stream);
finally
  Stream.Free;
end;
end;
end;

function TForm2.getCamposJsonString(json, value: String): String;
var
   LJSONObject: TJSONObject;
   function TrataObjeto(jObj:TJSONObject):string;
   var i:integer;
       jPar: TJSONPair;
   begin
        result := '';
        for i := 0 to jObj.Size - 1 do
        begin
             jPar := jObj.Get(i);
             if jPar.JsonValue Is TJSONObject then
                result := TrataObjeto((jPar.JsonValue As TJSONObject)) else
             if sametext(trim(jPar.JsonString.Value),value) then
             begin
                  Result := jPar.JsonValue.Value;
                  break;
             end;
             if result <> '' then
                break;
        end;
   end;
begin
   try
      LJSONObject := nil;
      LJSONObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(json),0) as TJSONObject;
      result := TrataObjeto(LJSONObject);
   finally
      LJSONObject.Free;
   end;
end;

end.
