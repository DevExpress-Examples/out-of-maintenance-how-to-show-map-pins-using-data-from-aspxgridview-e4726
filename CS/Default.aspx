<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.13.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show map pins using data from ASPxGridView</title>
        <script type="text/javascript" src="https://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>
    <script type="text/javascript">
        // <![CDATA[
        var filtering = false;

        var map = (function () {
            var bingMap = null;
            var mapElementID = "myMap";
            var key = 'AoQi8x29JLhh_iTsAec2pNK050bVHYJOI2G3sVgslKj0Bo1gP - nvP4263H4lFszY';

            function addPin(coords) {
                var location = new Microsoft.Maps.Location(coords[1], coords[2]);
                var pushpin = new Microsoft.Maps.Pushpin(location);
                pushpin.setOptions({ text: coords[0] });

                bingMap.entities.push(pushpin);
            }

            function addCityPins() {
                for (var city = 0; city < grid.cpCities.length; city++) {
                    addPin(grid.cpCities[city]);
                }
            }

            function createMap() {
                if (bingMap)
                    bingMap.dispose();

                var mapOptions = {
                    credentials: key,
                    center: new Microsoft.Maps.Location('39.106667', '-94.676389'),
                    mapTypeId: Microsoft.Maps.MapTypeId.road,
                    zoom: 4,
                }

                bingMap = new Microsoft.Maps.Map(document.getElementById(mapElementID), mapOptions);

                bingMap.entities.clear();

                addCityPins();
            };
            return {
                createMap: createMap,
            };
        })();
        // ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="MainSource" runat="server" DataFile="~/App_Data/DBCities.mdb" SelectCommand="SELECT * FROM [Cities]" />
        <table>
            <tr>
                <td style="vertical-align:top">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="200" Settings-ShowColumnHeaders="false" DataSourceID="MainSource" KeyFieldName="Id" ClientInstanceName="grid" SettingsBehavior-AllowFocusedRow="false" OnCustomJSProperties="ASPxGridView1_CustomJSProperties">
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" />
                        <ClientSideEvents Init="map.createMap" BeginCallback="function (s, e){ 
                            if (e.command == 'APPLYCOLUMNFILTER' || e.command == 'APPLYFILTER'){
                                filtering = true;
                            }
                        }" EndCallback="function (s, e){
                            if (filtering){
                                filtering = false;
                                map.createMap();
                            }
                        }" />
                    </dx:ASPxGridView>
                </td>
                <td>
                    <div id="myMap" style="position:relative; width:800px; height:600px;"></div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
