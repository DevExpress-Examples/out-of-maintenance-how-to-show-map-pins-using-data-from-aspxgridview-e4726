<%@ page language="vb" autoeventwireup="true" codefile="Default.aspx.vb" inherits="_Default" %>

<%@ register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show map pins using data from ASPxGridView</title>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/17.1.7/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/17.1.7/css/dx.light.css" />

    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/17.1.7/js/dx.all.js"></script>


    <script type="text/javascript">
        function addCityPins() {
            var pins = [];
            for (var city = 0; city < grid.cpCities.length; city++) {
                pins.push({
                    location: [grid.cpCities[city][1], grid.cpCities[city][2]]
                });
            }
            var map = $("#map").dxMap("instance");
            map.option("markers", pins);
        }

		function createMap() {
            $("#map").dxMap({
                zoom: 9,
                width: "100%",
                height: 400
            });
            addCityPins();
		}

		function onBeginCallback(s, e) {
			if (e.command == 'APPLYCOLUMNFILTER' || e.command == 'APPLYFILTER') {
				filtering = true;
			}
		}

		function onEndCallback(s, e) {
			if (filtering) {
				filtering = false;
				addCityPins();
			}
		}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:AccessDataSource ID="MainSource" runat="server" DataFile="~/App_Data/DBCities.mdb" SelectCommand="SELECT * FROM [Cities]" />
            <div id="map"></div>
            <table>
                <tr>
                    <td style="vertical-align: top">
                        <dx:aspxgridview id="ASPxGridView1" runat="server" autogeneratecolumns="False" width="200" settings-showcolumnheaders="false" datasourceid="MainSource" keyfieldname="Id" clientinstancename="grid" settingsbehavior-allowfocusedrow="false" oncustomjsproperties="ASPxGridView1_CustomJSProperties">
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" />
                        <ClientSideEvents Init="createMap" BeginCallback="onBeginCallback" EndCallback="onEndCallback" />
                    </dx:aspxgridview>
                    </td>
                    <td>
                        <div id="myMap" style="position: relative; width: 800px; height: 600px;"></div>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>