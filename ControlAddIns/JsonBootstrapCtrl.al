controladdin JsonBootstrapCtrl
{
    Scripts = 'https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js',
              'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js',
              'https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js';
    StartupScript = 'Scripts/JsonBSCtrlStart.js';
    StyleSheets = 'https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css';
    //Images = 'images/images.jpg';

    RequestedHeight = 300;
    RequestedWidth = 300;
    MinimumHeight = 150;
    MinimumWidth = 300;

    VerticalShrink = true;
    VerticalStretch = true;

    HorizontalShrink = true;
    HorizontalStretch = true;

    event ControlAddInReady();
    procedure GetCustomer(Customer: Text);
}