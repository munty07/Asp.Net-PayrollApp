using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Add : System.Web.UI.Page
{
    OracleParameter p1, p2, p3, p4, p5, p6, p7, p8;
    OracleConnection conn, conn1;
    OracleCommand cmd, cmd1;
    OracleDataAdapter da;
    OracleDataReader dr, dr1;
    DataSet ds;
    string str, str1, str2;

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DateTime data = DateTime.Now;
        lblData.Text = data.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.PostedFile != null)
            {
                conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
                conn.Open();

                p1 = new OracleParameter();
                p2 = new OracleParameter();
                p3 = new OracleParameter();
                p4 = new OracleParameter();
                p5 = new OracleParameter();
                p6 = new OracleParameter();
                p7 = new OracleParameter();
                p8 = new OracleParameter();

                //Creare PostedFile (upload)
                HttpPostedFile File1 = FileUpload1.PostedFile;
                //Creare sir byte Array de lungimea fisierului
                byte[] Data = new Byte[File1.ContentLength];
                //Scriere continut fisier in sirul de bytes
                File1.InputStream.Read(Data, 0, File1.ContentLength);

                p1.Value = txtNume.Text;
                p2.Value = txtPrenume.Text;
                p3.Value = txtFunctie.Text;
                p4.Value = txtSalarBaza.Text;
                p5.Value = txtSpor.Text;
                p6.Value = txtPremiiBrute.Text;
                p7.Value = txtRetineri.Text;
                p8.Value = Data;


                str = "INSERT INTO salariati (nume, prenume, functie, salar_baza, spor, premii_brute, retineri, poza) VALUES(:1, :2, :3, :4, :5, :6, :7, :8)";
                cmd1 = new OracleCommand(str, conn);
                cmd1.Parameters.Add(p1);
                cmd1.Parameters.Add(p2);
                cmd1.Parameters.Add(p3);
                cmd1.Parameters.Add(p4);
                cmd1.Parameters.Add(p5);
                cmd1.Parameters.Add(p6);
                cmd1.Parameters.Add(p7);
                cmd1.Parameters.Add(p8);
                cmd1.ExecuteNonQuery();


                //preluare date din BD
                str1 = "SELECT total_brut, cas, cass, brut_impozabil, impozit, virat_card FROM salariati WHERE nume ='" + txtNume.Text + "'AND prenume = '" + txtPrenume.Text + "'";
                cmd = new OracleCommand(str1, conn);
                dr = cmd.ExecuteReader();
                //citire o linie (prima linie returnata de Select)
                dr.Read();

                //popularea textbox-urilor
                txtTotalBrut.Text = dr["total_brut"].ToString();
                txtCAS.Text = dr["cas"].ToString();
                txtCASS.Text = dr["cass"].ToString();
                txtBrutImpozabil.Text = dr["brut_impozabil"].ToString();
                txtImpozit.Text = dr["impozit"].ToString();
                txtViratCard.Text = dr["virat_card"].ToString();

                dr.Close();
                conn.Close();

                lblError.Text = "Angajatul a fost adaugat cu succes!";
                lblError.ForeColor = System.Drawing.Color.Green;

                try
                {
                    string st = "DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT";
                    conn1 = new OracleConnection(st);
                    conn1.Open();

                    str2 = "SELECT poza FROM salariati WHERE nume = '" + txtNume.Text + "' AND prenume = '" + txtPrenume.Text + "'";
                    cmd1 = new OracleCommand(str2, conn1);
                    //DataReader
                    dr1 = cmd1.ExecuteReader();
                    dr1.Read();

                    BinaryWriter Writer = null;
                    string Name = AppDomain.CurrentDomain.BaseDirectory.ToString() + "Poza-" + txtNume.Text + "-" + txtPrenume.Text + ".jpg";
                    Writer = new BinaryWriter(File.OpenWrite(Name));
                    Writer.Write((byte[])dr1["poza"]);
                    Writer.Flush();
                    Writer.Close();

                    dr1.Close();
                    conn1.Close();

                    Image1.ImageUrl = "Poza-" + txtNume.Text + "-" + txtPrenume.Text + ".jpg";
                }
                catch (Exception ex)
                {
                    Image1.ImageUrl = null;
                }

            }
        }
        catch (Exception ex)
        {
            lblError.Text = "Introduceti toate datele care sunt marcare cu steluta(*) !!";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtNume.Text = "";
        txtPrenume.Text = "";
        txtFunctie.Text = "";
        txtSalarBaza.Text = "";

        txtSpor.Text = "0";
        txtPremiiBrute.Text = "0";
        txtRetineri.Text = "0";

        txtTotalBrut.Text = "";
        txtCAS.Text = "";
        txtCASS.Text = "";
        txtBrutImpozabil.Text = "";
        txtImpozit.Text = "";
        txtViratCard.Text = "";

        lblError.Text = "";

        Image1.ImageUrl = null;
    }
}