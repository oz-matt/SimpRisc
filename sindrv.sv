module sindrv(mdriver_int.master io);

  bit wstate;
  
  always @(posedge io.clk) begin
    if (!io.nreset)
	wstate <= 0;
	else begin
  if (io.fin)
	wstate <= 0;
  else
	wstate <= 1;
  end
  end

  always @(posedge io.clk) begin
    if (!io.nreset);
	else begin
    case (wstate)
      0: begin
        io.we <= 1;
        io.si_address <= 0;
        io.si_data <= 'hb4b4b4b4;
        io.exec <= 1; 
      end
      1: begin
        io.exec <= 0; 
      end
    endcase
    end
  end
	
endmodule

