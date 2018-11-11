pageextension 50106 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here

        addafter(General)
        {
            group(Angular)
            {
                part(AngularCardPart; AngularCtrlCardPart)
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field ("No.");
                }
            }
        }

        addfirst(FactBoxes)
        {
            part(JsonBSCardPart; JsonBootstrapCardPart)
            {
                ApplicationArea = All;
                SubPageLink = "No." = field ("No.");
            }
        }

    }

    actions
    {
        addlast("F&unctions")
        {
            action(ShowJson)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    jsonObj: JsonObject;
                    jsonArr: JsonArray;
                    lrrRecRef: RecordRef;
                    ltxtResult: text;
                begin
                    lrrRecRef.GetTable(Rec);
                    fctSerializeRecord(lrrRecRef).WriteTo(ltxtResult);
                    Message(ltxtResult);
                end;
            }
        }
    }

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
}