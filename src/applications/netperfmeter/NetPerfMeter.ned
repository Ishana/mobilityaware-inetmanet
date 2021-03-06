// * --------------------------------------------------------------------------
// *
// *     //====//  //===== <===//===>  //====//
// *    //        //          //      //    //    SCTP Optimization Project
// *   //=====   //          //      //====//   ==============================
// *        //  //          //      //           University of Duisburg-Essen
// *  =====//  //=====     //      //
// *
// * --------------------------------------------------------------------------
// *
// *   Copyright (C) 2009-2014 by Thomas Dreibholz
// *
// *   This program is free software: you can redistribute it and/or modify
// *   it under the terms of the GNU General Public License as published by
// *   the Free Software Foundation, either version 3 of the License, or
// *   (at your option) any later version.
// *
// *   This program is distributed in the hope that it will be useful,
// *   but WITHOUT ANY WARRANTY; without even the implied warranty of
// *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// *   GNU General Public License for more details.
// *
// *   You should have received a copy of the GNU General Public License
// *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
// *
// *   Contact: dreibh@iem.uni-due.de

package inet.applications.netperfmeter;
import inet.applications.INetPerfMeterApp;

simple NetPerfMeter like INetPerfMeterApp
{
    parameters:
        bool            activeMode               = default(true);      // Server (false) or client (true)
        string          localAddress             = default("");        // may be left empty ("")
        int             localPort                = default(9000);      // port number to listen on
        string          remoteAddress            = default("");        // server address (may be symbolic)
        int             remotePort               = default(9000);      // port number to connect to

        double          connectTime     @unit(s) = default(0s);        // Absolute time to establish connection
        double          startTime       @unit(s) = default(1s);        // Transmission start, relative to "connectTime"
        double          resetTime       @unit(s) = default(5s);        // Statistics reset, relative to "connectTime"
        double          stopTime        @unit(s) = default(30s);       // Transmission stop, relative to "resetTime"
        int             queueSize       @unit(B) = default(1000000 B); // Size of the transmission queue (SCTP/TCP only)

        double          onTime          @unit(s) = default(-1s);       // Online time; disconnect when timer expires
        double          offTime         @unit(s) = default(-1s);       // Offline time; reconnect when timer expires
        int             maxReconnects            = default(0);         // Maximum number of reconnects

        int             outboundStreams          = default(1);         // Number of outbound streams (SCTP only)
        int             maxInboundStreams        = default(16);        // Maximum number of inbound streams (SCTP only)
        string          protocol                 = default("SCTP");    // Transport protocol to use
        string          primaryPath              = default("");        // primary path (may be symbolic; SCTP only)

        string          dataTransferMode         = default("object");  // Data transfer mode for TCP socket (TCP only)

        volatile double frameRate      @unit(Hz) = default(1 Hz);      // Outgoing frame rate
        volatile double frameSize      @unit(B)  = default(1452 B);    // Outgoing frame size
        string          frameRateString          = default("");        // Outgoing frame rate per stream, separated by ";"
        string          frameSizeString          = default("");        // Outgoing frame size per stream, separated by ";"
        double          maxMsgSize     @unit(B)  = default(1000 B);    // Maximum message size
        double          unordered                = default(0.0);       // Fraction of unordered messages (SCTP only)
        double          unreliable               = default(0.0);       // Fraction of unreliable messages (SCTP only)
        bool            decoupleSaturatedStreams = default(true);      // Apply buffer splitting when using multiple streams

    gates:
        input  tcpIn;
        output tcpOut;
        input  sctpIn;
        output sctpOut;
        input  udpIn;
        output udpOut;
}
