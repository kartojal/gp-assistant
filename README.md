# gp-assister 1.0
A CLI Bash script by Kartojal, for a bit more friendly [GpuPlotGenerator](https://github.com/bhamon/gpuPlotGenerator) by bhamon/Cryo, that ask you the needed parameters for plotting Burst.

# Features
  - Ask you all parameters needed by GpuPlotGenerator, with some hints
  - The script ask you the number of plots do you want to generate.
  - Forget the calculator, script ask you the plot size in GB(Gigabytes) and convert it to nonces.
  - Check for free disk space, before start plotting.
  - Plots in "direct" mode, you dont need to optimize it later.

# How-to
  1. Download it from [HERE](https://github.com/kartojal/gp-assistant/archive/master.zip).
  2. Uncompress it with your prefer tool.
  3. Copy the "gp-assistant.sh" script file to the GpuPlotGenerator directory.
  4. Open the console and navigate to the GpuPlotGenerator directory.
  5. Give it execution permissions via console:
      - chmod +x 'gp-assistant.sh'
  6. Run it via console:
      - ./gp-assistant.sh


# TO-DO
  - Remember last start nonce. (Soon)
  - CLI menu to change GpuPlotter mode (direct or buffer)
  - Hints for the device setup
  - GUI menu with Zenity
  - [...]
