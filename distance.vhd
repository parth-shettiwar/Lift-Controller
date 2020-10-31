library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity distance is
    Port ( p1 : in  STD_LOGIC_VECTOR (4 downto 0);
				p2 : in  STD_LOGIC_VECTOR (4 downto 0);
				p3 : in  STD_LOGIC_VECTOR (4 downto 0);
				h:in std_logic_vector(1 downto 0);	
					
           Lift:in std_logic_vector(4 downto 0);
            dir:out std_logic_vector(1 downto 0);
			  floor:out std_logic_vector(4 downto 0));       
end entity;

architecture Behavioral of distance is


begin
process(p1,p2,p3,Lift)
begin

if(Lift="00001") then
floor<="00001";
	dir<="00";
 if(p3(0)='1' or p2(0)='1' or p1(0)='1') then
   floor<="00001";
	dir<="00";
  elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
   floor<="00010";
	dir<="10";
  elsif(p3(2)='1' or p2(2)='1' or p1(2)='1') then	
    floor<="00100";
	dir<="10";
	elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
    floor<="01000";
	dir<="10";
 elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
    floor<="10000";
	dir<="10";

	
	
	end if;
	end if;
 if(Lift="00010") then
 floor<="00010";
	dir<="00";
  if(h="00") then
    if(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	  floor<="00010";
	  dir<="00";
	 elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
   floor<="00001";
	dir<="01";
	elsif(p3(2)='1' or p2(2)='1' or p1(2)='1') then	
    floor<="00100";
	dir<="10";
	elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
    floor<="01000";
	dir<="10";
 elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
    floor<="10000";
	dir<="10";
	
	
	end if;
	
	elsif(h="01") then
	  if(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	  floor<="00010";
	  dir<="01";
	  elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
	  floor<="00001";
	  dir<="01";
	  elsif(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	    floor<="00100";
	    dir<="10";
	  elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
       floor<="01000";
	    dir<="10";
     elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
       floor<="10000";
	    dir<="10"; 
		 

	end if;

	elsif(h="10") then
	  if(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	  floor<="00010";
	  dir<="10";
	  elsif(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	  floor<="00100";
	  dir<="10";
	   elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
       floor<="01000";
	    dir<="10";
     elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
       floor<="10000";
	    dir<="10"; 
	  elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
	    floor<="00001";
	    dir<="01";
	
	 end if;
	end if;
	end if;
	
 if(Lift="00100") then
 
	floor<="00100";
	dir<="00";
  if(h="00") then
    if(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	  floor<="00100";
	  dir<="00";
	 elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
   floor<="00010";
	dir<="01";
	
	elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
    floor<="01000";
	dir<="10";
	elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then	
    floor<="00001";
	dir<="01";
 elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
    floor<="10000";
	dir<="10";

	end if;
	
	elsif(h="01") then
	  if(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	  floor<="00100";
	  dir<="01";
	  elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	    floor<="00010";
	    dir<="01";
	  elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
	  floor<="00001";
	  dir<="01";
	  
	  elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
       floor<="01000";
	    dir<="10";
     elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
       floor<="10000";
	    dir<="10"; 
	
	end if;

	elsif(h="10") then
	  if(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	  floor<="00100";
	  dir<="10";
	  elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
       floor<="01000";
	    dir<="10";
     elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
       floor<="10000";
	    dir<="10"; 
	  elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	  floor<="00010";
	  dir<="01";
	   
	  elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
	    floor<="00001";
	    dir<="01";
	
	 end if;
	end if;
	end if;
	
	
	
	
	
	
	 if(Lift="01000") then
	 
	
	floor<="01000";
	dir<="00";
  if(h="00") then
    if(p3(3)='1' or p2(3)='1' or p1(3)='1') then
	  floor<="01000";
	  dir<="00";
	  elsif(p3(2)='1' or p2(2)='1' or p1(2)='1')	then
    floor<="00100";
	dir<="01";
	elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
    floor<="10000";
	dir<="10";
	 elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
   floor<="00010";
	dir<="01";
	
	
	elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then	
    floor<="00001";
	dir<="01";
 

	end if;
	
	elsif(h="01") then
	elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
       floor<="01000";
	    dir<="01";
	  if(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	  floor<="00100";
	  dir<="01";
	  elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	    floor<="00010";
	    dir<="01";
	  elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
	  floor<="00001";
	  dir<="01";
	  
	  
     elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
       floor<="10000";
	    dir<="10"; 
	
	end if;

	elsif(h="10") then
	  elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
       floor<="01000";
	    dir<="10";
	 
	  elsif(p3(4)='1' or p2(4)='1' or p1(4)='1')	then
       floor<="10000";
	    dir<="10"; 
	   if(p3(2)='1' or p2(2)='1' or p1(2)='1') then
	  floor<="00100";
	  dir<="01";
     
	  elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
	  floor<="00010";
	  dir<="01";
	   
	  elsif(p3(0)='1' or p2(0)='1' or p1(0)='1') then
	    floor<="00001";
	    dir<="01";

	 end if;
	end if;
	end if;

 if(Lift="10000") then

	floor<="00001";
	dir<="00";
 if(p3(4)='1' or p2(4)='1' or p1(4)='1') then
   floor<="10000";
	dir<="00";
	elsif(p3(3)='1' or p2(3)='1' or p1(3)='1')	then
    floor<="01000";
	dir<="01";
	 elsif(p3(2)='1' or p2(2)='1' or p1(2)='1') then	
    floor<="00100";
	dir<="01";
  elsif(p3(1)='1' or p2(1)='1' or p1(1)='1') then
   floor<="00010";
	dir<="01";
 
	
 elsif(p3(0)='1' or p2(0)='1' or p1(0)='1')	then
    floor<="00001";
	dir<="10";

	
	end if;
	end if;




end process;
end Behavioral;
