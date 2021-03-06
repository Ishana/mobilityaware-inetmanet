//
// Copyright (C) 2010 Alfonso Ariza
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//

package inet.mobilityaware.examples.batmobile;

import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.nodes.inet.AdhocHost;
import inet.world.radio.ChannelControl;

import inet.mobilityaware.host.MobilityAwareHost;
import inet.mobilityaware.statistics.GeoRoutingStatistics;


//
// Example network for testing aodv routing. Contains
// fixed and mobile nodes. Mobile nodes are not moving,
// but are scattered randomly on the playground.
//
network SwarmExploration
{   
    parameters:
        int numHosts;
        
    submodules:
        statistics: GeoRoutingStatistics {
            @display("p=217,50;i=device/device");
        }
        
        host[numHosts]: MobilityAwareHost {
            parameters:
                @display("i=device/pocketpc_s;r=,,#707070");
        }
       
        channelControl: ChannelControl {
            parameters:
                @display("p=60,50;i=device/antennatower");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                config=xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=140,50;i=block/cogwheel_s");
        }
        
    connections allowunconnected:
}


