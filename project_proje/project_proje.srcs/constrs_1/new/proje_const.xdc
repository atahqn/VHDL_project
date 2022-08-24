## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
## Switches
set_property PACKAGE_PIN R2 [get_ports {servo_reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {servo_reset}]
set_property PACKAGE_PIN T1 [get_ports {buzzer_reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {buzzer_reset}]

## LEDs
set_property PACKAGE_PIN N3 [get_ports {buzzer_trig}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {buzzer_trig}]
set_property PACKAGE_PIN P1 [get_ports {sensor1}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {sensor1}]
set_property PACKAGE_PIN L1 [get_ports {sensor2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sensor2}]
    ##Pmod Header JA
##Sch name = JA1
    set_property PACKAGE_PIN J1 [get_ports {buzzer_out}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {buzzer_out}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {trigger}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {trigger}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {echo}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {echo}]
#JB0
set_property PACKAGE_PIN A14 [get_ports {servo}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {servo}]
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {trigger2}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {trigger2}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {echo2}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {echo2}]
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {bcd_out[0]}]    
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[0]}]  
set_property PACKAGE_PIN W6 [get_ports {bcd_out[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[1]}]
set_property PACKAGE_PIN U8 [get_ports {bcd_out[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[2]}]
set_property PACKAGE_PIN V8 [get_ports {bcd_out[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[3]}]
set_property PACKAGE_PIN U5 [get_ports {bcd_out[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[4]}]
set_property PACKAGE_PIN V5 [get_ports {bcd_out[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[5]}]
set_property PACKAGE_PIN U7 [get_ports {bcd_out[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bcd_out[6]}]
    
set_property PACKAGE_PIN U2 [get_ports {anode[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]    
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]