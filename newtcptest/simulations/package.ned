package newtcptest.simulations;

@license(LGPL);

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;
import openflow.hyperflow.Hyper_Flow_Synchronizer;
import openflow.openflow.controller.Open_Flow_Controller;
import openflow.openflow.switch.Open_Flow_Switch;
import openflow.utility.ControllerInvolvementFilter;
import openflow.utility.StaticSpanningTree;


//
// TODO documentation
//
network Network
{
    @display("bgb=745.864,527.744");
    types:
        channel ethernetline extends ThruputMeteringChannel
        {
            delay = 1us;
            datarate = 100Mbps;
            thruputDisplayFormat = "u";
        }

    submodules:
        spanningTree: StaticSpanningTree {
            @display("p=61,108");
        }

        controllerInvolvementFilter: ControllerInvolvementFilter {
            @display("p=59,39");
        }

//        hf_synchronizer: Hyper_Flow_Synchronizer{
//            @display("p=240,30");
//        }

        client1: StandardHost {
            @display("p=101.952,460.90802");
        }

        client3: StandardHost {
            @display("p=32.922,419.49");
        }

        client4: StandardHost {
            @display("p=32.922,350.46");
        }

        client5: StandardHost {
            @display("p=169.92,475.776");
        }

        client6: StandardHost {
            @display("p=233.64,475.776");
        }
        client2: StandardHost {
            @display("p=326.648,476.672");
        }
        server1: StandardHost {
            @display("p=564.984,476.672");
        }

        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=61,175");
        }

        open_flow_switch1: Open_Flow_Switch {
            @display("p=156.408,329.84");
        }
        open_flow_switch2: Open_Flow_Switch {
            @display("p=339.41602,385.168");
        }
        open_flow_switch3: Open_Flow_Switch {
            @display("p=510.72,329.84");
        }
        etherSwitch: EthernetSwitch {
            @display("p=275.576,260.68");
        }
        etherSwitch1: EthernetSwitch {
            @display("p=425.6,259.616");
        }
        open_flow_controller1: Open_Flow_Controller {
            @display("p=345,168");
        }
    connections allowunconnected:
        client1.ethg++ <--> ethernetline <--> open_flow_switch1.gateDataPlane++;
        client3.ethg++ <--> ethernetline <--> open_flow_switch1.gateDataPlane++;
        client4.ethg++ <--> ethernetline <--> open_flow_switch1.gateDataPlane++;
        client5.ethg++ <--> ethernetline <--> open_flow_switch1.gateDataPlane++;
        client6.ethg++ <--> ethernetline <--> open_flow_switch1.gateDataPlane++;

        client2.ethg++ <--> ethernetline <--> open_flow_switch2.gateDataPlane++;
        server1.ethg++ <--> ethernetline <--> open_flow_switch3.gateDataPlane++;
        etherSwitch.ethg++ <--> ethernetline <--> open_flow_switch1.gateControlPlane++;
        etherSwitch1.ethg++ <--> ethernetline <--> open_flow_switch3.gateControlPlane++;
        etherSwitch.ethg++ <--> ethernetline <--> open_flow_switch2.gateControlPlane++;

        etherSwitch.ethg++ <--> ethernetline <--> open_flow_controller1.ethg++;
        etherSwitch1.ethg++ <--> ethernetline <--> open_flow_controller1.ethg++;

        open_flow_switch1.gateDataPlane++ <--> ethernetline <--> open_flow_switch2.gateDataPlane++;
        open_flow_switch2.gateDataPlane++ <--> ethernetline <--> open_flow_switch3.gateDataPlane++;
        open_flow_switch3.gateDataPlane++ <--> ethernetline <--> open_flow_switch1.gateDataPlane++;

}

