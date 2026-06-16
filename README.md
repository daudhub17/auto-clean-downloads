Auto Clean Downloads Folder

A lightweight Windows batch script that automatically purges files and subfolders from the Downloads directory if they are older than 2 days.

This utility helps prevent disk space bloat by keeping recently downloaded items intact while silently sweeping away old, forgotten files.

🛠️ How It Works

The script leverages the native Windows forfiles command to evaluate the age of each file and folder:

Files: Evaluates the LastWriteTime. Any file aged $\ge 2$ days is permanently deleted.

Folders: Dynamically checks and destroys empty subdirectories aged $\ge 2$ days.

🚀 Setup & Automation Guide

To make this script run seamlessly in the background without user intervention, configure it with Windows Task Scheduler by following these steps:

Step 1: Clone and Store the Script

Download or copy otomatishapus.bat.

Save it in a permanent folder on your system (e.g., C:\your folder\otomatishapus.bat).

Step 2: Create a New Task

Press the Windows Key, type Task Scheduler, and press Enter.

On the right-hand Actions pane, click Create Basic Task...

Name: Enter Auto Clean Old Downloads.

Description: Automatically purges files and folders older than 2 days from the Downloads directory.

Click Next.

Step 3: Configure the Trigger (Schedule)

Select Weekly (recommended to keep system overhead low) and click Next.

Set your preferred day and time (e.g., Sunday at 11:00 PM when the PC is usually idle).

Click Next.

Step 4: Define the Action

Choose Start a program and click Next.

In the Program/script field, click Browse... and select your otomatishapus.bat file.

Click Next, then click Finish.

🧪 How to Test

You can manually force-test the script's condition boundaries using the Command Prompt (CMD):

Open CMD and navigate to your Downloads folder:

cd /d "%USERPROFILE%\Downloads"


Create two temporary dummy files:

echo. > todays-file.txt
echo. > old-file.txt


Simulate an older age for old-file.txt (setting its modification date to 3 days ago) by executing this PowerShell command inside CMD:

powershell -Command "(Get-Item 'old-file.txt').LastWriteTime = (Get-Date).AddDays(-3)"


Run the script:

C:\yourfolders\otomatishapus.bat


Expected Result: old-file.txt will be permanently deleted, while todays-file.txt remains untouched.

⚠️ Disclaimer

This script deletes files permanently (skipping the Windows Recycle Bin). Please ensure you do not leave critical files long-term in your Downloads directory. Use at your own discretion.


---


