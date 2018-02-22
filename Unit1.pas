//****************************************************************************//
unit Unit1;
//****************************************************************************//
interface
//****************************************************************************//
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;
//****************************************************************************//
type
  //**************************************************************************//
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //**************************************************************************//
  PCardInfo = ^TCardInfo;
  TCardInfo = packed record
    size : Word;
    deleted : Byte;
    nedd_withdraw : Byte;
    expired : Byte;
    not_valid : Byte;
    manager_confirm : Byte;
    blocked : Byte;
    block_reason : Array[0..255] of Char;
    card_owner : Array[0..39] of Char;
    owner_id : Int64;
    account_number : DWORD;
    not_pay_type : DWORD;
    bonus_num : Word;
    discount_num : Word;
    max_discount : Int64;
    access_amount1 : Int64;
    access_amount2 : Int64;
    access_amount3 : Int64;
    access_amount4 : Int64;
    access_amount5 : Int64;
    access_amount6 : Int64;
    access_amount7 : Int64;
    access_amount8 : Int64;
    comment : Array[0..255] of Char;
    screen_comment : Array[0..255] of Char;
    printer_comment : Array[0..255] of Char;
  end;
  //**************************************************************************//
  PTransInfo = ^TTransInfo;
  TTransInfo = packed record
   size : Word;
   card : Int64;
   owner_id : Int64;
   account_num : DWORD;
   transaction_type : Byte;
   summ : Int64;
   restaran_code : Word;
   date : DWORD;
   cass_num : Byte;
   check_num : DWORD;
   summ_with_tax_a : Int64;
   tax_a_percent : Word;
   summ_with_tax_b : Int64;
   tax_b_precent : Word;
   summ_with_tax_c : Int64;
   tax_c_percent : Word;
   summ_with_tax_d : Int64;
   tax_d_percent : Word;
   summ_with_tax_e : Int64;
   tax_e_percent : Word;
   summ_with_tax_f : Int64;
   tax_f_percent : Word;
   summ_with_tax_g : Int64;
   tax_g_percent : Word;
   summ_with_tax_h : Int64;
   tax_h_percent : Word;
  end;
  //**************************************************************************//
  TGetCardInfoEx = function (Card:Int64; Restaurant:DWORD; UnitNo:DWORD; Info:PCardInfo; InpBuf:PChar; InpLen:DWORD; InpKind:Byte; OutBuf:PChar; OutLen:PDWORD; OutKind:PByte): Integer; stdcall;
  TTransactionsEx = function (Count:DWORD; List:Pointer; InpBuf:PChar; InpLen:DWORD; InpKind:Byte; OutBuf:PChar; OutLen:PDWORD; OutKind:PDWORD): Integer ; stdcall;
  //**************************************************************************//
var
  Form1: TForm1;
  LibHandle : THandle;
  GetCardInfoEx : TGetCardInfoEx;
  TransactionsEx : TTransactionsEx;
//****************************************************************************//
  EXIT_FAILURE : Integer;
  EXIT_SUCCESS : Integer;
//****************************************************************************//
implementation
//****************************************************************************//
uses Unit2, Unit3;
//****************************************************************************//
{$R *.dfm}
//****************************************************************************//
procedure TForm1.Button1Click(Sender: TObject);
var
 Result : Integer;
 OutLen : DWORD;
 InpBuf : Array [0..255] of Char;
 OutBuf : Array [0..255] of Char;
 OutKind : Byte;
 CardInfo : PCardInfo;
begin
 if (Length(Edit1.Text) = 0) then
 begin
    MessageDlg('Введите номер карточки!', mtError, [mbOK], 0);
    exit;
 end;

 CardInfo := GetMemory(1164);

 ZeroMemory(@InpBuf, 255);
 ZeroMemory(@OutBuf, 255);

 ZeroMemory(CardInfo, 1164);

 CardInfo.size := 1164;

 OutLen := 255;
 OutKind := 0;

 Result := GetCardInfoEx(StrToInt64(Edit1.Text), 0, 0, CardInfo, @InpBuf, 255, 0, @OutBuf, @OutLen, @OutKind);

 if (Result = EXIT_SUCCESS) then
 begin
    Form2.SetInfo(CardInfo);
    Form2.ShowModal;
 end;

 if (Result = EXIT_FAILURE) then
 begin
    MessageDlg('Карточка с номером - ' + Edit1.Text + ' не найдена!', mtError, [mbOK], 0);
 end;

end;
//****************************************************************************//
procedure TForm1.Button2Click(Sender: TObject);
var
 i : Integer;
 List : packed Array of PTransInfo;
 Count : DWORD;
 Result : Integer;
 OutLen : DWORD;
 InpBuf : Array [0..255] of Char;
 OutBuf : Array [0..255] of Char;
 OutKind : Byte;
 TransInfo : Array [0..9] of TTransInfo;
begin
 if (Length(Edit2.Text) = 0) then
 begin
    MessageDlg('Введите номер карточки!', mtError, [mbOK], 0);
    exit;
 end;

 Count := RandomRange(5, 10);

 ZeroMemory(@InpBuf, 255);
 ZeroMemory(@OutBuf, 255);

 GetMem(List, Count * sizeof(TTransInfo));

 for i := 0 to Count - 1 do
 begin
  List[i] := AllocMem(sizeof(TTransInfo));
  List[i].size := sizeof(TTransInfo);
  List[i].card := StrToInt64(Edit2.Text);
  List[i].summ := RandomRange(1, 10000000);
  List[i].restaran_code := RandomRange(1, 10);
  List[i].summ_with_tax_a := RandomRange(1, 10000000);
  List[i].transaction_type := RadioGroup1.ItemIndex;
 end;

 Result := TransactionsEx(Count, List, @InpBuf, 0, 0, @OutBuf, @OutLen, @OutKind);

 if (Result = EXIT_SUCCESS) then
 begin
   for i := 0 to Count - 1 do
   begin
     TransInfo[i].size := List[i].size;
     TransInfo[i].card := List[i].card;
     TransInfo[i].owner_id := List[i].owner_id;
     TransInfo[i].account_num := List[i].account_num;
     TransInfo[i].transaction_type := List[i].transaction_type;
     TransInfo[i].summ := List[i].summ;
     TransInfo[i].restaran_code := List[i].restaran_code;
     TransInfo[i].date := List[i].date;
     TransInfo[i].cass_num := List[i].cass_num;
     TransInfo[i].check_num := List[i].check_num;
     TransInfo[i].summ_with_tax_a := List[i].summ_with_tax_a;
     TransInfo[i].tax_a_percent := List[i].tax_a_percent;
     TransInfo[i].summ_with_tax_b := List[i].summ_with_tax_b;
     TransInfo[i].tax_b_precent := List[i].tax_b_precent;
     TransInfo[i].summ_with_tax_c := List[i].summ_with_tax_c;
     TransInfo[i].tax_c_percent := List[i].tax_c_percent;
     TransInfo[i].summ_with_tax_d := List[i].summ_with_tax_d;
     TransInfo[i].tax_d_percent := List[i].tax_d_percent;
     TransInfo[i].summ_with_tax_e := List[i].summ_with_tax_e;
     TransInfo[i].tax_e_percent := List[i].tax_e_percent;
     TransInfo[i].summ_with_tax_f := List[i].summ_with_tax_f;
     TransInfo[i].tax_f_percent := List[i].tax_f_percent;
     TransInfo[i].summ_with_tax_g := List[i].summ_with_tax_g;
     TransInfo[i].tax_g_percent := List[i].tax_g_percent;
     TransInfo[i].summ_with_tax_h := List[i].summ_with_tax_h;
     TransInfo[i].tax_h_percent := List[i].tax_h_percent;
   end;

   Form3.TransInfoPointer := Addr(TransInfo);
   Form3.Count := Count;
   Form3.ShowModal;
 end;

 if (Result = EXIT_FAILURE) then
 begin
    MessageDlg('Ошибка в транзакциях', mtError, [mbOK], 0);
 end;
end;
//****************************************************************************//
procedure TForm1.FormCreate(Sender: TObject);
begin
  LibHandle:= LoadLibrary('loyal.dll');

  if LibHandle = 0 then
  begin
    MessageDlg('Библиотека не найдена', mtError, [mbOK], 0);
    Exit;
  end;

  @GetCardInfoEx:= GetProcAddress(LibHandle, 'GetCardInfoEx');

  if @GetCardInfoEx = nil then
  begin
    MessageDlg('Функция GetCardInfoEx не найдена', mtError, [mbOK], 0);
  end;

  @TransactionsEx:= GetProcAddress(LibHandle, 'TransactionsEx');

  if @TransactionsEx = nil then
  begin
    MessageDlg('Функция TransactionsEx не найдена', mtError, [mbOK], 0);
  end;

  EXIT_FAILURE := 1;
  EXIT_SUCCESS := 0;

  Form2 := TForm2.Create(Form2);
  Form3 := TForm3.Create(Form3);
end;
//****************************************************************************//
procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeLibrary(LibHandle);
end;
//****************************************************************************//
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9', #8])) then
  begin
    Key := #0;
  end;
end;
//****************************************************************************//
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9', #8])) then
  begin
    Key := #0;
  end;
end;
//****************************************************************************//
end.
//****************************************************************************//
