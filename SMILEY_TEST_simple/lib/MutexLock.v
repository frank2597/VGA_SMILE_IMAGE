module MutexLock (
  input clk,
  input rst,
  input request,
  output reg granted
);

  reg locked;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      locked <= 0;
      granted <= 0;
    end else if (request && ~locked) begin
      locked <= 1;
      granted <= 1;
    end else begin
      // Release the lock after one clock cycle
      locked <= 0;
      granted <= 0;
    end
  end

endmodule