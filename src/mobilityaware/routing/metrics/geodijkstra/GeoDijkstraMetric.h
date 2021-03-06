//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#ifndef __INETMANET_2_0_GEODIJKSTRAMETRIC_H_
#define __INETMANET_2_0_GEODIJKSTRAMETRIC_H_

#include <omnetpp.h>
#include "ManetAddress.h"

#include "RoutingMetric.h"
#include "LocationService.h"
#include "TrajectoryPrediction.h"

class GeoDijkstraMetric : public RoutingMetric
{
public:
    GeoDijkstraMetric();

    void init(LocationService *_locationService, TrajectoryPrediction *_prediction);

    Agent* getNextHop(Agent *_start, Agent *_destination);


private:
    std::map<Agent*,std::deque<Agent*>> buildLinkMap();

protected:
    virtual void initialize();

private:
    LocationService *p_locationService;
    TrajectoryPrediction *p_prediction;
    double m_maxDistance_m;

};

#endif
