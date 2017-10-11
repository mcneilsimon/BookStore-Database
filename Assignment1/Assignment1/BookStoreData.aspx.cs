using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class BookStoreData : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                TextBox dateTextBox = (TextBox)GridView1.FooterRow.FindControl("txtDatePublished");
                dateTextBox.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));

                con.Open();
                string queryForBookTitleList = "select BookTitle from BookStore";
                SqlCommand cmd = new SqlCommand(queryForBookTitleList, con);
                SqlDataReader dr = cmd.ExecuteReader();

                //Sets bookTitle drop down list
                while (dr.Read())
                {
                    selectBookDropDown.Items.Add(dr[0].ToString());
                }

                con.Close();

                con.Open();

                string queryForCategoryList = "select distinct Category from BookStore";
                SqlCommand cmdForCateogryList = new SqlCommand(queryForCategoryList, con);
                SqlDataReader drForCategoryList = cmdForCateogryList.ExecuteReader();

                //Setes category dropdown list
                while (drForCategoryList.Read())
                {
                    selectCategoryDropDown.Items.Add(drForCategoryList[0].ToString());
                }

                con.Close();
            }
            


        }

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            TextBox dateTextBox = (TextBox)GridView1.FooterRow.FindControl("txtDatePublished");
            dateTextBox.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));

            SqlDataSource1.InsertParameters["BookTitle"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtBookTitle")).Text;
            SqlDataSource1.InsertParameters["Authors"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAuthor")).Text;
            SqlDataSource1.InsertParameters["ISBN"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtInsertISBN")).Text;
            SqlDataSource1.InsertParameters["DatePublished"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtDatePublished")).Text;
            SqlDataSource1.InsertParameters["Publisher"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlPublisher")).SelectedValue;
            SqlDataSource1.InsertParameters["Category"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlCategory")).SelectedValue;
            SqlDataSource1.InsertParameters["PageCount"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPageCount")).Text;
            SqlDataSource1.InsertParameters["Price"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtPrice")).Text;

            SqlDataSource1.Insert();

            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        protected void selectBookDropDown_SelectedIndexChanged1(object sender, EventArgs e)
        {

            con.Open();
            string query = "select * from BookStore where BookTitle='" + selectBookDropDown.SelectedItem + "'";

            SqlDataSource1.SelectCommand = query;
            GridView1.ShowFooter = false;
            
            GridView1.DataBind();
            GridView1.Columns[0].Visible = false;
            con.Close();

            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        private void UpdateDropDownList()
        {
            
            con.Open();
            selectBookDropDown.Items.Clear();
            selectBookDropDown.Items.Add("-----------SELECT BOOK TITLE-------------");
            string query = "select BookTitle from BookStore";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                selectBookDropDown.Items.Add(dr[0].ToString());
            }
            con.Close();
        }

        private void UpdateDropDownCategoryList()
        {
            
            con.Open();
            selectCategoryDropDown.Items.Clear();
            selectCategoryDropDown.Items.Add("-------------SELECT BOOK CATEGORY---------------");
            string query = "select distinct Category from BookStore";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                selectCategoryDropDown.Items.Add(dr[0].ToString());
            }
            con.Close();

            
            TextBox dateTextBox = (TextBox)GridView1.FooterRow.FindControl("txtDatePublished");
            dateTextBox.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));
        }

        protected void btnShowData_Click(object sender, EventArgs e)
        {
            TextBox dateTextBox = (TextBox)GridView1.FooterRow.FindControl("txtDatePublished");
            dateTextBox.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));

            con.Open();
            GridView1.Columns[0].Visible = true;
            GridView1.ShowFooter = true;
            selectBookDropDown.SelectedIndex = selectBookDropDown.Items.IndexOf(selectBookDropDown.Items.FindByValue("-------------------"));

            string queryForTableDisplay = "select * from BookStore";

            SqlDataSource1.SelectCommand = queryForTableDisplay;
            GridView1.DataBind();
            con.Close();

            UpdateDropDownList();
            UpdateDropDownCategoryList();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            SqlCommand cmd = new SqlCommand("delete from BookStore where ID=" + id, con);
            con.Open();
            cmd.ExecuteNonQuery();           
            GridView1.DataBind();
            con.Close();

            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        protected void selectCategoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

            con.Open();
            string query = "select * from BookStore where Category='" + selectCategoryDropDown.SelectedItem + "'";

            SqlDataSource1.SelectCommand = query;
            GridView1.ShowFooter = false;

            GridView1.DataBind();
            GridView1.Columns[0].Visible = false;
            con.Close();

            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        protected void btnFilterPrice_Click(object sender, EventArgs e)
        {
            TextBox dateTextBox = (TextBox)GridView1.FooterRow.FindControl("txtDatePublished");
            dateTextBox.Attributes.Add("max", DateTime.Now.ToString("yyyy-MM-dd"));

            string priceValue = (txtBoxPrice.Text).ToString();

            con.Open();

            string query = "select * from BookStore where Price >" + priceValue;
            SqlDataSource1.SelectCommand = query;
            GridView1.ShowFooter = false;

            GridView1.DataBind();
            GridView1.Columns[0].Visible = false;
            con.Close();

            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.ShowFooter = true;
            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.ShowFooter = false;
            UpdateDropDownList();
            UpdateDropDownCategoryList();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            UpdateDropDownList();
            UpdateDropDownCategoryList();
            GridView1.ShowFooter = true;
        }
    }
}