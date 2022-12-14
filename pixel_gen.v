`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2022 01:08:49 PM
// Design Name: 
// Module Name: pixel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module pix_gen( 
    input A,
    input B,
    input C,
    input UP,
    input [3:0]vry,
    input clk_d, 
    input [9:0] pixel_x, 
    input [9:0] pixel_y, 
    input video_on, 
    output reg [3:0] red = 0, 
    output reg [3:0] green = 0, 
    output reg [3:0] blue = 0
    ); 
    reg [9:0]BAYMin = 50;
    reg [9:0]BAYMax = 64;
    reg[3:0] state = 0;
    reg Random = 0;
    reg regen = 0;
    reg pp = 1;
    reg [9:0]count_check = 1000;
    reg [9:0]counter = 0;
    reg [9:0]pmax = 341;
    reg [9:0]pmin = 327;
    reg moment = 1;
    reg won = 0;
    reg lost = 0;
    reg[9:0] movement = 1000;
    
parameter x_r1c1 =  285 ;
parameter y_r1c1 =  275 ;
reg r1c1 = 0;

parameter x_r1c2 =  299 ;
parameter y_r1c2 =  275 ;
reg r1c2 = 0;

parameter x_r1c3 =  313 ;
parameter y_r1c3 =  275 ;
reg r1c3 = 0;

parameter x_r1c4 =  327 ;
parameter y_r1c4 =  275 ;
reg r1c4 = 0;

parameter x_r1c5 =  341 ;
parameter y_r1c5 =  275 ;
reg r1c5 = 0;

parameter x_r2c1 =  285 ;
parameter y_r2c1 =  289 ;
reg r2c1 = 0;

parameter x_r2c2 =  299 ;
parameter y_r2c2 =  289 ;
reg r2c2 = 0;

parameter x_r2c3 =  313 ;
parameter y_r2c3 =  289 ;
reg r2c3 = 0;

parameter x_r2c4 =  327 ;
parameter y_r2c4 =  289 ;
reg r2c4 = 0;

parameter x_r2c5 =  341 ;
parameter y_r2c5 =  289 ;
reg r2c5 = 0;
parameter x_r3c1 =  285 ;
parameter y_r3c1 =  303 ;
reg r3c1 = 0;

parameter x_r3c2 =  299 ;
parameter y_r3c2 =  303 ;
reg r3c2 = 0;

parameter x_r3c3 =  313 ;
parameter y_r3c3 =  303 ;
reg r3c3 = 0;

parameter x_r3c4 =  327 ;
parameter y_r3c4 =  303 ;
reg r3c4 = 0;

parameter x_r3c5 =  341 ;
parameter y_r3c5 =  303 ;
reg r3c5 = 0;

parameter x_r4c1 =  285 ;
parameter y_r4c1 =  317 ;
reg r4c1 = 0;

parameter x_r4c2 =  299 ;
parameter y_r4c2 =  317 ;
reg r4c2 = 0;

parameter x_r4c3 =  313 ;
parameter y_r4c3 =  317 ;
reg r4c3 = 0;

parameter x_r4c4 =  327 ;
parameter y_r4c4 =  317 ;
reg r4c4 = 0;

parameter x_r4c5 =  341 ;
parameter y_r4c5 =  317 ;
reg r4c5 = 0;

parameter x_r5c1 =  285 ;
parameter y_r5c1 =  331 ;
reg r5c1 = 0;

parameter x_r5c2 =  299 ;
parameter y_r5c2 =  331 ;
reg r5c2 = 0;

parameter x_r5c3 =  313 ;
parameter y_r5c3 =  331 ;
reg r5c3 = 0;

parameter x_r5c4 =  327 ;
parameter y_r5c4 =  331 ;
reg r5c4 = 0;

parameter x_r5c5 =  341 ;
parameter y_r5c5 =  331 ;
reg r5c5 = 0;

parameter x_r6c1 =  285 ;
parameter y_r6c1 =  345 ;
reg r6c1 = 0;

parameter x_r6c2 =  299 ;
parameter y_r6c2 =  345 ;
reg r6c2 = 0;

parameter x_r6c3 =  313 ;
parameter y_r6c3 =  345 ;
reg r6c3 = 0;

parameter x_r6c4 =  327 ;
parameter y_r6c4 =  345 ;
reg r6c4 = 0;

parameter x_r6c5 =  341 ;
parameter y_r6c5 =  345 ;
reg r6c5 = 0;

parameter x_r7c1 =  285 ;
parameter y_r7c1 =  359 ;
reg r7c1 = 0;
parameter x_r7c2 =  299 ;
parameter y_r7c2 =  359 ;
reg r7c2 = 0;

parameter x_r7c3 =  313 ;
parameter y_r7c3 =  359 ;
reg r7c3 = 0;

parameter x_r7c4 =  327 ;
parameter y_r7c4 =  359 ;
reg r7c4 = 0;

parameter x_r7c5 =  341 ;
parameter y_r7c5 =  359 ;
reg r7c5 = 0;

parameter x_r8c1 =  285 ;
parameter y_r8c1 =  373 ;
reg r8c1 = 0;

parameter x_r8c2 =  299 ;
parameter y_r8c2 =  373 ;
reg r8c2 = 0;

parameter x_r8c3 =  313 ;
parameter y_r8c3 =  373 ;
reg r8c3 = 0;

parameter x_r8c4 =  327 ;
parameter y_r8c4 =  373 ;
reg r8c4 = 0;

parameter x_r8c5 =  341 ;
parameter y_r8c5 =  373 ;
reg r8c5 = 0;

parameter x_r9c1 =  285 ;
parameter y_r9c1 =  387 ;
reg r9c1 = 0;

parameter x_r9c2 =  299 ;
parameter y_r9c2 =  387 ;
reg r9c2 = 0;

parameter x_r9c3 =  313 ;
parameter y_r9c3 =  387 ;
reg r9c3 = 0;

parameter x_r9c4 =  327 ;
parameter y_r9c4 =  387 ;
reg r9c4 = 0;

parameter x_r9c5 =  341 ;
parameter y_r9c5 =  387 ;
reg r9c5 = 0;

parameter x_r10c1 =  285 ;
parameter y_r10c1 =  401 ;
reg r10c1 = 0;

parameter x_r10c2 =  299 ;
parameter y_r10c2 =  401 ;
reg r10c2 = 0;

parameter x_r10c3 =  313 ;
parameter y_r10c3 =  401 ;
reg r10c3 = 0;

parameter x_r10c4 =  327 ;
parameter y_r10c4 =  401 ;
reg r10c4 = 0;

parameter x_r10c5 =  341 ;
parameter y_r10c5 =  401 ;
reg r10c5 = 0;

parameter x_r11c1 =  285 ;
parameter y_r11c1 =  415 ;
reg r11c1 = 0;

parameter x_r11c2 =  299 ;
parameter y_r11c2 =  415 ;
reg r11c2 = 0;

parameter x_r11c3 =  313 ;
parameter y_r11c3 =  415 ;
reg r11c3 = 0;

parameter x_r11c4 =  327 ;
parameter y_r11c4 =  415 ;
reg r11c4 = 0;

parameter x_r11c5 =  341 ;
parameter y_r11c5 =  415 ;
reg r11c5 = 0;

parameter x_r12c1 =  285 ;
parameter y_r12c1 =  429 ;
reg r12c1 = 1;

parameter x_r12c2 =  299 ;
parameter y_r12c2 =  429 ;
reg r12c2 = 1;

parameter x_r12c3 =  313 ;
parameter y_r12c3 =  429 ;
reg r12c3 = 1;

parameter x_r12c4 =  327 ;
parameter y_r12c4 =  429 ;
reg r12c4 = 1;

parameter x_r12c5 =  341 ;
parameter y_r12c5 =  429 ;
reg r12c5 = 1;

//************
// always block
//**********
always @(posedge clk_d)

if (UP==1 & won==0 & lost==0)
 begin 
        if (A == 1 && B == 0 && C == 0)
        begin
        count_check = 750;
        end
        
        else if (B == 1 && C == 0)
        begin
        count_check = 450;
        end
        
        else if (A == 0 && B == 0 && C == 0)
        begin
        count_check = 1000;
        end
        
        else if (C == 1)
        begin
        count_check = 300;
        end
    
        if (regen == 1)
            begin
                BAYMin = 50;
                BAYMax = 64;
                regen = 0;
                Random <= Random + 1;
                pmax = 327;
                pmin = 313;
            end 
            
        if (pixel_x < 215 || pixel_x > 425 || pixel_y < 51 || pixel_y > 435 || pixel_x>0 & pixel_x<285 & pixel_y >265 & pixel_y <435 || pixel_x>355 & pixel_x<480 & pixel_y >265 & pixel_y <435 || pixel_x>0 & pixel_x<480 & pixel_y > 429 & pixel_y <435)
            begin 
                red <= 4'h0; 
                blue <= 4'h0; 
                green <= 4'h0; 
            end
            
     
        else if (Random == 0)
            begin 
                /////SINGLE BLOCK
                if (pixel_x > pmin && pixel_x < pmax && pixel_y > BAYMin && pixel_y < BAYMax)
                    begin       
                        red <= 4'hF; 
                        blue <= 4'h0; 
                        green <= 4'h0;
                      
                 if (movement == 1000)
                begin 
                        
                        if ((vry >= 9) && (vry <= 14))
                            begin 
                                if(pmax+14 < 426)
                                    begin
                                        pmax <= pmax + 14;
                                        pmin <= pmin + 14;
                                        movement = 0;
                                    end
                                    
                                   
                            end 
                               
                    else if ((vry >= 0) && (vry <= 3))
                            begin 
                                if(pmin - 14 > 214)
                                    begin
                                        pmax <= pmax - 14;
                                        pmin <= pmin - 14;
                                        movement = 0;
                                    end
                            end       
                  end
                  else
                    begin
                        movement = movement + 1;
                    end                        
                                                       
                        if (counter == count_check)
                           begin
                           
if (BAYMax == y_r2c1)
begin
    if (pmin == x_r2c1)
    begin
        if (r2c1 == 1)
        begin
            regen=1;
            r1c1 = 1;
        end
    end

    if (pmin == x_r2c2)
    begin
        if (r2c2 == 1)
        begin
            regen=1;
            r1c2 = 1;
        end
    end

    if (pmin == x_r2c3)
    begin
        if (r2c3 == 1)
        begin
            regen=1;
            r1c3 = 1;
        end
    end

    if (pmin == x_r2c4)
    begin
        if (r2c4 == 1)
        begin
            regen=1;
            r1c4 = 1;
        end
    end

    if (pmin == x_r2c5)
    begin
        if (r2c5 == 1)
        begin
            regen=1;
            r1c5 = 1;
        end
    end

end


if (BAYMax == y_r3c1)
begin
    if (pmin == x_r3c1)
    begin
        if (r3c1 == 1)
        begin
            regen=1;
            r2c1 = 1;
        end
    end

    if (pmin == x_r3c2)
    begin
        if (r3c2 == 1)
        begin
            regen=1;
            r2c2 = 1;
        end
    end

    if (pmin == x_r3c3)
    begin
        if (r3c3 == 1)
        begin
            regen=1;
            r2c3 = 1;
        end
    end

    if (pmin == x_r3c4)
    begin
        if (r3c4 == 1)
        begin
            regen=1;
            r2c4 = 1;
        end
    end

    if (pmin == x_r3c5)
    begin
        if (r3c5 == 1)
        begin
            regen=1;
            r2c5 = 1;
        end
    end

end


if (BAYMax == y_r4c1)
begin
    if (pmin == x_r4c1)
    begin
        if (r4c1 == 1)
        begin
            regen=1;
            r3c1 = 1;
        end
    end

    if (pmin == x_r4c2)
    begin
        if (r4c2 == 1)
        begin
            regen=1;
            r3c2 = 1;
        end
    end

    if (pmin == x_r4c3)
    begin
        if (r4c3 == 1)
        begin
            regen=1;
            r3c3 = 1;
        end
    end

    if (pmin == x_r4c4)
    begin
        if (r4c4 == 1)
        begin
            regen=1;
            r3c4 = 1;
        end
    end

    if (pmin == x_r4c5)
    begin
        if (r4c5 == 1)
        begin
            regen=1;
            r3c5 = 1;
        end
    end

end


if (BAYMax == y_r5c1)
begin
    if (pmin == x_r5c1)
    begin
        if (r5c1 == 1)
        begin
            regen=1;
            r4c1 = 1;
        end
    end

    if (pmin == x_r5c2)
    begin
        if (r5c2 == 1)
        begin
            regen=1;
            r4c2 = 1;
        end
    end

    if (pmin == x_r5c3)
    begin
        if (r5c3 == 1)
        begin
            regen=1;
            r4c3 = 1;
        end
    end

    if (pmin == x_r5c4)
    begin
        if (r5c4 == 1)
        begin
            regen=1;
            r4c4 = 1;
        end
    end

    if (pmin == x_r5c5)
    begin
        if (r5c5 == 1)
        begin
            regen=1;
            r4c5 = 1;
        end
    end

end


if (BAYMax == y_r6c1)
begin
    if (pmin == x_r6c1)
    begin
        if (r6c1 == 1)
        begin
            regen=1;
            r5c1 = 1;
        end
    end

    if (pmin == x_r6c2)
    begin
        if (r6c2 == 1)
        begin
            regen=1;
            r5c2 = 1;
        end
    end

    if (pmin == x_r6c3)
    begin
        if (r6c3 == 1)
        begin
            regen=1;
            r5c3 = 1;
        end
    end

    if (pmin == x_r6c4)
    begin
        if (r6c4 == 1)
        begin
            regen=1;
            r5c4 = 1;
        end
    end

    if (pmin == x_r6c5)
    begin
        if (r6c5 == 1)
        begin
            regen=1;
            r5c5 = 1;
        end
    end

end


if (BAYMax == y_r7c1)
begin
    if (pmin == x_r7c1)
    begin
        if (r7c1 == 1)
        begin
            regen=1;
            r6c1 = 1;
        end
    end

    if (pmin == x_r7c2)
    begin
        if (r7c2 == 1)
        begin
            regen=1;
            r6c2 = 1;
        end
    end

    if (pmin == x_r7c3)
    begin
        if (r7c3 == 1)
        begin
            regen=1;
            r6c3 = 1;
        end
    end

    if (pmin == x_r7c4)
    begin
        if (r7c4 == 1)
        begin
            regen=1;
            r6c4 = 1;
        end
    end

    if (pmin == x_r7c5)
    begin
        if (r7c5 == 1)
        begin
            regen=1;
            r6c5 = 1;
        end
    end

end


if (BAYMax == y_r8c1)
begin
    if (pmin == x_r8c1)
    begin
        if (r8c1 == 1)
        begin
            regen=1;
            r7c1 = 1;
        end
    end

    if (pmin == x_r8c2)
    begin
        if (r8c2 == 1)
        begin
            regen=1;
            r7c2 = 1;
        end
    end

    if (pmin == x_r8c3)
    begin
        if (r8c3 == 1)
        begin
            regen=1;
            r7c3 = 1;
        end
    end

    if (pmin == x_r8c4)
    begin
        if (r8c4 == 1)
        begin
            regen=1;
            r7c4 = 1;
        end
    end

    if (pmin == x_r8c5)
    begin
        if (r8c5 == 1)
        begin
            regen=1;
            r7c5 = 1;
        end
    end

end


if (BAYMax == y_r9c1)
begin
    if (pmin == x_r9c1)
    begin
        if (r9c1 == 1)
        begin
            regen=1;
            r8c1 = 1;
        end
    end

    if (pmin == x_r9c2)
    begin
        if (r9c2 == 1)
        begin
            regen=1;
            r8c2 = 1;
        end
    end

    if (pmin == x_r9c3)
    begin
        if (r9c3 == 1)
        begin
            regen=1;
            r8c3 = 1;
        end
    end

    if (pmin == x_r9c4)
    begin
        if (r9c4 == 1)
        begin
            regen=1;
            r8c4 = 1;
        end
    end

    if (pmin == x_r9c5)
    begin
        if (r9c5 == 1)
        begin
            regen=1;
            r8c5 = 1;
        end
    end

end


if (BAYMax == y_r10c1)
begin
    if (pmin == x_r10c1)
    begin
        if (r10c1 == 1)
        begin
            regen=1;
            r9c1 = 1;
        end
    end

    if (pmin == x_r10c2)
    begin
        if (r10c2 == 1)
        begin
            regen=1;
            r9c2 = 1;
        end
    end

    if (pmin == x_r10c3)
    begin
        if (r10c3 == 1)
        begin
            regen=1;
            r9c3 = 1;
        end
    end

    if (pmin == x_r10c4)
    begin
        if (r10c4 == 1)
        begin
            regen=1;
            r9c4 = 1;
        end
    end

    if (pmin == x_r10c5)
    begin
        if (r10c5 == 1)
        begin
            regen=1;
            r9c5 = 1;
        end
    end

end


if (BAYMax == y_r11c1)
begin
    if (pmin == x_r11c1)
    begin
        if (r11c1 == 1)
        begin
            regen=1;
            r10c1 = 1;
        end
    end

    if (pmin == x_r11c2)
    begin
        if (r11c2 == 1)
        begin
            regen=1;
            r10c2 = 1;
        end
    end

    if (pmin == x_r11c3)
    begin
        if (r11c3 == 1)
        begin
            regen=1;
            r10c3 = 1;
        end
    end

    if (pmin == x_r11c4)
    begin
        if (r11c4 == 1)
        begin
            regen=1;
            r10c4 = 1;
        end
    end

    if (pmin == x_r11c5)
    begin
        if (r11c5 == 1)
        begin
            regen=1;
            r10c5 = 1;
        end
    end

end


if (BAYMax == y_r12c1)
begin
    if (pmin == x_r12c1)
    begin
        if (r12c1 == 1)
        begin
            regen=1;
            r11c1 = 1;
        end
    end

    if (pmin == x_r12c2)
    begin
        if (r12c2 == 1)
        begin
            regen=1;
            r11c2 = 1;
        end
    end

    if (pmin == x_r12c3)
    begin
        if (r12c3 == 1)
        begin
            regen=1;
            r11c3 = 1;
        end
    end
    
    if (pmin == x_r12c4)
    begin
        if (r12c2 == 1)
        begin
            regen=1;
            r11c4 = 1;
        end
    end
    
    if (pmin == x_r12c5)
    begin
        if (r12c2 == 1)
        begin
            regen=1;
            r11c5 = 1;
        end
    end

end
                                BAYMin <= BAYMin + 1;
                                BAYMax <= BAYMax + 1;
                                counter = 0;
                           end
                       else
                           begin
                                counter=counter+ 3;
                           end
                    end
                else
                    begin
                        red <= 4'hF; 
                        blue <= 4'hF; 
                        green <= 4'hF; 
                    end
               end
            
        else if (Random ==2)
            begin  
                if (pixel_x > pmin && pixel_x < pmax && pixel_y > BAYMin && pixel_y < BAYMax)
                    begin       
                        red <= 4'hF; 
                        blue <= 4'h0; 
                        green <= 4'h0; 
                        if (counter == count_check)
                           begin
                                BAYMin <= BAYMin + 1;
                                BAYMax <= BAYMax + 1;
                                counter = 0;
                           end
                       else
                           begin
                                counter=counter+5;
                           end
                    end
                else
                    begin
                        red <= 4'hF; 
                        blue <= 4'hF; 
                        green <= 4'hF; 
                    end
               end
                  
            else if (Random==1)
                begin
                if (pixel_x > pmin && pixel_x < pmax && pixel_y > BAYMin-14 && pixel_y < BAYMax)
                    begin       
                        red <= 4'h0; 
                        blue <= 4'h0; 
                        green <= 4'hF;
                if (movement == 1000)
                begin 
                        
                        if ((vry >= 9) && (vry <= 14))
                            begin 
                                if(pmax+14 < 426)
                                    begin
                                        pmax <= pmax + 14;
                                        pmin <= pmin + 14;
                                        movement = 0;
                                    end
                                    
                                   
                            end 
                               
                    else if ((vry >= 0) && (vry <= 3))
                            begin 
                                if(pmin - 14 > 214)
                                    begin
                                        pmax <= pmax - 14;
                                        pmin <= pmin - 14;
                                        movement = 0;
                                    end
                            end       
                  end
                  else
                    begin
                        movement = movement + 1;
                    end
                        
                        if (counter == count_check)
                           begin
if (BAYMax == y_r3c1)
begin
    if (pmin == x_r3c1)
    begin
        if (r3c1 == 1)
        begin
            regen=1;
            r2c1 = 1;
            r1c1 = 1;
        end
    end

    if (pmin == x_r3c2)
    begin
        if (r3c2 == 1)
        begin
            regen=1;
            r2c2 = 1;
            r1c2 = 1;
        end
    end

    if (pmin == x_r3c3)
    begin
        if (r3c3 == 1)
        begin
            regen=1;
            r2c3 = 1;
            r1c3 = 1;
        end
    end

    if (pmin == x_r3c4)
    begin
        if (r3c4 == 1)
        begin
            regen=1;
            r2c4 = 1;
            r1c4 = 1;
        end
    end

    if (pmin == x_r3c5)
    begin
        if (r3c5 == 1)
        begin
            regen=1;
            r2c5 = 1;
            r1c5 = 1;
        end
    end

end


if (BAYMax == y_r4c1)
begin
    if (pmin == x_r4c1)
    begin
        if (r4c1 == 1)
        begin
            regen=1;
            r3c1 = 1;
            r2c1 = 1;
        end
    end

    if (pmin == x_r4c2)
    begin
        if (r4c2 == 1)
        begin
            regen=1;
            r3c2 = 1;
            r2c2 = 1;
        end
    end

    if (pmin == x_r4c3)
    begin
        if (r4c3 == 1)
        begin
            regen=1;
            r3c3 = 1;
            r2c3 = 1;
        end
    end

    if (pmin == x_r4c4)
    begin
        if (r4c4 == 1)
        begin
            regen=1;
            r3c4 = 1;
            r2c4 = 1;
        end
    end

    if (pmin == x_r4c5)
    begin
        if (r4c5 == 1)
        begin
            regen=1;
            r3c5 = 1;
            r2c5 = 1;
        end
    end

end


if (BAYMax == y_r5c1)
begin
    if (pmin == x_r5c1)
    begin
        if (r5c1 == 1)
        begin
            regen=1;
            r4c1 = 1;
            r3c1 = 1;
        end
    end

    if (pmin == x_r5c2)
    begin
        if (r5c2 == 1)
        begin
            regen=1;
            r4c2 = 1;
            r3c2 = 1;
        end
    end

    if (pmin == x_r5c3)
    begin
        if (r5c3 == 1)
        begin
            regen=1;
            r4c3 = 1;
            r3c3 = 1;
        end
    end

    if (pmin == x_r5c4)
    begin
        if (r5c4 == 1)
        begin
            regen=1;
            r4c4 = 1;
            r3c4 = 1;
        end
    end

    if (pmin == x_r5c5)
    begin
        if (r5c5 == 1)
        begin
            regen=1;
            r4c5 = 1;
            r3c5 = 1;
        end
    end

end


if (BAYMax == y_r6c1)
begin
    if (pmin == x_r6c1)
    begin
        if (r6c1 == 1)
        begin
            regen=1;
            r5c1 = 1;
            r4c1 = 1;
        end
    end

    if (pmin == x_r6c2)
    begin
        if (r6c2 == 1)
        begin
            regen=1;
            r5c2 = 1;
            r4c2 = 1;
        end
    end

    if (pmin == x_r6c3)
    begin
        if (r6c3 == 1)
        begin
            regen=1;
            r5c3 = 1;
            r4c3 = 1;
        end
    end

    if (pmin == x_r6c4)
    begin
        if (r6c4 == 1)
        begin
            regen=1;
            r5c4 = 1;
            r4c4 = 1;
        end
    end

    if (pmin == x_r6c5)
    begin
        if (r6c5 == 1)
        begin
            regen=1;
            r5c5 = 1;
            r4c5 = 1;
        end
    end

end


if (BAYMax == y_r7c1)
begin
    if (pmin == x_r7c1)
    begin
        if (r7c1 == 1)
        begin
            regen=1;
            r6c1 = 1;
            r5c1 = 1;
        end
    end

    if (pmin == x_r7c2)
    begin
        if (r7c2 == 1)
        begin
            regen=1;
            r6c2 = 1;
            r5c2 = 1;
        end
    end

    if (pmin == x_r7c3)
    begin
        if (r7c3 == 1)
        begin
            regen=1;
            r6c3 = 1;
            r5c3 = 1;
        end
    end

    if (pmin == x_r7c4)
    begin
        if (r7c4 == 1)
        begin
            regen=1;
            r6c4 = 1;
            r5c4 = 1;
        end
    end

    if (pmin == x_r7c5)
    begin
        if (r7c5 == 1)
        begin
            regen=1;
            r6c5 = 1;
            r5c5 = 1;
        end
    end

end


if (BAYMax == y_r8c1)
begin
    if (pmin == x_r8c1)
    begin
        if (r8c1 == 1)
        begin
            regen=1;
            r7c1 = 1;
            r6c1 = 1;
        end
    end

    if (pmin == x_r8c2)
    begin
        if (r8c2 == 1)
        begin
            regen=1;
            r7c2 = 1;
            r6c2 = 1;
        end
    end

    if (pmin == x_r8c3)
    begin
        if (r8c3 == 1)
        begin
            regen=1;
            r7c3 = 1;
            r6c3 = 1;
        end
    end

    if (pmin == x_r8c4)
    begin
        if (r8c4 == 1)
        begin
            regen=1;
            r7c4 = 1;
            r6c4 = 1;
        end
    end

    if (pmin == x_r8c5)
    begin
        if (r8c5 == 1)
        begin
            regen=1;
            r7c5 = 1;
            r6c5 = 1;
        end
    end

end


if (BAYMax == y_r9c1)
begin
    if (pmin == x_r9c1)
    begin
        if (r9c1 == 1)
        begin
            regen=1;
            r8c1 = 1;
            r7c1 = 1;
        end
    end

    if (pmin == x_r9c2)
    begin
        if (r9c2 == 1)
        begin
            regen=1;
            r8c2 = 1;
            r7c2 = 1;
        end
    end

    if (pmin == x_r9c3)
    begin
        if (r9c3 == 1)
        begin
            regen=1;
            r8c3 = 1;
            r7c3 = 1;
        end
    end

    if (pmin == x_r9c4)
    begin
        if (r9c4 == 1)
        begin
            regen=1;
            r8c4 = 1;
            r7c4 = 1;
        end
    end

    if (pmin == x_r9c5)
    begin
        if (r9c5 == 1)
        begin
            regen=1;
            r8c5 = 1;
            r7c5 = 1;
        end
    end

end


if (BAYMax == y_r10c1)
begin
    if (pmin == x_r10c1)
    begin
        if (r10c1 == 1)
        begin
            regen=1;
            r9c1 = 1;
            r8c1 = 1;
        end
    end

    if (pmin == x_r10c2)
    begin
        if (r10c2 == 1)
        begin
            regen=1;
            r9c2 = 1;
            r8c2 = 1;
        end
    end

    if (pmin == x_r10c3)
    begin
        if (r10c3 == 1)
        begin
            regen=1;
            r9c3 = 1;
            r8c3 = 1;
        end
    end

    if (pmin == x_r10c4)
    begin
        if (r10c4 == 1)
        begin
            regen=1;
            r9c4 = 1;
            r8c4 = 1;
        end
    end

    if (pmin == x_r10c5)
    begin
        if (r10c5 == 1)
        begin
            regen=1;
            r9c5 = 1;
            r8c5 = 1;
        end
    end

end


if (BAYMax == y_r11c1)
begin
    if (pmin == x_r11c1)
    begin
        if (r11c1 == 1)
        begin
            regen=1;
            r10c1 = 1;
            r9c1 = 1;
        end
    end

    if (pmin == x_r11c2)
    begin
        if (r11c2 == 1)
        begin
            regen=1;
            r10c2 = 1;
            r9c2 = 1;
        end
    end

    if (pmin == x_r11c3)
    begin
        if (r11c3 == 1)
        begin
            regen=1;
            r10c3 = 1;
            r9c3 = 1;
        end
    end

    if (pmin == x_r11c4)
    begin
        if (r11c4 == 1)
        begin
            regen=1;
            r10c4 = 1;
            r9c4 = 1;
        end
    end

    if (pmin == x_r11c5)
    begin
        if (r11c5 == 1)
        begin
            regen=1;
            r10c5 = 1;
            r9c5 = 1;
        end
    end

end


if (BAYMax == y_r12c1)
begin
    if (pmin == x_r12c1)
    begin
        if (r12c1 == 1)
        begin
            regen=1;
            r11c1 = 1;
            r10c1 = 1;
        end
    end

    if (pmin == x_r12c2)
    begin
        if (r12c2 == 1)
        begin
            regen=1;
            r11c2 = 1;
            r10c2 = 1;
        end
    end

    if (pmin == x_r12c3)
    begin
        if (r12c3 == 1)
        begin
            regen=1;
            r11c3 = 1;
            r10c3 = 1;
        end
    end

    if (pmin == x_r12c4)
    begin
        if (r12c4 == 1)
        begin
            regen=1;
            r11c4 = 1;
            r10c4 = 1;
        end
    end

    if (pmin == x_r12c5)
    begin
        if (r12c5 == 1)
        begin
            regen=1;
            r11c5 = 1;
            r10c5 = 1;
        end
    end

end
                                BAYMin <= BAYMin + 1;
                                BAYMax <= BAYMax + 1;
                                counter = 0;
                           end
                        else
                           begin
                                counter=counter+2;
                           end
                    end
                else
                    begin
                        red <= 4'hF; 
                        blue <= 4'hF; 
                        green <= 4'hF; 
                    end
            end    

if (r1c1==1)
begin
    if(pixel_x > x_r1c1 & pixel_x < x_r1c1+14 & pixel_y > y_r1c1 & pixel_y < y_r1c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r1c2==1)
begin
    if(pixel_x > x_r1c2 & pixel_x < x_r1c2+14 & pixel_y > y_r1c2 & pixel_y < y_r1c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r1c3==1)
begin
    if(pixel_x > x_r1c3 & pixel_x < x_r1c3+14 & pixel_y > y_r1c3 & pixel_y < y_r1c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r1c4==1)
begin
    if(pixel_x > x_r1c4 & pixel_x < x_r1c4+14 & pixel_y > y_r1c4 & pixel_y < y_r1c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r1c5==1)
begin
    if(pixel_x > x_r1c5 & pixel_x < x_r1c5+14 & pixel_y > y_r1c5 & pixel_y < y_r1c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r2c1==1)
begin
    if(pixel_x > x_r2c1 & pixel_x < x_r2c1+14 & pixel_y > y_r2c1 & pixel_y < y_r2c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r2c2==1)
begin
    if(pixel_x > x_r2c2 & pixel_x < x_r2c2+14 & pixel_y > y_r2c2 & pixel_y < y_r2c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r2c3==1)
begin
    if(pixel_x > x_r2c3 & pixel_x < x_r2c3+14 & pixel_y > y_r2c3 & pixel_y < y_r2c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r2c4==1)
begin
    if(pixel_x > x_r2c4 & pixel_x < x_r2c4+14 & pixel_y > y_r2c4 & pixel_y < y_r2c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r2c5==1)
begin
    if(pixel_x > x_r2c5 & pixel_x < x_r2c5+14 & pixel_y > y_r2c5 & pixel_y < y_r2c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r3c1==1)
begin
    if(pixel_x > x_r3c1 & pixel_x < x_r3c1+14 & pixel_y > y_r3c1 & pixel_y < y_r3c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r3c2==1)
begin
    if(pixel_x > x_r3c2 & pixel_x < x_r3c2+14 & pixel_y > y_r3c2 & pixel_y < y_r3c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r3c3==1)
begin
    if(pixel_x > x_r3c3 & pixel_x < x_r3c3+14 & pixel_y > y_r3c3 & pixel_y < y_r3c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r3c4==1)
begin
    if(pixel_x > x_r3c4 & pixel_x < x_r3c4+14 & pixel_y > y_r3c4 & pixel_y < y_r3c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r3c5==1)
begin
    if(pixel_x > x_r3c5 & pixel_x < x_r3c5+14 & pixel_y > y_r3c5 & pixel_y < y_r3c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r4c1==1)
begin
    if(pixel_x > x_r4c1 & pixel_x < x_r4c1+14 & pixel_y > y_r4c1 & pixel_y < y_r4c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r4c2==1)
begin
    if(pixel_x > x_r4c2 & pixel_x < x_r4c2+14 & pixel_y > y_r4c2 & pixel_y < y_r4c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r4c3==1)
begin
    if(pixel_x > x_r4c3 & pixel_x < x_r4c3+14 & pixel_y > y_r4c3 & pixel_y < y_r4c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r4c4==1)
begin
    if(pixel_x > x_r4c4 & pixel_x < x_r4c4+14 & pixel_y > y_r4c4 & pixel_y < y_r4c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r4c5==1)
begin
    if(pixel_x > x_r4c5 & pixel_x < x_r4c5+14 & pixel_y > y_r4c5 & pixel_y < y_r4c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r5c1==1)
begin
    if(pixel_x > x_r5c1 & pixel_x < x_r5c1+14 & pixel_y > y_r5c1 & pixel_y < y_r5c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r5c2==1)
begin
    if(pixel_x > x_r5c2 & pixel_x < x_r5c2+14 & pixel_y > y_r5c2 & pixel_y < y_r5c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r5c3==1)
begin
    if(pixel_x > x_r5c3 & pixel_x < x_r5c3+14 & pixel_y > y_r5c3 & pixel_y < y_r5c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r5c4==1)
begin
    if(pixel_x > x_r5c4 & pixel_x < x_r5c4+14 & pixel_y > y_r5c4 & pixel_y < y_r5c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r5c5==1)
begin
    if(pixel_x > x_r5c5 & pixel_x < x_r5c5+14 & pixel_y > y_r5c5 & pixel_y < y_r5c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r6c1==1)
begin
    if(pixel_x > x_r6c1 & pixel_x < x_r6c1+14 & pixel_y > y_r6c1 & pixel_y < y_r6c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r6c2==1)
begin
    if(pixel_x > x_r6c2 & pixel_x < x_r6c2+14 & pixel_y > y_r6c2 & pixel_y < y_r6c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r6c3==1)
begin
    if(pixel_x > x_r6c3 & pixel_x < x_r6c3+14 & pixel_y > y_r6c3 & pixel_y < y_r6c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r6c4==1)
begin
    if(pixel_x > x_r6c4 & pixel_x < x_r6c4+14 & pixel_y > y_r6c4 & pixel_y < y_r6c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r6c5==1)
begin
    if(pixel_x > x_r6c5 & pixel_x < x_r6c5+14 & pixel_y > y_r6c5 & pixel_y < y_r6c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r7c1==1)
begin
    if(pixel_x > x_r7c1 & pixel_x < x_r7c1+14 & pixel_y > y_r7c1 & pixel_y < y_r7c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r7c2==1)
begin
    if(pixel_x > x_r7c2 & pixel_x < x_r7c2+14 & pixel_y > y_r7c2 & pixel_y < y_r7c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r7c3==1)
begin
    if(pixel_x > x_r7c3 & pixel_x < x_r7c3+14 & pixel_y > y_r7c3 & pixel_y < y_r7c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r7c4==1)
begin
    if(pixel_x > x_r7c4 & pixel_x < x_r7c4+14 & pixel_y > y_r7c4 & pixel_y < y_r7c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r7c5==1)
begin
    if(pixel_x > x_r7c5 & pixel_x < x_r7c5+14 & pixel_y > y_r7c5 & pixel_y < y_r7c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r8c1==1)
begin
    if(pixel_x > x_r8c1 & pixel_x < x_r8c1+14 & pixel_y > y_r8c1 & pixel_y < y_r8c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r8c2==1)
begin
    if(pixel_x > x_r8c2 & pixel_x < x_r8c2+14 & pixel_y > y_r8c2 & pixel_y < y_r8c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r8c3==1)
begin
    if(pixel_x > x_r8c3 & pixel_x < x_r8c3+14 & pixel_y > y_r8c3 & pixel_y < y_r8c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r8c4==1)
begin
    if(pixel_x > x_r8c4 & pixel_x < x_r8c4+14 & pixel_y > y_r8c4 & pixel_y < y_r8c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r8c5==1)
begin
    if(pixel_x > x_r8c5 & pixel_x < x_r8c5+14 & pixel_y > y_r8c5 & pixel_y < y_r8c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r9c1==1)
begin
    if(pixel_x > x_r9c1 & pixel_x < x_r9c1+14 & pixel_y > y_r9c1 & pixel_y < y_r9c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r9c2==1)
begin
    if(pixel_x > x_r9c2 & pixel_x < x_r9c2+14 & pixel_y > y_r9c2 & pixel_y < y_r9c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r9c3==1)
begin
    if(pixel_x > x_r9c3 & pixel_x < x_r9c3+14 & pixel_y > y_r9c3 & pixel_y < y_r9c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r9c4==1)
begin
    if(pixel_x > x_r9c4 & pixel_x < x_r9c4+14 & pixel_y > y_r9c4 & pixel_y < y_r9c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r9c5==1)
begin
    if(pixel_x > x_r9c5 & pixel_x < x_r9c5+14 & pixel_y > y_r9c5 & pixel_y < y_r9c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r10c1==1)
begin
    if(pixel_x > x_r10c1 & pixel_x < x_r10c1+14 & pixel_y > y_r10c1 & pixel_y < y_r10c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r10c2==1)
begin
    if(pixel_x > x_r10c2 & pixel_x < x_r10c2+14 & pixel_y > y_r10c2 & pixel_y < y_r10c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r10c3==1)
begin
    if(pixel_x > x_r10c3 & pixel_x < x_r10c3+14 & pixel_y > y_r10c3 & pixel_y < y_r10c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r10c4==1)
begin
    if(pixel_x > x_r10c4 & pixel_x < x_r10c4+14 & pixel_y > y_r10c4 & pixel_y < y_r10c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r10c5==1)
begin
    if(pixel_x > x_r10c5 & pixel_x < x_r10c5+14 & pixel_y > y_r10c5 & pixel_y < y_r10c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r11c1==1)
begin
    if(pixel_x > x_r11c1 & pixel_x < x_r11c1+14 & pixel_y > y_r11c1 & pixel_y < y_r11c1+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r11c2==1)
begin
    if(pixel_x > x_r11c2 & pixel_x < x_r11c2+14 & pixel_y > y_r11c2 & pixel_y < y_r11c2+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r11c3==1)
begin
    if(pixel_x > x_r11c3 & pixel_x < x_r11c3+14 & pixel_y > y_r11c3 & pixel_y < y_r11c3+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r11c4==1)
begin
    if(pixel_x > x_r11c4 & pixel_x < x_r11c4+14 & pixel_y > y_r11c4 & pixel_y < y_r11c4+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end

end


if (r11c5==1)
begin
    if(pixel_x > x_r11c5 & pixel_x < x_r11c5+14 & pixel_y > y_r11c5 & pixel_y < y_r11c5+14)
    begin
        red<=4'hC;
        green<=4'hC;
        blue<=4'hC;
    end
    
end

//WINNING AND LOSING CONDITIONS

if((pmin<279 || pmin+14>361 ) & BAYMax > 260)
begin
    lost = 1;
end

if(r1c1 == 1 || r1c2 == 1 || r1c3 == 1 || r1c4 == 1 || r1c5 == 1)
begin
    if(r3c1 == 1 & r3c2 == 1 & r3c3 == 1 & r3c4 == 1 & r3c5 == 1)
    begin
        won = 1;
    end
    
    else
    begin
        lost = 1;
    end    
end

end

else if(UP == 1 & won == 1 & lost==0)
begin
//Pixel screen won
     blue <= video_on?((pixel_x >= 180 & pixel_x <= 200 & pixel_y > 140 & pixel_y < 340 ) ||(pixel_x >= 220 & pixel_x <= 240 & pixel_y > 240 & pixel_y < 280 ) || (pixel_x >= 200 & pixel_x <= 220 & pixel_y > 280 & pixel_y < 320 ) || (pixel_x >= 240 & pixel_x <= 260 & pixel_y > 240 & pixel_y < 280 ) || (pixel_x >= 260 & pixel_x <= 280 & pixel_y > 280 & pixel_y < 320 ) || (pixel_x >= 280 & pixel_x <= 300 & pixel_y > 140 & pixel_y < 340) || (pixel_x >= 320 & pixel_x <= 400 & pixel_y > 140 & pixel_y < 340 ) || (pixel_x >= 420 & pixel_x <= 440 & pixel_y > 140 & pixel_y < 340 ) || (pixel_x >= 480 & pixel_x <= 500 & pixel_y > 140 & pixel_y < 340 ) || (pixel_x >= 440 & pixel_x <= 460 & pixel_y > 190 & pixel_y < 240 ) || (pixel_x >= 460 & pixel_x <= 480 & pixel_y > 240 & pixel_y < 290 ))?4'hf:4'h0:4'h0;
            green <= video_on?4'hc:4'h0;
            red <= video_on?4'hf:4'h0;
end

else if(UP == 1 & won == 0 & lost==1)
begin
//Pixel screen lost
      if ((pixel_x > 600)|| (pixel_x < 40) || (pixel_y > 440) || (pixel_y <40))
                begin
                red <= 4'h0;    
                green <= 4'h1;    
                blue <= 4'h0;    
                end
    
       else if (
         
           ( pixel_x>=119 && pixel_x<=210 && pixel_y>=130 && pixel_y<=150 ) ||
            ( pixel_x>=119 && pixel_x<=139 && pixel_y>=130 && pixel_y<=230 )||
           ( pixel_x>=119 && pixel_x<=210 && pixel_y>=210 && pixel_y<=230 )||
           ( pixel_x>=190 && pixel_x<=210 && pixel_y>=160 && pixel_y<=230 )||
            ( pixel_x>=169 && pixel_x<=210 && pixel_y>=160 && pixel_y<=180 )|| 
            
                   ( pixel_x>=219 && pixel_x<=310 && pixel_y>=130 && pixel_y<=150 )||
            ( pixel_x>=219 && pixel_x<=239 && pixel_y>=130 && pixel_y<=230 )||
            ( pixel_x>=290 && pixel_x<=310 && pixel_y>=130 && pixel_y<=230 )||
           ( pixel_x>=219 && pixel_x<=310 && pixel_y>=170 && pixel_y<=190 )||
           
                   ( pixel_x>=319 && pixel_x<=410 && pixel_y>=130 && pixel_y<=150 )||
            ( pixel_x>=319 && pixel_x<=339 && pixel_y>=130 && pixel_y<=230 )||
           ( pixel_x>=354 && pixel_x<=374 && pixel_y>=130 && pixel_y<=180 )||
           ( pixel_x>=390 && pixel_x<=410 && pixel_y>=130 && pixel_y<=230 )||
           
                  ( pixel_x>=419 && pixel_x<=510 && pixel_y>=130 && pixel_y<=150 )||
           ( pixel_x>=419 && pixel_x<=439 && pixel_y>=130 && pixel_y<=230 )||
           ( pixel_x>=419 && pixel_x<=469 && pixel_y>=170 && pixel_y<=190 )||
           (pixel_x>=419 && pixel_x<=510 && pixel_y>=210 && pixel_y<=230 )||
           
                  ( pixel_x>=119 && pixel_x<=210 && pixel_y>=250 && pixel_y<=270 )||
           ( pixel_x>=119 && pixel_x<=139 && pixel_y>=250 && pixel_y<=350 )||
            (pixel_x>=119 && pixel_x<=169 && pixel_y>=290 && pixel_y<=310 )||
           ( pixel_x>=119 && pixel_x<=210 && pixel_y>=330 && pixel_y<=350 )||
           
                  ( pixel_x>=219 && pixel_x<=310 && pixel_y>=250 && pixel_y<=270 ) ||
           ( pixel_x>=219 && pixel_x<=239 && pixel_y>=250 && pixel_y<=350 ) ||
           ( pixel_x>=290 && pixel_x<=310 && pixel_y>=250 && pixel_y<=350 )||
           
                   ( pixel_x>=319 && pixel_x<=410 && pixel_y>=250 && pixel_y<=270 ) ||
           ( pixel_x>=319 && pixel_x<=339 && pixel_y>=250 && pixel_y<=350 ) ||
           ( pixel_x>=319 && pixel_x<=410 && pixel_y>=320 && pixel_y<=350 )||
            ( pixel_x>=390 && pixel_x<=410 && pixel_y>=250 && pixel_y<=350 )          
            
       )
       begin 
        red <= 4'hF;    
        green <= 4'h0;    
        blue <= 4'h3; 
       end
       
       else
        begin
            red <= 4'hF; 
            blue <= 4'hF; 
            green <= 4'hF; 
        end
end

 else if(UP == 0)
 begin
    if ((pixel_x<=40 & pixel_x>=20 & pixel_y >=40 & pixel_y <=140) || (pixel_x<=60 & pixel_x>=40 & pixel_y >=120 & pixel_y <=140)|| (pixel_x<=100 & pixel_x>=80 & pixel_y >=40 & pixel_y <=140) || (pixel_x<=120 & pixel_x>=100 & pixel_y >=40 & pixel_y <=60) || (pixel_x<=120 & pixel_x>=100 & pixel_y >=120 & pixel_y <=140) || (pixel_x<=140 &
    pixel_x>=120 & pixel_y >=40 & pixel_y <=140)|| (pixel_x<=220 & pixel_x>=160 & pixel_y >=40
    & pixel_y <=60) || (pixel_x<=180 & pixel_x>=160 & pixel_y >=40 & pixel_y <=140) ||
     (pixel_x<=220 & pixel_x>=160 & pixel_y >=120 & pixel_y <=140) ||
    (pixel_x<=220 & pixel_x>=200 & pixel_y >=100 & pixel_y <=120)|| (pixel_x<=260 &
    pixel_x>=240 & pixel_y >=40 & pixel_y <=140) || (pixel_x<=340 & pixel_x>=280 & pixel_y
    >=40 & pixel_y <=60) ||
     (pixel_x<=300 & pixel_x>=280 & pixel_y >=40 & pixel_y <=140) || (pixel_x<=340
    & pixel_x>=280 & pixel_y >=120 & pixel_y <=140)|| (pixel_x<=380 & pixel_x>=360 & pixel_y
    >=40 & pixel_y <=140) || (pixel_x<=460 & pixel_x>=400 & pixel_y >=40 & pixel_y <=60)||
     (pixel_x<=420 & pixel_x>=400 & pixel_y >=40 & pixel_y <=140) ||
    (pixel_x<=460 & pixel_x>=440 & pixel_y >=40 & pixel_y <=140)|| (pixel_x<=440 &
    pixel_x>=420 & pixel_y >=80 & pixel_y <=100) || (pixel_x<=540 & pixel_x>=480 & pixel_y
    >=40 & pixel_y <=60) ||
     (pixel_x<=500 & pixel_x>=480 & pixel_y >=40 & pixel_y <=140) || (pixel_x<=540
    & pixel_x>=520 & pixel_y >=40 & pixel_y <=140)|| (pixel_x<=620 & pixel_x>=560 & pixel_y
    >=40 & pixel_y <=60) || (pixel_x<=580 & pixel_x>=560 & pixel_y >=60 & pixel_y <=80) ||
     (pixel_x<=620 & pixel_x>=560 & pixel_y >=80 & pixel_y <=100) ||
   (pixel_x<=620 & pixel_x>=600 & pixel_y >=100 & pixel_y <=120)|| (pixel_x<=620 & pixel_x>=560 & pixel_y >=120 & pixel_y <=140))
   begin 
           red <= 4'h0; 
           blue <= 4'h9; 
           green <= 4'h8; 
   end
   
   else if (pixel_x<430 & pixel_x>210 & pixel_y >330 & pixel_y <430)
   begin
        if((pixel_x<260 & pixel_x>220 & ((pixel_y >340 & pixel_y <350) || (pixel_y >370 & pixel_y <380))) || (pixel_x<230 & pixel_x>220 & pixel_y >340 & pixel_y <420) || (pixel_x<260 & pixel_x>250 & pixel_y >340 & pixel_y <380)
        || (pixel_x<280 & pixel_x>270 & pixel_y >340 & pixel_y <420) || (pixel_x<310 & pixel_x>270 & pixel_y >410 & pixel_y <420) || (pixel_x<330 & pixel_x>320 & pixel_y >340 & pixel_y <420) || (pixel_x<360 & pixel_x>320 & pixel_y >340 & pixel_y <350) || (pixel_x<360 & pixel_x>320 & pixel_y >380 & pixel_y <390)
        || (pixel_x<360 & pixel_x>350 & pixel_y >340 & pixel_y <420) || (pixel_x<380 & pixel_x>370 & pixel_y >340 & pixel_y <380) || (pixel_x<420 & pixel_x>370 & pixel_y >370 & pixel_y <380) || (pixel_x<420 & pixel_x>410 & pixel_y >340 & pixel_y <380) || (pixel_x<400 & pixel_x>390 & pixel_y >370 & pixel_y <420) )
            begin
                red <= 4'hF;   
                blue <= 4'hF;  
                green <= 4'hF;
            end
        else
            begin
                red <= 4'hF;   
                blue <= 4'h0;  
                green <= 4'h0;
            end        
   end
   
   else
   begin 
            red <= 4'h0;   
            blue <= 4'h0;  
            green <= 4'h0;
   end
end
endmodule
