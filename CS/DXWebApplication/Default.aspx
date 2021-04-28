<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DXWebApplication14.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.ASPxGantt.v20.1, Version=20.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGantt" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
</head>
<body>
    <form id="form1" runat="server">
    <div> <dx:ASPxGantt ID="Gantt" runat="server" Height="700" Width="100%" ClientInstanceName="clientGantt" EnableViewState="false"
        TasksDataSourceID="TasksDataSource" 
        DependenciesDataSourceID="DependenciesDataSource" 
        ResourcesDataSourceID="ResourcesDataSource" 
        ResourceAssignmentsDataSourceID="ResourceAssignmentsDataSource">
        <SettingsEditing Enabled="true" />
            <SettingsGanttView ShowResources="true" TaskTitlePosition="Outside" ViewType="Months" />
            <SettingsStripLine ShowCurrentTime="true" />
            <SettingsToolbar>
                <Items>
                    <dx:GanttZoomInToolbarItem Text="Zoom In" />
                    <dx:GanttZoomOutToolbarItem Text="Zoom Out" />
                    <dx:GanttCollapseAllToolbarItem Text="Collapse all" />
                    <dx:GanttExpandAllToolbarItem Text="Expand all" />
                    <dx:GanttFullScreenToolbarItem Text="Full screen" />
                    <dx:GanttCustomToolbarItem Text="Custom" CommandName="custom1" />
                </Items>
            </SettingsToolbar>
       <SettingsTaskList AllowSort="true" Width="500">
                <Columns>
                    <dx:GanttTextColumn FieldName="Subject"  Caption="Title"  Width="300px" />
                    <dx:GanttDateTimeColumn FieldName="StartDate" Caption="Start" Width="100px" />
                    <dx:GanttDateTimeColumn FieldName="EndDate" Caption="End"  Width="100px"  />
                </Columns>
            </SettingsTaskList>
        <Mappings>
            <Task Key="ID" ParentKey="ParentID" Title="Subject" Start="StartDate" End="EndDate" Progress="PercentComplete" />
            <Dependency Key="ID" PredecessorKey="ParentID" SuccessorKey="DependentID" DependencyType="Type" />
            <Resource Key="ID" Name="Name" />
            <ResourceAssignment Key="ID" TaskKey="TaskID" ResourceKey="ResourceID" />
        </Mappings>
        <SettingsGanttView ViewType="Weeks" />
    </dx:ASPxGantt>
    <asp:ObjectDataSource ID="TasksDataSource" runat="server" DataObjectTypeName="Task" TypeName="GanttDataProvider" SelectMethod="GetTasks" UpdateMethod="UpdateTask" InsertMethod="InsertTask" DeleteMethod="DeleteTask" />
    <asp:ObjectDataSource ID="DependenciesDataSource" runat="server" DataObjectTypeName="Dependency" TypeName="GanttDataProvider" SelectMethod="GetDependencies" InsertMethod="InsertDependency" DeleteMethod="DeleteDependency" />
    <asp:ObjectDataSource ID="ResourcesDataSource" runat="server" DataObjectTypeName="Resource" TypeName="GanttDataProvider" SelectMethod="GetResources" UpdateMethod="UpdateResource" InsertMethod="InsertResource" DeleteMethod="DeleteResource" />
    <asp:ObjectDataSource ID="ResourceAssignmentsDataSource" runat="server" DataObjectTypeName="ResourceAssignment" TypeName="GanttDataProvider" SelectMethod="GetResourceAssignments" InsertMethod="InsertResourceAssignment" DeleteMethod="DeleteResourceAssignment"  />
    </div>
    </form>
</body>
</html>
