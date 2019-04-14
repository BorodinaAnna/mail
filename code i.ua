using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using OpenQA.Selenium;

namespace Автотест_ФБ
{
    public partial class Form1 : Form

    {
        IWebDriver Browser;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Browser = new OpenQA.Selenium.Chrome.ChromeDriver();
            Browser.Manage().Window.Maximize();
            Browser.Navigate().GoToUrl("https://www.i.ua/?_rand=1555235577");

            {
                IWebElement log = Browser.FindElement(By.XPath("//a[contains(@onclick, 'return i_showFloat(1);') and text() = 'Вход']"));
                log.Click();


                IWebElement email = Browser.FindElement(By.Name("login"));
                email.SendKeys("Team2_QA" + OpenQA.Selenium.Keys.Enter);
               

                IWebElement password = Browser.FindElement(By.Name("pass"));
                password.SendKeys("Anna1995" + OpenQA.Selenium.Keys.Enter);

                IWebElement make_messege = Browser.FindElement(By.ClassName("make_message"));
                make_messege.Click();

                IWebElement to = Browser.FindElement(By.Name("to"));
                to.SendKeys("Team2_QA@i.ua");

                IWebElement subject = Browser.FindElement(By.Name("subject"));
                subject.SendKeys("Test");

                IWebElement body = Browser.FindElement(By.Id("text"));
                body.SendKeys("Test");

                IWebElement send = Browser.FindElement(By.Name("send"));
                send.Click();

               

                IWebElement ins_start = Browser.FindElement(By.XPath("//li[contains(@class, 'current new') and text() = '19']"));

                double ins_Conv = Convert.ToDouble(ins_start);
                


                IWebElement make_messege2 = Browser.FindElement(By.ClassName("make_message"));
                make_messege.Click();

                IWebElement to2 = Browser.FindElement(By.Name("to"));
                to.SendKeys("Team2_QA@i.ua");

                IWebElement subject2 = Browser.FindElement(By.Name("subject"));
                subject.SendKeys("Test");

                IWebElement body2 = Browser.FindElement(By.Id("text"));
                body.SendKeys("Test");

                IWebElement send2 = Browser.FindElement(By.Name("send"));
                send.Click();

                IWebElement ins_finish = Browser.FindElement(By.XPath ("//li[contains(@class, 'current new') and text() = '20']"));
                double ins_Finish=Convert.ToDouble(ins_finish);


                if (ins_Finish < ins_Conv)
                {
                    Console.WriteLine($"Новых писем нет");
                }
                else
                {
                    Console.WriteLine("Пришло новое письмо");
                }




            }

          




        }
        

        private void button2_Click(object sender, EventArgs e)
        {
            Browser.Quit();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}
