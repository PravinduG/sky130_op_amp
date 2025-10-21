v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 360 -470 450 -470 {lab=Vout}
N 450 -470 450 -450 {lab=Vout}
N -270 80 -200 80 {lab=GND}
N -180 60 -180 80 {lab=GND}
N -180 -30 -180 0 {lab=#net1}
N -60 -520 -60 -490 {lab=VDD}
N -60 -430 -60 -410 {lab=IBIAS}
N -150 -170 -10 -170 {lab=#net2}
N -80 -190 -80 -170 {lab=#net2}
N -150 -130 -20 -130 {lab=GND}
N -20 -130 -10 -130 {lab=GND}
N -80 -130 -80 -110 {lab=GND}
N -190 -270 -190 -180 {lab=VP}
N 30 -280 30 -180 {lab=VN}
N -190 -120 -190 -60 {lab=#net1}
N -190 -60 30 -60 {lab=#net1}
N 30 -120 30 -60 {lab=#net1}
N -80 -210 -80 -190 {lab=#net2}
N -270 -210 -80 -210 {lab=#net2}
N -200 80 -180 80 {lab=GND}
N -230 -430 -230 -380 {lab=GND}
N -230 -410 -160 -410 {lab=GND}
N -160 -430 -160 -410 {lab=GND}
N -160 -520 -160 -490 {lab=VDD}
N -230 -520 -230 -490 {lab=VSS}
N -270 60 -270 80 {lab=GND}
N -270 -40 -270 0 {lab=#net2}
N -270 -210 -270 -90 {lab=#net2}
N -80 -40 -80 -30 {lab=#net1}
N -90 -30 -80 -30 {lab=#net1}
N -180 -30 -140 -30 {lab=#net1}
N -80 -60 -80 -40 {lab=#net1}
N -140 -30 -90 -30 {lab=#net1}
N -270 -90 -270 -40 {lab=#net2}
C {lab_pin.sym} 60 -470 0 0 {name=p2 sig_type=std_logic lab=VN}
C {lab_pin.sym} 60 -450 0 0 {name=p3 sig_type=std_logic lab=VP}
C {lab_pin.sym} 360 -490 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 360 -450 2 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 450 -470 2 0 {name=p6 sig_type=std_logic lab=Vout}
C {capa.sym} 450 -420 0 0 {name=C1
m=1
value=CACE\{cl\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 450 -390 3 0 {name=p7 sig_type=std_logic lab=VSS}
C {vsource.sym} -270 30 0 0 {name=Vdm value="ac 1" savecurrent=false}
C {vsource.sym} -180 30 0 0 {name=Vcm value=CACE\{vcm\} savecurrent=false}
C {gnd.sym} -230 80 0 0 {name=l1 lab=GND}
C {isource.sym} -60 -460 0 0 {name=I0 value=CACE\{ib\}}
C {lab_pin.sym} -60 -520 1 0 {name=p10 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -60 -410 3 0 {name=p11 sig_type=std_logic lab=IBIAS}
C {vcvs.sym} 30 -150 0 0 {name=E2 value=-0.5}
C {vcvs.sym} -190 -150 0 1 {name=E1 value=0.5}
C {lab_pin.sym} -190 -270 0 0 {name=p12 sig_type=std_logic lab=VP}
C {lab_pin.sym} 30 -280 0 0 {name=p13 sig_type=std_logic lab=VN}
C {vsource.sym} -230 -460 0 0 {name=V0 value=0 savecurrent=false}
C {vsource.sym} -160 -460 0 0 {name=V4 value=CACE\{vdd\} savecurrent=false}
C {gnd.sym} -230 -380 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -160 -520 1 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -230 -520 1 0 {name=p9 sig_type=std_logic lab=VSS}
C {gnd.sym} -80 -110 0 0 {name=l2 lab=GND}
C {title.sym} -470 250 0 0 {name=l4 author="Pravindu Goonetilleke x Nilakna Warushavithana"}
C {sky130_op_amp.sym} 210 -460 0 0 {name=x1}
C {lab_pin.sym} 60 -430 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 60 -490 0 0 {name=p1 sig_type=std_logic lab=IBIAS}
C {code_shown.sym} 800 -510 0 0 {name=SETUP only_toplevel=false value=
"
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/combined/sky130.lib.spice CACE\{corner\}

.include CACE\{DUT_path\}

.temp CACE\{temperature\}

.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]

* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {code_shown.sym} 780 -250 0 0 {name=CONTROL only_toplevel=false value=
".control
*---------------------------------------
* AC Analysis (DC gain, UGF, Phase Margin)
*---------------------------------------
* Use Vdm for small-signal AC input, Vcm fixed
ac dec 20 1k 100e6
let vout_mag = abs(v(Vout))
let vout_phase = phase(v(Vout))*180/pi
meas ac a0 find vout_mag at=1k
meas ac ugf when vout_mag=1 fall=1
meas ac pm find 180+vout_phase when vout_mag=1

*---------------------------------------
* Output Offset (Vin = Vcm ± 0)
*---------------------------------------
dc Vdm -1m 1m 0.001   ; small differential sweep around 0
meas dc vout_offset find v(Vout) at=0

*---------------------------------------
* Input Offset (Vout = Vcm)
*---------------------------------------
dc Vdm -5m 5m 0.001   ; sweep differential until Vout=Vcm
meas dc vin_offset when v(Vout)=CACE\{vcm\}

*---------------------------------------
* Slew Rate (Transient)
*---------------------------------------
* Positive pulse
Vdm VIN GND PULSE(0 0.2 1u 0.1u 0.1u 4u 8u)
tran 0.05u 10u
meas tran sr_pos max deriv(v(Vout))

* Negative pulse
alter Vdm PULSE(0 -0.2 1u 0.1u 0.1u 4u 8u)
tran 0.05u 10u
meas tran sr_neg min deriv(v(Vout))

*---------------------------------------
* Supply Current (Enabled/Disabled)
*---------------------------------------
dc Ven 1.8 1.8 0.1
meas dc idd_enabled find -i(Vdd)

alter Ven 0
dc Ven 0 0 0.1
meas dc idd_disabled find -i(Vdd)

*---------------------------------------
* Echo all measurements
*---------------------------------------
echo $&a0 $&ugf $&pm $&vout_offset $&vin_offset $&sr_pos $&sr_neg $&idd_enabled $&idd_disabled > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc

"}
