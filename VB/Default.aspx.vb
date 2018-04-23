Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web
Imports System.Data

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub ASPxGridView1_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewClientJSPropertiesEventArgs)
        Dim cities(ASPxGridView1.VisibleRowCount - 1)() As String

        For r As Integer = 0 To ASPxGridView1.VisibleRowCount - 1
            Dim dr() As Object = TryCast(ASPxGridView1.GetRowValues(r, "Name", "Latitude", "Longitude"), Object())
            cities(r) = dr.Select(Function(o) CStr(o)).ToArray()
        Next r
        e.Properties("cpCities") = cities
    End Sub
End Class