#Resume Builder!

#Background
This "Resume Builder" program allows a user to:

1. Create ONE file containing everything that you may want to include on a resume. 
2. Give each line item in that file a special tag, so that if you want to create multiple different resumes from the same file (e.g. one resume that highlights your front-end development experience and a different resume that highlights your back-end development experience), you can use those tags to select a particular resume.
3. View the resume that you selected (content is displayed in the terminal window), and save it to a PDF.


#Using the program
1. Download the "BulkResume.json" and "resumeprogram.rb" files from this repo. None of the other files in the repo are needed for the program, but you can download the entire repo if desired (it will not negatively effect the program).
2. Create a folder on your local machine (computer) and save the two files to that folder.
3. Install Prawn to the folder that you just created by following the instructions in their ReadMe: https://github.com/prawnpdf/prawn
4. Select the "BulkResume.json" file, and replace the existing content with your content. See the comments in the file for more detailed instructions about how to update the file with your own content.
5. Open your terminal, and cd (i.e. use the "cd" change directory command) to navigate to the folder created in step #2.
6. Enter the following command via your command line (note the spaces): <b>ruby resumeprogram.rb bulkresume.json</b>
7. Follow the prompts to view, and/or print, the resume of your choice.
