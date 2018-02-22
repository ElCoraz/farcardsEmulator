//****************************************************************************//
unit Unit3;
//****************************************************************************//
interface
//****************************************************************************//
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit1, StdCtrls;
//****************************************************************************//
type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure SetValues();
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Count : DWORD;
    TransInfoPointer : Pointer;
  end;
//****************************************************************************//
var
  i : DWORD;
  Form3 : TForm3;
//****************************************************************************//
implementation
//****************************************************************************//
{$R *.dfm}
//****************************************************************************//
procedure TForm3.FormActivate(Sender: TObject);
begin
  Label27.Caption := '1 из ' + IntToStr(Count);

  i:= 0;

  SetValues();
end;
//****************************************************************************//
procedure TForm3.Button1Click(Sender: TObject);
begin
  if (i > 0) then
   begin
    i:= i - 1;
   end
  else
   begin
    i:= 0;
   end;

  SetValues();

  Label27.Caption := IntToStr(i + 1) + ' из ' + IntToStr(Count);
end;
//****************************************************************************//
procedure TForm3.Button2Click(Sender: TObject);
begin
  i:= i + 1;

  if (i >= (Count - 1)) then
   begin
    i:= Count - 1;
   end;

  SetValues();

  Label27.Caption := IntToStr(i + 1) + ' из ' + IntToStr(Count);
end;
//****************************************************************************//
procedure TForm3.SetValues();
var
j, Address : Integer;
TransInfo : Array [0..9] of TTransInfo;
begin
  Address := Integer(TransInfoPointer);

  for j := 0 to Count - 1 do
  begin
    TransInfo[j] := PTransInfo(Ptr(Address))^;

    Inc(Address, sizeof(TTransInfo));
  end;

  Edit1.Text := IntToStr(TransInfo[i].size);
  Edit2.Text := IntToStr(TransInfo[i].card);
  Edit3.Text := IntToStr(TransInfo[i].owner_id);
  Edit4.Text := IntToStr(TransInfo[i].account_num);
  Edit5.Text := IntToStr(TransInfo[i].transaction_type);
  Edit6.Text := IntToStr(TransInfo[i].summ);
  Edit7.Text := IntToStr(TransInfo[i].restaran_code);
  Edit8.Text := IntToStr(TransInfo[i].date);
  Edit9.Text := IntToStr(TransInfo[i].cass_num);
  Edit10.Text := IntToStr(TransInfo[i].check_num);
  Edit11.Text := IntToStr(TransInfo[i].summ_with_tax_a);
  Edit12.Text := IntToStr(TransInfo[i].tax_a_percent);
  Edit13.Text := IntToStr(TransInfo[i].summ_with_tax_b);
  Edit14.Text := IntToStr(TransInfo[i].tax_b_precent);
  Edit15.Text := IntToStr(TransInfo[i].summ_with_tax_c);
  Edit16.Text := IntToStr(TransInfo[i].tax_c_percent);
  Edit17.Text := IntToStr(TransInfo[i].summ_with_tax_d);
  Edit18.Text := IntToStr(TransInfo[i].tax_d_percent);
  Edit19.Text := IntToStr(TransInfo[i].summ_with_tax_e);
  Edit20.Text := IntToStr(TransInfo[i].tax_e_percent);
  Edit21.Text := IntToStr(TransInfo[i].summ_with_tax_f);
  Edit22.Text := IntToStr(TransInfo[i].tax_f_percent);
  Edit23.Text := IntToStr(TransInfo[i].summ_with_tax_g);
  Edit24.Text := IntToStr(TransInfo[i].tax_g_percent);
  Edit25.Text := IntToStr(TransInfo[i].summ_with_tax_h);
  Edit26.Text := IntToStr(TransInfo[i].tax_h_percent);
end;
//****************************************************************************//
end.
//****************************************************************************//
