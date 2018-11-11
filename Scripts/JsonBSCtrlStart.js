var ControlAddIn = document.getElementById("controlAddIn");

var BSDiv = document.createElement("div");
BSDiv.id = "bsDiv";
BSDiv.className = "container mt-3";

var inputtag = document.createElement("input");
inputtag.className = "form-control";
inputtag.id = "myInput";
inputtag.type = "text";
inputtag.placeholder ="Search In All Colums...";

BSDiv.appendChild(inputtag);

ControlAddIn.appendChild(BSDiv);

window.GetCustomer = function(customer){
    
    myObj = JSON.parse(customer);
    txt = "<div style='overflow-y:scroll; height:250px; width100%'><table class='table table-bordered table-striped'><tbody id='myTable'>";
    for (x in myObj) {
        txt += "<tr style='width100%'><th>" + x + "</th><td>"+ myObj[x] +"</td></tr>";
    }
    txt += "</tbody></table></div>";

    BSDiv.innerHTML += txt;
    


    $(document).ready(function(){
        $("#bsDiv")
        $("#myInput").on("keyup", function() {
          var value = $(this).val().toLowerCase();
          $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
          });
        });
      });
    
}


Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady',null);


