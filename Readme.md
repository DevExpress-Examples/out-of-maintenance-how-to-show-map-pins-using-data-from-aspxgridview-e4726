<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# How to show map pins using data from ASPxGridView
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4726/)**
<!-- run online end -->


<p>To show dxMap, it is first necessary to create a div tag with an ID that will be used in code as a container. Then, handle the ASPxGridView's <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CustomJSPropertiestopic">CustomJSProperties</a> event that allows passing a custom array of city names and their coordinates from the server side to the client. After that, use this array in a function that creates a dxMap instance and shows map pins with names of the cities at required coordinates. Handle the client-side <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientControl_Inittopic">Init</a> event to show the map when the page is loaded. To show filtered results, handle the client-side <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_BeginCallbacktopic">BeginCallback</a> event to set a flag (the "filtering" variable) when the ASPxGridView executes filter commands. Finally, handle <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_EndCallbacktopic">EndCallback</a>, which fires only when the flag is set and reset map markers.<br>dxMap is created in the createMap function on the client side. And then, map properties are set to dxMap's <em>markers</em> option. Iterate through the cities' array stored in the ASPxClientGrid's "cpCities" JS property and create a pins array. After that, assign this array to the markers option using the <a href="https://js.devexpress.com/Documentation/ApiReference/UI_Widgets/dxMap/Methods/#optionoptionName_optionValue">option</a> method. Refer to the <a href="https://js.devexpress.com/Documentation/ApiReference/UI_Widgets/dxMap/">dxMap</a> topic to get more information about dxMap.<br><br><strong>For versions older than 17.1, see implementation details below.</strong></p>

<br/>


