#!/bin/bash
#  Author / Maintainer : Nilesh Chandekar ncredhat@gmail.com
#
# 
# Licenced under GPLv3, check LICENSE.txt
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

echo "============================"
echo "##### LIST FLOATING IP #####"
echo "============================"
openstack floating ip list


echo "============================"
echo "##### CREATE FLOATING IP #####"
echo "============================"
openstack floating ip create public

FIP=$(openstack floating ip list |awk '{print $4}' |awk 'NR > 2')
INSTANCE=$(nova list |awk '{print $2}' |awk 'NR > 2')

echo "================================================="
echo "##### ATTACH FLAOTING IP TO CIRROS INSTANCE #####"
echo "================================================="
openstack server add floating ip $INSTANCE $FIP ; sleep 3

clear
echo "============================================="
echo "##### FULLY PROVISIONED CIRROS INSTANCE #####"
echo "============================================="
nova list
