module TopLevelvga(
  input A,
  input B,
  input C,
  input UP,
  input clk,
  input vauxp6,
  input vauxn6,
  input vauxp7,
  input vauxn7,
  input vauxp15,
  input vauxn15,
  input vauxp14,
  input vauxn14,
  output h_sync,
  output v_sync,
  output reg [15:0] LED,
  output [3:0] an,
  output dp,
  output [6:0] seg, 
  output [3:0] red,
  output [3:0] green,
  output [3:0] blue);

  wire trig_v,video_on;
  wire [9:0] h_count;
  wire [9:0] v_count;
  wire [9:0] x_loc;
  wire [9:0] y_loc;
  wire clk_d;
  wire vrx;
  wire [3:0] vry;
  wire [15:0] led;
  
  XADCdemo d1(clk, vauxp6, vauxn6, vauxp7, vauxn7, vauxp15, vauxn15, vauxp14, vauxn14, led, an, dp, seg , vrx, vry);
  clk_div c1(clk, clk_d);
  h_counter h1(clk_d,h_count, trig_v);
  v_counter v1(clk_d,v_count, trig_v); // v_enable = trig_v
  vga_sync s1(h_count, v_count, h_sync,v_sync, video_on,x_loc, y_loc);
  pix_gen p1(A, B, C, UP, vry, clk_d, x_loc, y_loc, video_on, red, green, blue);//pixel_x=x_loc, y_loc=pixel_y
  
endmodule
