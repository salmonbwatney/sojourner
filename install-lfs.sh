####
#    Copyright 2016 © Samantha Rachel Belnavis
#    Licensed under the GNU General Public License, Version 3.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.gnu.org/licenses/gpl.html
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for specific language governing permissions and
#    limitations under the License.
#
#    Program Created by: Samantha Rachel Belnavis
#    Date Last Modified: December 7, 2016
#    File Name: install-lfs.sh
#    File Description: Installs LFS for the on the RaspberryPi
####

# install go
sudo apt-get install golang
 
# get git-lfs from github
sudo -i
mkdir /root/gocode
export GOPATH=/root/gocode
go get github.com/github/git-lfs
cp gocode/bin/git-lfs /usr/bin
