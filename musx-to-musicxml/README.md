# MacOS users looking to migrate from Finale via MusicXML
Here's a simple script to help you gather all your .musx files in one place, making it easier to export them to MusicXML:

### How to use it:

1. **Download the `consolidate_musx.sh` script:**
   [Download](https://github.com/iveshenry18/misc-music-scripts/blob/main/musx-to-musicxml/consolidate_musx.sh) (click "Download raw file")

2. **Open the Terminal (you can find it in Applications > Utilities).**

3. **In the Terminal, navigate to the folder where you saved the script.** 
   For example, if it’s in your Downloads folder, you would type:
   ```sh
   cd ~/Downloads
   ```

4. **Now, run the script by typing the following command, replacing `<path/to/your/composition/folder/>` with the actual path to the root folder where your .musx files are stored:**
   ```sh
   sh ./consolidate_musx.sh <path/to/your/composition/folder/> musx_output
   ```

5. **The script will create a new folder called "musx_output" in the same location as the script and copy all your .musx files into that folder.**

6. **After it’s done, open Finale, go to File > Export > Translate Folder to MusicXML…, and choose the "musx_output" folder you just created.** 
   It may take a while to convert everything, but once it’s done, you’ll have a .mxl file for each of your .musx files.

What you do with those is up to you! I can't speak for the quality of Finale's MusicXML exporter, but a certain young developer I know once spent a summer making MuseScore's MusicXML importer as good as he could!

Hope it helps.