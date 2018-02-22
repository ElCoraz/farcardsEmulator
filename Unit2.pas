//****************************************************************************//
unit Unit2;
//****************************************************************************//
interface
//****************************************************************************//
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit1, StdCtrls;
//****************************************************************************//
type
  TForm2 = class(TForm)
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
    procedure SetInfo(_CardInfo: PCardInfo);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//****************************************************************************//
var
  Form2: TForm2;
  CardInfo: PCardInfo;
//****************************************************************************//
implementation
//****************************************************************************//
{$R *.dfm}
//****************************************************************************//
procedure TForm2.SetInfo(_CardInfo: PCardInfo);
begin
   CardInfo := _CardInfo;
end;
//****************************************************************************//
procedure TForm2.FormActivate(Sender: TObject);
begin
  Edit1.Text := IntToStr(CardInfo.size);
  Edit2.Text := IntToStr(CardInfo.deleted);
  Edit3.Text := IntToStr(CardInfo.nedd_withdraw);
  Edit4.Text := IntToStr(CardInfo.expired);
  Edit5.Text := IntToStr(CardInfo.not_valid);
  Edit6.Text := IntToStr(CardInfo.manager_confirm);
  Edit7.Text := IntToStr(CardInfo.blocked);
  Edit8.Text := CardInfo.block_reason;
  Edit9.Text := CardInfo.card_owner;
  Edit10.Text := IntToStr(CardInfo.owner_id);
  Edit11.Text := IntToStr(CardInfo.account_number);
  Edit12.Text := IntToStr(CardInfo.not_pay_type);
  Edit13.Text := IntToStr(CardInfo.bonus_num);
  Edit14.Text := IntToStr(CardInfo.discount_num);
  Edit15.Text := IntToStr(CardInfo.max_discount);
  Edit16.Text := IntToStr(CardInfo.access_amount1);
  Edit17.Text := IntToStr(CardInfo.access_amount2);
  Edit18.Text := IntToStr(CardInfo.access_amount3);
  Edit19.Text := IntToStr(CardInfo.access_amount4);
  Edit20.Text := IntToStr(CardInfo.access_amount5);
  Edit21.Text := IntToStr(CardInfo.access_amount6);
  Edit22.Text := IntToStr(CardInfo.access_amount7);
  Edit23.Text := IntToStr(CardInfo.access_amount8);
  Edit24.Text := CardInfo.comment;
  Edit25.Text := CardInfo.screen_comment;
  Edit26.Text := CardInfo.printer_comment;
end;
//****************************************************************************//
end.
//****************************************************************************//
