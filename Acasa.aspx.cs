using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DateTime data = DateTime.Now;
        lblData.Text = data.ToString();

        Random rand = new Random();
        int i = rand.Next(1, 5);
        int j = rand.Next(0, 4);
        string[] sir = new string[100];
        sir[0] = "image1.jpg";
        sir[1] = "image2.jpg";
        sir[2] = "image3.jpg";
        sir[3] = "image4.jpg";
        Image1.ImageUrl = "~/img/" + sir[i-1];
        Image2.ImageUrl = "~/img/" + sir[j];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Image1.ImageUrl = "~/img/image1.jpg";
            Image2.ImageUrl = "~/img/image4.jpg";

        }
    }
}