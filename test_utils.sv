static int invocation_count = 0;
static int test_fails = 0;

`define PRETTY_ASSERT(ASSERT) \
    invocation_count++; \
    assert(ASSERT) $display("Test %0d Passed", invocation_count); \
    else begin \
        $warning("Test %0d failed", invocation_count); \
        test_fails = test_fails + 1; \
    end

`define TEST_HEADER(MODULE) \
    $dumpfile($sformatf("waveform_tb_%s.vcd", MODULE)); \
    $dumpvars; \
    $display("======================"); \
    $display("Testing %s", MODULE); \
    $display("======================"); \
    $display("Dumping VCD file @ `waveform_tb_%s.vcd`", MODULE)

`define TEST_FOOTER(MODULE) \
    $display("End of testing %s: %0d/%0d tests passed", MODULE, invocation_count - test_fails, invocation_count); \
    if (test_fails > 0) $error;
