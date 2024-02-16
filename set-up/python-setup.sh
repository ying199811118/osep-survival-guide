#Run as Root

#Setting up Python virtual env
sudo apt-get update 
sudo apt install python3.11-venv
cd /home/kali && python -m venv pyvenv
source pyvenv/bin/activate


#Setting up Sharpshooter
mkdir osep && cd osep && mkdir tool && cd tool 
git clone https://github.com/mdsecactivebreach/SharpShooter.git
python2 -m pip install --upgrade setuptools
python2 -m pip install jsmin==2.2

