`default_nettype none

module tt_um_pwm_fader (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // PWM Logic
    // We use a counter to create a "sawtooth" wave.
    // We compare the input (ui_in) to the counter.
    // If counter < input, output is HIGH. Otherwise LOW.
    
    logic [7:0] counter;
    logic       pwm_out;

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    // Comparator for PWM generation
    assign pwm_out = (counter < ui_in);

    // Output assignments
    assign uo_out[0] = pwm_out;  // Map PWM to the first output pin
    assign uo_out[7:1] = 0;      // Tie low other outputs

    // Unused pins must be assigned to avoid "floating" errors
    assign uio_out = 0;
    assign uio_oe  = 0;

endmodule
