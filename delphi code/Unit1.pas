unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.JSON,
  IdHTTP,
  IdAuthentication, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    result_txt: TMemo;
    lable1: TLabel;
    message_txt: TMemo;
    Label1: TLabel;
    response_code_txt: TMemo;
    Label2: TLabel;
    apikey_txt: TMemo;
    Label3: TLabel;
    gateway_txt: TMemo;
    Label4: TLabel;
    Panel1: TPanel;
    Button2: TButton;
    single_or_group_numbers_txt: TMemo;
    Label5: TLabel;
    Panel2: TPanel;
    single_or_group_text_txt: TMemo;
    Label6: TLabel;
    Panel3: TPanel;
    Button3: TButton;
    from_date_txt: TMemo;
    Label7: TLabel;
    to_date_txt: TMemo;
    Label8: TLabel;
    Panel4: TPanel;
    Button4: TButton;
    group_id_txt: TMemo;
    Label9: TLabel;
    phonebook_number_txt: TMemo;
    Panel5: TPanel;
    Button5: TButton;
    pair_to_pair_numbers_txt: TMemo;
    Label10: TLabel;
    pair_to_pair_text_txt: TMemo;
    Panel6: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var
  myHttp: TIdHTTP;
  result : String;
  api_key: String;
  JObj: TJSONObject;
  gateway : String;
  begin
    api_key := apikey_txt.Text;
    gateway := gateway_txt.Text;
    myHttp := TIdHTTP.Create;
    try
      result := myHttp.Get('https://api.sabanovin.com/v1/'+Trim(api_key)+'/account/balance.json');
      result_txt.Text := result;
      JObj := TJSONObject.ParseJSONValue(result) as TJSONObject;
      response_code_txt.Text := JObj.GetValue<string>('status.code');
      message_txt.Text := JObj.GetValue<string>('entry.balance');
    finally
      myHttp.Free;
    end;
  end;
procedure TForm1.Button2Click(Sender: TObject);
var
  myHttp: TIdHTTP;
  result : String;
  api_key: String;
  JObj: TJSONObject;
  gateway : String;
  begin
    api_key := apikey_txt.Text;
    gateway := gateway_txt.Text;
    myHttp := TIdHTTP.Create;
    try
      result := myHttp.Get('https://api.sabanovin.com/v1/'+Trim(api_key)+
        '/sms/send.json?gateway='+Trim(gateway)+'&to='+
        Trim(single_or_group_numbers_txt.Text)+
        '&text='+ Trim(single_or_group_text_txt.Text));
      result_txt.Text := result;
      JObj := TJSONObject.ParseJSONValue(result) as TJSONObject;
      response_code_txt.Text := JObj.GetValue<string>('status.code');
      message_txt.Text := JObj.GetValue<string>('entries[0].reference_id');
    finally
      myHttp.Free;
    end;
  end;

procedure TForm1.Button3Click(Sender: TObject);
var
  myHttp: TIdHTTP;
  result : String;
  api_key: String;
  JObj: TJSONObject;
  gateway : String;
  url : String;
  begin
    api_key := apikey_txt.Text;
    gateway := gateway_txt.Text;
    myHttp := TIdHTTP.Create;
    try
      if from_date_txt.Text <> '' then
        begin
          if to_date_txt.Text <> '' then
            begin
              url := 'https://api.sabanovin.com/v1/'+Trim(api_key)+'/sms/receive.json?'+
                'gateway='+Trim(gateway)+'&is_read=0&from_date='+
                Trim(from_date_txt.Text) + '&to_date='+
                Trim(to_date_txt.Text);
            end
          else
            begin
              url := 'https://api.sabanovin.com/v1/'+Trim(api_key)+'/sms/receive.json?'+
              'gateway='+Trim(gateway)+'&is_read=0&from_date='+
              Trim(from_date_txt.Text);
            end
        end
      else
        begin
          url := 'https://api.sabanovin.com/v1/'+Trim(api_key)+'/sms/receive.json?'+
          'gateway='+Trim(gateway)+'&is_read=0';
        end;
      result := myHttp.Get(url);
      result_txt.Text := result;
      JObj := TJSONObject.ParseJSONValue(result) as TJSONObject;
      response_code_txt.Text := JObj.GetValue<string>('status.code');
       message_txt.Text := JObj.GetValue<string>('status.message');
    finally
      myHttp.Free;
    end;
  end;

procedure TForm1.Button4Click(Sender: TObject);
var
  myHttp: TIdHTTP;
  result : String;
  api_key: String;
  JObj: TJSONObject;
  gateway : String;
  begin
    api_key := apikey_txt.Text;
    gateway := gateway_txt.Text;
    myHttp := TIdHTTP.Create;
    try
      result := myHttp.Get('https://api.sabanovin.com/v1/'+Trim(api_key)+
        '/utils/add_contact.json?group_id='+Trim(group_id_txt.Text)+
        '&number='+Trim(phonebook_number_txt.Text));
      result_txt.Text := result;
      JObj := TJSONObject.ParseJSONValue(result) as TJSONObject;
      response_code_txt.Text := JObj.GetValue<string>('status.code');
      message_txt.Text := JObj.GetValue<string>('status.message');
    finally
      myHttp.Free;
    end;
  end;

procedure TForm1.Button5Click(Sender: TObject);
  var
  ListNumbers: TStrings;
  jsonToSend: String;
  ListTexts: TStrings;
  Loop: String;
  listNumberJson: String;
  listTextsJson: String;
  myHttp: TIdHTTP;
  result: String;
  url: String;
  api_key: String;
  JObj: TJSONObject;
  StreamJsonToSend: TStringStream;
  gateway : String;
  begin
    api_key := Trim(apikey_txt.Text);
    gateway := Trim(gateway_txt.Text);
    myHttp := TIdHTTP.Create;
    myHttp.Request.ContentType := 'application/json';
    ListNumbers := TStringList.Create;
    ListTexts := TStringList.Create;
    try
      ExtractStrings([','], [], PChar(Trim(pair_to_pair_numbers_txt.Text)), ListNumbers);
      ExtractStrings([','], [], PChar(Trim(pair_to_pair_text_txt.Text)), ListTexts);
      listNumberJson := '"to":[';
      for Loop in ListNumbers do
      begin
        listNumberJson := listNumberJson + '"' + Loop + '",';
      end;
      delete(listNumberJson,length(listNumberJson),1);
      listNumberJson := listNumberJson + ']';

      listTextsJson := '"text":[';
      for Loop in ListTexts do
      begin
        listTextsJson := listTextsJson + '"' + Loop + '",';
      end;
      delete(listTextsJson,length(listTextsJson),1);
      listTextsJson := listTextsJson + ']';


      jsonToSend := '{'+listNumberJson+', '+listTextsJson+
      ', "gateway": "' + gateway + '"}';
      StreamJsonToSend := TStringStream.Create(Utf8Encode(jsonToSend));

      url :=  'https://api.sabanovin.com/v1/' + api_key + '/sms/send_array.json';
      try
        result := myHttp.Post(url, StreamJsonToSend);
        result_txt.Text := result;
        JObj := TJSONObject.ParseJSONValue(result) as TJSONObject;
        response_code_txt.Text := JObj.GetValue<string>('status.code');
        message_txt.Text := JObj.GetValue<string>('status.message');
      finally
        myHttp.Free;
      end;

    finally
      ListNumbers.Free;
    end;
  end;

end.
