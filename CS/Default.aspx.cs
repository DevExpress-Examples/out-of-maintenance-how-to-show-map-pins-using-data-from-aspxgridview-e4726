using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxGridView1_CustomJSProperties(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewClientJSPropertiesEventArgs e)
    {
        String[][] cities = new String[ASPxGridView1.VisibleRowCount][];

        for (int r = 0; r < ASPxGridView1.VisibleRowCount; r++)
        {
            Object[] dr = ASPxGridView1.GetRowValues(r, "Name", "Latitude", "Longitude") as Object[];
            cities[r] = dr.Select(o => (string)o).ToArray();
        }
        e.Properties["cpCities"] = cities;
    }
}