% Behavior model for ADDER1
% 12-bits input, 12-bits output

clear;

reg1=zeros(12,1);
reg2=zeros(12,1);
reg1=[0 0 0 0 0 0 0 0 0 0 0 1];
reg2=[0 0 0 0 0 0 0 0 1 0 0 1];
fb=zeros(12,1);
fb=[1 0 0 1 0 0 1 0 0 0 0 1];

bw=length(fb);

n_cycle=100;
out_file = fopen('adder.results','w');

z(1) = sum(reg1.*2.^(numel(reg1)-1:-1:0));
y(1) = sum(reg2.*2.^(numel(reg2)-1:-1:0));
for i=1:n_cycle
   fb_sum_out1=0;
   xor_out1=0;
   fb_sum_out2=0;
   xor_out2=0;
   for j=1:bw
      if fb(j)==1 
         fb_sum_out1=fb_sum_out1+reg1(j);
         fb_sum_out2=fb_sum_out2+reg2(j);
      end
   end
   xor_out1 = mod(fb_sum_out1, 2);
   reg1 = [reg1(2:bw) xor_out1];
   z(i+1) = sum(reg1.*2.^(numel(reg1)-1:-1:0));
   xor_out2 = mod(fb_sum_out2, 2);
   reg2 = [reg2(2:bw) xor_out2];
   y(i+1) = sum(reg2.*2.^(numel(reg2)-1:-1:0));
   if (z(i)+y(i))>=4096
      fprintf(out_file,'%d\n',z(i)+y(i)-4096);
   else
      fprintf(out_file,'%d\n',z(i)+y(i));
   end
end  

fclose(out_file);
exit;


