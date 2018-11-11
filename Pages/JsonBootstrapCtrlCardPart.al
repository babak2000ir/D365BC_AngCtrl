page 50102 JsonBootstrapCardPart
{
    PageType = CardPart;
    SourceTable = Customer;
    Caption = 'Json Bootstrap JQuery Control';

    layout
    {
        area(content)
        {
            usercontrol(Ctrl; JsonBootstrapCtrl)
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    blnAddInIsReady := true;
                    GetCustomer();
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        GetCustomer();
    end;

    procedure GetCustomer();
    var
        lrrRecRef: RecordRef;
        ltxtResult: Text;
    begin
        if blnAddInIsReady then begin
            lrrRecRef.GetTable(Rec);
            fctSerializeRecord(lrrRecRef).WriteTo(ltxtResult);
            currpage.Ctrl.GetCustomer(ltxtResult);
        end;
    end;

    local procedure fctSerializeRecord(prrRecordRef: RecordRef): JsonObject
    var
        lintFieldCount: Integer;
        lintCounter: Integer;
        lJsonObj: JsonObject;
        ltxtKey: text;
        ltxtValue: text;
    begin
        lintFieldCount := prrRecordRef.FieldCount();
        for lintCounter := 1 to lintFieldCount do begin
            ltxtKey := Format(prrRecordRef.FieldIndex(lintCounter).Name());
            ltxtValue := Format(prrRecordRef.FieldIndex(lintCounter).Value());
            lJsonObj.Add(ltxtKey, ltxtValue);
        end;

        exit(lJsonObj);

    end;

    var
        blnAddInIsReady: Boolean;

}