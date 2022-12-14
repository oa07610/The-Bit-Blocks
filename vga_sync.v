module vga_sync(
  input [9:0] h_count,
  input [9:0] v_count,
  output h_sync,
  output v_sync,
  output video_on,		//active area
  output [9:0] x_loc,	//current pixel x-location
  output [9:0] y_loc);	//current pixel x-location
  
  // horizontal	
  localparam HD = 640;			//horizontal display area	
  localparam HF = 16;		    //horizontal (front porch) right border
  localparam HB = 48;			//horizontal (back porch) left border
  localparam HR = 96;			//horizontal retrace
  
  // vertical	
  localparam VD = 480;			//vertical display area	
  localparam VF = 10;			//vertical (front porch) right border
  localparam VB = 33;			//vertical (back porch) left border
  localparam VR = 2 ;			//vertical retrace
  
  assign h_sync = (h_count < (HD + HF)) || (h_count >= (HD + HF + HR));
  assign v_sync = (v_count < (VD + VF)) || (v_count >= (VD + VF + VR));
  assign video_on = (h_count < HD) && (v_count < VD);
  assign x_loc = h_count;
  assign y_loc = v_count;
  
endmodule //vga_sync
