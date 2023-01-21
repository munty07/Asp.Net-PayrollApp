using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.Web;
using System.Data;

public partial class StergereAngajati : System.Web.UI.Page
{
    OracleConnection conn;
    OracleCommand cmd;
    OracleDataAdapter da;
    DataSet ds;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            btnRenuntare.Visible = false;
            btnSterge1.Visible = false;
            btnStergere.Visible = false;
            lblID.Visible = false;
            txtID.Visible = false;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DateTime data = DateTime.Now;
        lblData.Text = data.ToString();
    }
    
    protected void btnCauta_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtNume.Text == "")
            {
                lblError.Text = " Introduceti numele angajatului cautat. ";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
                str = "SELECT * FROM salariati WHERE nume = '" + txtNume.Text + "'";
                da = new OracleDataAdapter(str, conn);
                ds = new DataSet();
                da.Fill(ds, "salariati");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblError.Text = "Nu exista angajatul cu numele " + txtNume.Text;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    if (ds.Tables[0].Rows.Count == 1)
                    {
                        btnStergere.Visible = false;
                        lblID.Visible = false;
                        txtID.Visible = false;
                        btnSterge1.Visible = true;
                    }
                    else
                    {
                        lblError.Text = "Selectati angajatul pe care doriti sa-l stergeti!";
                        lblError.ForeColor = System.Drawing.Color.Blue;

                        btnSterge1.Visible = false;
                        btnStergere.Visible = true;
                        lblID.Visible = true;
                        txtID.Visible = true;
                    }
                    // ** Afişează datele
                    GridView1.DataSource = ds.Tables["salariati"].DefaultView;
                    GridView1.DataBind();
                    txtNume.Enabled = false;
                    btnRenuntare.Visible = true;
                    btnCauta.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            lblError.Text = " Introduceti numele angajatului cautat. ";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnStergere_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            conn.Open();
            str = "DELETE FROM salariati WHERE id = " + txtID.Text + " AND nume = '" + txtNume.Text + "'";
            cmd = new OracleCommand(str, conn);
            cmd.ExecuteNonQuery();

            lblError.Text = "Stergerea angajatului '" + txtNume.Text + "' a fost realizata cu SUCCES!";
            lblError.ForeColor = System.Drawing.Color.Green;

            conn.Close();

            txtNume.Text = "";
            txtID.Text = "";

            //aici se poate evental reincarca (Refresh) DataGrid
            str = "SELECT * FROM salariati";
            da = new OracleDataAdapter(str, conn);
            ds = new DataSet();
            da.Fill(ds, "salariati");
            GridView1.DataSource = ds.Tables["salariati"].DefaultView;
            GridView1.DataBind();

            btnStergere.Visible = false;
            btnCauta.Enabled = true;
            btnRenuntare.Visible = false;

            lblID.Visible = false;
            txtID.Visible = false;
            txtNume.Enabled = true;
        }
        catch (Exception ex)
        {
            lblError.Text = "Selectati angajatul pe care doriti sa-l stergeti!";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnSterge1_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            conn.Open();
            str = "DELETE FROM salariati WHERE nume = '" + txtNume.Text + "'";
            cmd = new OracleCommand(str, conn);
            cmd.ExecuteNonQuery();

            lblError.Text = "Stergerea angajatului '" + txtNume.Text + "' a fost realizata cu SUCCES!";
            lblError.ForeColor = System.Drawing.Color.Green;

            conn.Close();

            txtNume.Text = "";
            txtID.Text = "";

            //aici se poate evental reincarca (Refresh) DataGrid
            str = "SELECT * FROM salariati";
            da = new OracleDataAdapter(str, conn);
            ds = new DataSet();
            da.Fill(ds, "salariati");
            GridView1.DataSource = ds.Tables["salariati"].DefaultView;
            GridView1.DataBind();

            btnSterge1.Visible = false;
            btnRenuntare.Visible = false;
            btnCauta.Enabled = true;

            txtNume.Enabled = true;
        }
        catch (Exception ex)
        {
            lblError.Text = "Nu exista angajatul cu numele " + txtNume.Text;
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblError.Text = "";

        txtNume.Text = GridView1.SelectedRow.Cells[2].Text;
        if (txtID.Visible == true)
        {
            txtID.Text = GridView1.SelectedRow.Cells[1].Text;
        }
        else
        {
            btnSterge1.Visible = true;
        }
    }

    protected void btnRenuntare_Click(object sender, EventArgs e)
    {
        txtNume.Enabled = true;
        txtNume.Text = "";

        txtID.Visible = false;
        lblID.Visible = false;

        btnSterge1.Visible = false;
        btnStergere.Visible = false;

        btnRenuntare.Visible = false;

        GridView1.DataSource = null;
        GridView1.DataBind();

        btnCauta.Enabled = true;
    }
}