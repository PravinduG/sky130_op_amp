v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 280 10 280 80 {lab=VSS}
N 380 60 380 80 {lab=VSS}
N 280 80 380 80 {lab=VSS}
N 380 -10 380 -0 {lab=VOUT}
N 280 -10 380 -10 {lab=VOUT}
C {code_shown.sym} -1055 -130 0 0 {name=SPICE only_toplevel=false value=

"
.option temp=27
.option savecurrents
.param vcc=1.8

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt


*VP VP 0 0.9
*VN VN 0 0.9
*.dc VP 0 1.8 1m

*VP vp 0 SIN(0.9 0.01 1k)
*VN vn 0 SIN(0.9 -0.01 1k)


VP VP 0 dc 0.9 ac 0.001
VN VN 0 dc 0.9 ac -0.001



*.dc vp 0.7 1.1 1m
*.tran 1u 10m 10n
.ac dec 100 1 100Meg

.save all

.control

run
plot VP VN Vout
*print @m.x1.xm8.msky130_fd_pr__nfet_01v8[id][0] 
*print i(v2)[900]
*print i(v1)[900]
*meas DC VP when VP=VOUT
let vin = v(VP) - v(VN)
let gain = db(VOUT/vin)
let phase = phase(VOUT/vin)
plot gain phase*180/pi xlog



.endc



"

"
* Temperature and VDD varying Monte Carlo simulation with Gaussian distribution
* REMOVE V1 FOR THESE SIMULATIONS!!!!!!!!!!!!!

.param TEMPGAUSS  = agauss(27, 40, 3)
.option temp= 'TEMPGAUSS'
*.option temp= 27

.param VCCGAUSS  = agauss(1.8, 0.1, 3)
VDD VDD 0 'VCCGAUSS'
*VDD VDD 0 1.8

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

*DC Analysis
*VP VP 0 dc 0.9
*.dc VP 0.7 1.1 0.01

* AC Analysis
*VP VP 0 dc 0.9 ac 0.0001
*VN VN 0 dc 0.9 ac -0.0001

*Slew Rate
VP VP 0 PWL(0n 0.9 10n 0.9 11n 1.1 301n 1.1 302n 0.9 602n 0.9 603n 0.7 903n 0.7)
*VP VP 0 PULSE(0.9 0.7 150n 1n 1n 1200n 2400n)




.save all

.control
define agauss(nom, avar, sig) (nom + avar/sig * sgauss(0))
set wr_vecnames
set wr_singlerun

let runs = 100
let run = 1
while run <= runs
    * Run DC sweep 
    *dc VP 0.7 1.1 0.01
    *wrdata /foss/designs/mc_sims/op_amp/opamp_run\{$&run\}.txt v(VOUT)


    * Run AC sweep
    *ac dec 100 10 100Meg
    *wrdata /foss/designs/mc_sims/op_amp/opamp_run\{$&run\}.txt v(VOUT) v(VP)-v(VN)
   
    * Slew Rate
    tran 0.01u 1000n 1n
    let sr = deriv(v(VOUT))/1e6
    wrdata /foss/designs/mc_sims/op_amp/opamp_run\{$&run\}.txt sr
 
    

    reset
    let run = run + 1
end

plot dc1.v(Vout) dc2.v(Vout) dc3.v(Vout) dc4.v(Vout) dc5.v(Vout)

.endc


"



"

.option temp=27
.option savecurrents
.param vcc=1.8

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt 


*VP VP 0 0.7
VN VN 0 0.9
*.dc VP 0 1.8 10m

*VP vp 0 SIN(0.9 0.0001 100k)
*VN vn 0 SIN(0.9 -0.0001 100k)


*VP VP 0 dc 0.9 ac 0.001
*VN VN 0 dc 0.9 ac -0.001

VP VP 0 PWL(0n 0.9 10n 0.9 11n 1.1 301n 1.1 302n 0.9 602n 0.9 603n 0.7 903n 0.7)



*.dc vp 0.7 1.1 1m
*.tran 10n 2m 10n
*.ac dec 100 1 10Meg

.save all

.control
    run
    tran 0.01u 1400n 1n
    *display
    let vin = v(VP)-v(VN)
    let sr = deriv(v(VOUT))/1e6
    *plot v(Vp) v(Vn)
    plot vin v(Vout)
    plot sr
    *write tb_slewrate.raw
.endc


"


*.include /foss/designs/Op_Amp_Final/Post_Layouts/sky130_op_amp.pex.spice
.option temp=27
.option savecurrents
.param vcc=1.8

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt


*VP VP 0 0.9
*VN VN 0 0.9
*.dc VP 0 1.8 10m

VP vp 0 SIN(0.9 0.00001 1k)
VN vn 0 SIN(0.9 -0.00001 1k)


*VP VP 0 dc 0.9 ac 0.001
*VN VN 0 dc 0.9 ac -0.001



*.dc vp 0.7 1.1 1m
.tran 1u 10m 10n
*.ac dec 100 1 100Meg

.save all

.control

run
plot VP VN Vout
*meas DC VP when VP=VOUT
*let vin = v(VP) - v(VN)
*let gain = db(VOUT/vin)
*let phase = phase(VOUT/vin)
*plot gain phase*180/pi xlog



.endc



"
*.include /foss/designs/Op_Amp_Final/Post_Layouts/sky130_op_amp.pex.spice
.option temp=27
.option savecurrents
.param vcc=1.8

.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt


VP VP 0 0.9
VN VN 0 0.9
.dc VP 0 1.8 10m

*VP vp 0 SIN(0.9 0.00001 1k)
*VN vn 0 SIN(0.9 -0.00001 1k)


*VP VP 0 dc 0.9 ac 0.001
*VN VN 0 dc 0.9 ac -0.001



*.dc vp 0.7 1.1 1m
.tran 1u 10m 10n
*.ac dec 100 1 100Meg

.save all

.control

run
plot VP VN Vout
*meas DC VP when VP=VOUT
*let vin = v(VP) - v(VN)
*let gain = db(VOUT/vin)
*let phase = phase(VOUT/vin)
*plot gain phase*180/pi xlog



.endc






"



"


}
C {lab_pin.sym} -20 -30 0 0 {name=p1 sig_type=std_logic lab=IBIAS}
C {lab_pin.sym} -20 -10 0 0 {name=p2 sig_type=std_logic lab=VN}
C {lab_pin.sym} -20 10 0 0 {name=p3 sig_type=std_logic lab=VP}
C {lab_pin.sym} 280 -30 2 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 330 80 3 0 {name=p6 sig_type=std_logic lab=VSS}
C {capa.sym} 380 30 0 0 {name=C1
m=1
value=25p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 305 -10 2 0 {name=p7 sig_type=std_logic lab=VOUT}
C {vsource.sym} 90 240 0 0 {name=V2 value=0 savecurrent=false}
C {isource.sym} 150 240 0 0 {name=I0 value=5u}
C {gnd.sym} 90 270 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 90 210 1 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 150 210 1 0 {name=p10 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 150 270 3 0 {name=p11 sig_type=std_logic lab=IBIAS}
C {vsource.sym} -90 185 0 0 {name=V3 value=0.9 savecurrent=false}
C {gnd.sym} -90 215 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -90 95 1 0 {name=p12 sig_type=std_logic lab=VN}
C {vsource.sym} -150 185 0 0 {name=V4 value=0.9 savecurrent=false}
C {gnd.sym} -150 215 0 0 {name=l4 lab=GND
value=0.9}
C {lab_pin.sym} -150 95 1 0 {name=p13 sig_type=std_logic lab=VP
value=0.9}
C {vsource.sym} -25 240 0 0 {name=V5 value=1.8 savecurrent=false}
C {gnd.sym} -25 270 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -25 210 1 0 {name=p14 sig_type=std_logic lab=EN}
C {lab_pin.sym} -20 30 0 0 {name=p4 sig_type=std_logic lab=EN}
C {res.sym} -150 125 0 0 {name=R1
value=1meg
footprint=1206
device=resistor
m=1}
C {res.sym} -90 125 0 0 {name=R2
value=1meg
footprint=1206
device=resistor
m=1}
C {vsource.sym} 30 240 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 30 270 0 0 {name=l1 lab=GND}
C {sky130_op_amp.sym} 130 0 0 0 {name=x1}
C {lab_pin.sym} 30 210 1 0 {name=p8 sig_type=std_logic lab=VDD}
