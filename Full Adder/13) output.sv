UVM_INFO @ 0: reporter [RNTST] Running test fa_test...
UVM_INFO environment.sv(18) @ 0: uvm_test_top.e [ENV] Environment Created
UVM_INFO agent.sv(17) @ 0: uvm_test_top.e.agent [AGENT] Agent Created
UVM_INFO sequencer.sv(11) @ 0: uvm_test_top.e.agent.sequencer [SEQUENCER] Sequencer Created
UVM_INFO sequence.sv(19) @ 0: uvm_test_top.e.agent.sequencer@@seq [SEQUENCE] Generating Full Adder Transactions
UVM_INFO driver.sv(37) @ 10000: uvm_test_top.e.agent.driver [DRV] Driving: INPUT a = 1, b = 0, c = 1
UVM_INFO scoreboard.sv(30) @ 10000: uvm_test_top.e.scb [SCB] PASS! Input: a=1, b=0, c=1 | Output: sum=0, carry=1
UVM_INFO monitor.sv(37) @ 10000: uvm_test_top.e.agent.monitor [MON] Monitored: INPUT A = 1, B = 0, C = 1, OUTPUT SUM = 0, CARRY = 1
UVM_INFO driver.sv(37) @ 20000: uvm_test_top.e.agent.driver [DRV] Driving: INPUT a = 0, b = 1, c = 1
UVM_INFO scoreboard.sv(30) @ 20000: uvm_test_top.e.scb [SCB] PASS! Input: a=0, b=1, c=1 | Output: sum=0, carry=1
UVM_INFO monitor.sv(37) @ 20000: uvm_test_top.e.agent.monitor [MON] Monitored: INPUT A = 0, B = 1, C = 1, OUTPUT SUM = 0, CARRY = 1
UVM_INFO driver.sv(37) @ 30000: uvm_test_top.e.agent.driver [DRV] Driving: INPUT a = 0, b = 0, c = 1
UVM_INFO scoreboard.sv(30) @ 30000: uvm_test_top.e.scb [SCB] PASS! Input: a=0, b=0, c=1 | Output: sum=1, carry=0
UVM_INFO monitor.sv(37) @ 30000: uvm_test_top.e.agent.monitor [MON] Monitored: INPUT A = 0, B = 0, C = 1, OUTPUT SUM = 1, CARRY = 0
UVM_INFO driver.sv(37) @ 40000: uvm_test_top.e.agent.driver [DRV] Driving: INPUT a = 1, b = 1, c = 0
UVM_INFO scoreboard.sv(30) @ 40000: uvm_test_top.e.scb [SCB] PASS! Input: a=1, b=1, c=0 | Output: sum=0, carry=1
UVM_INFO monitor.sv(37) @ 40000: uvm_test_top.e.agent.monitor [MON] Monitored: INPUT A = 1, B = 1, C = 0, OUTPUT SUM = 0, CARRY = 1
UVM_INFO driver.sv(37) @ 50000: uvm_test_top.e.agent.driver [DRV] Driving: INPUT a = 1, b = 0, c = 1
UVM_INFO scoreboard.sv(30) @ 50000: uvm_test_top.e.scb [SCB] PASS! Input: a=1, b=0, c=1 | Output: sum=0, carry=1
UVM_INFO monitor.sv(37) @ 50000: uvm_test_top.e.agent.monitor [MON] Monitored: INPUT A = 1, B = 0, C = 1, OUTPUT SUM = 0, CARRY = 1
UVM_INFO /apps/vcsmx/vcs/X-2025.06-SP1//etc/uvm-1.2/src/base/uvm_objection.svh(1276) @ 1050000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO /apps/vcsmx/vcs/X-2025.06-SP1//etc/uvm-1.2/src/base/uvm_report_server.svh(904) @ 1050000: reporter [UVM/REPORT/SERVER] 
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :   22
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[AGENT]     1
[DRV]     5
[ENV]     1
[MON]     5
[RNTST]     1
[SCB]     5
[SEQUENCE]     1
[SEQUENCER]     1
[TEST_DONE]     1
[UVM/RELNOTES]     1

$finish called from file "/apps/vcsmx/vcs/X-2025.06-SP1//etc/uvm-1.2/src/base/uvm_root.svh", line 532.
$finish at simulation time              1050000
           V C S   S i m u l a t i o n   R e p o r t 
Time: 1050000 ps
