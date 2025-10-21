v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 770 120 790 120 {
lab=Vout}
N 790 120 790 140 {
lab=Vout}
N 60 160 60 180 {
lab=GND}
N 60 60 60 100 {
lab=VSS}
N 140 160 140 180 {
lab=GND}
N 60 180 60 200 {
lab=GND}
N 140 60 140 100 {
lab=VDD}
N 60 180 140 180 {
lab=GND}
N 220 60 220 100 {
lab=VDD}
N 220 160 220 180 {
lab=IBIAS}
N 220 180 220 200 {
lab=IBIAS}
N 690 120 770 120 {
lab=Vout}
N 300 60 300 100 {
lab=VP}
N 300 160 300 200 {
lab=GND}
N -60 60 -60 100 {
lab=VN}
N -60 160 -60 200 {
lab=GND}
C {devices/code_shown.sym} 880 320 0 0 {name=CONTROL only_toplevel=false value="

.control


    * Step function applied at time 100ns, save transient data
    tran 50n 3u
    * Measure slew rates
    meas tran sr MAX abs(deriv(v(Vout)))/1e6

    * Write measured slew rates to file
    let sr_val = $&sr
    echo $&sr_val > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {devices/isource.sym} 220 130 0 0 {name=I0 value=CACE\{ib\}}
C {devices/capa.sym} 790 170 0 0 {name=C1
m=1
value=CACE\{cl\}
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 790 200 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 60 130 0 0 {name=V0 value=0 savecurrent=false}
C {devices/gnd.sym} 60 200 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 140 130 0 0 {name=V2 value=CACE\{vdd\} savecurrent=false}
C {devices/vsource.sym} 300 130 0 0 {name=V3 value="DC 0 PULSE(0.9 CACE\{vstep\} 1u 1u 1u 4u 8u)" savecurrent=false}
C {devices/gnd.sym} 300 200 0 0 {name=l5 lab=GND}
C {devices/code_shown.sym} 880 60 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false
value="
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/combined/sky130.lib.spice CACE\{corner\}

.include CACE\{DUT_path\}

.temp CACE\{temperature\}

.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {sky130_op_amp.sym} 610 -50 0 0 {name=x1}
C {lab_pin.sym} 760 -80 2 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 760 -60 2 0 {name=p2 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 760 -40 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 460 -80 0 0 {name=p4 sig_type=std_logic lab=IBIAS}
C {lab_pin.sym} 460 -60 0 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_pin.sym} 460 -40 0 0 {name=p11 sig_type=std_logic lab=VP}
C {lab_pin.sym} 460 -20 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 690 120 0 0 {name=p5 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 300 60 1 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_pin.sym} 220 200 3 0 {name=p10 sig_type=std_logic lab=IBIAS}
C {lab_pin.sym} 220 60 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 140 60 1 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 60 60 1 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} -60 130 0 0 {name=VN value=0.9 savecurrent=false}
C {devices/gnd.sym} -60 200 0 0 {name=VN1 lab=GND
value=VN}
C {lab_pin.sym} -60 60 1 0 {name=VN2 sig_type=std_logic lab=VN
value=VN}
