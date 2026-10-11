# Start by running DISM to check and 

 DISM /Online /Cleanup-Image /ScanHealth

# Restore the health of the system image

 DISM /Online /Cleanup-Image /RestoreHealth 

# After DISM completes, run SFC to check and repair system files 

sfc /scannow 

# Pause the script at the end to allow you to see the output 

pause