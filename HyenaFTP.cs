﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using FluentFTP;

namespace FTP
{
    public partial class HyenaFTP : Form
    {
        public HyenaFTP()
        {
            InitializeComponent();
        }


        private void backgroundWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            var folderPath = txtPath.Text;
            using (var ftp = new FtpClient("192.10.10.227", txtUserName.Text, txtPassword.Text))
            {
                ftp.Connect();
                Action<FtpProgress> pro = new Action<FtpProgress> (s=> 
                {

                    AllbackgroundWorker.ReportProgress((int)s.FileIndex + 1, (int)s.FileCount);

                    backgroundWorker.ReportProgress((int)s.Progress, s.LocalPath);


                });

                ftp.UploadDirectory(folderPath, @"\" + txtUserName.Text, FtpFolderSyncMode.Update, FtpRemoteExists.Skip, FtpVerify.None, null, pro);

            }
        }
        private void AllbackgroundWorker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

            FilesinPro.Text = $"{e.ProgressPercentage} of {e.UserState} files in progress";
            AllprogressBar.Maximum = ((int)e.UserState);
            AllprogressBar.Value = e.ProgressPercentage;
            AllprogressBar.Update();
        }
        private void backgroundWorker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

            IblStatus.Text = $"{e.UserState} : {e.ProgressPercentage} %";
            progressBar.Value = e.ProgressPercentage;
            progressBar.Update();
        }


        private void backgroundWorker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            IblStatus.Text = "업로드가 완료되었습니다. Hyena페이지에서 FTP APPLY 버튼을 클릭하면 적용됩니다.";
        }


        private void selectPath_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            if (fbd.ShowDialog() == DialogResult.OK)
            {
                string[] files = Directory.GetFiles(fbd.SelectedPath);
                txtPath.Text = fbd.SelectedPath;
            }
        }

        private void btnUpload_Click(object sender, EventArgs e)
        {
            backgroundWorker.RunWorkerAsync();
        }

        private void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}