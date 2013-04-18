unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
  notifi: IToastNotification;
  notificationSender: IWindowsPhoneNotification;
begin
 notifi := CoToastNotification.Create;
 notifi.Toast := CoToast.Create;
 notifi.Toast.Text1 := 'From';
 notifi.Toast.Text2 := 'Delphi';
 notifi.Toast.PathToOpen := '/MainPage.xaml';

 notificationSender := CoWindowsPhoneNotification.Create;
 notificationSender.Notification := notifi as INotification;
 notificationSender.UrlToNotify := 'http://sn1.notify.live.net/throttledthirdparty/01.00/AAGTMG_6IKDYQ6krMns3DE4wAgAAAAADVAAAAAQUZm52Ojg5RkRFN0JERkUyREE3MDM';
 notificationSender.SendNotification();
end;

end.
