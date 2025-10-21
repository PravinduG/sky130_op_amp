
# CACE Summary for sky130_op_amp

**netlist source**: rcx

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| DC gain              | ngspice              | a0                   |        1000 V/V |          ​ |          any |          ​ |          any |          ​ |  Cancel 🟧   |
| Unity Gain Frequency | ngspice              | ugf                  |          1e6 Hz |          ​ |          any |          ​ |          any |          ​ |  Cancel 🟧   |
| Phase Margin         | ngspice              | pm                   |            60 ° |          ​ |          any |          ​ |          any |          ​ |  Cancel 🟧   |
| Area                 | magic_area           | area                 |               ​ |          ​ |            ​ |          ​ |     9600 µm² | 6689.038 µm² |   Pass ✅    |
| Width                | magic_area           | width                |               ​ |          ​ |            ​ |          ​ |          any |  88.275 µm |   Pass ✅    |
| Height               | magic_area           | height               |               ​ |          ​ |            ​ |          ​ |          any |  75.775 µm |   Pass ✅    |
| Magic DRC            | magic_drc            | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          0 |   Pass ✅    |
| Netgen LVS           | netgen_lvs           | lvs_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          ​ |   Error ❗   |
| KLayout DRC feol     | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          ​ |  Cancel 🟧   |
| KLayout DRC beol     | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          ​ |  Cancel 🟧   |
| KLayout DRC full     | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          ​ |  Cancel 🟧   |
| Antenna Checks       | magic_antenna_check  | antenna_violations   |               ​ |          ​ |            ​ |          ​ |            0 |          ​ |   Skip 🟧    |

