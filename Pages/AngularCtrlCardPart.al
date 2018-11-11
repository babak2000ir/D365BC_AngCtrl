page 50103 AngularCtrlCardPart
{
    PageType = CardPart;
    SourceTable = Customer;
    Caption = 'Angular Control';

    layout
    {
        area(content)
        {
            usercontrol(Ctrl; AngularCtrl)
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    blnAddInIsReady := true;
                    //GetCustomer();
                    //CurrPage.Ctrl.LoadAngularScripts();
                end;
            }
        }
    }

    var
        blnAddInIsReady: Boolean;


}